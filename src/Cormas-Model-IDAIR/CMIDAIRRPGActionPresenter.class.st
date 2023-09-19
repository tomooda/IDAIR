Class {
	#name : #CMIDAIRRPGActionPresenter,
	#superclass : #SpPresenterWithModel,
	#instVars : [
		'playerList',
		'barChart',
		'citizenActionList',
		'policyMakerActionList',
		'citizenActionYesButton',
		'citizenActionNoButton',
		'policyMakerActionButton'
	],
	#category : #'Cormas-Model-IDAIR-Contact-RPG'
}

{ #category : #specs }
CMIDAIRRPGActionPresenter class >> defaultSpec [

	<script: 'CMIDAIRRPGContactModel new asPresenter openWithSpec'>
	| citizenSpec policyMakerSpec |
	citizenSpec := SpBoxLayout newVertical
		               add: (SpBoxLayout newHorizontal
				                add: 'Citizen''s Actions' asPresenter
				                width: 200)
		               height: self labelHeight + 5;
		               yourself.
	citizenSpec add: (SpBoxLayout newHorizontal
			 add: (SpPanedLayout newVertical
					  positionOfSlider: 0.5;
					  add: #playerList;
					  add: (SpBoxLayout newVertical
							   add: #citizenActionList;
							   add: (SpBoxLayout newHorizontal
									    add: #citizenActionYesButton;
									    add: #citizenActionNoButton;
									    yourself)
							   expand: false))
			 width: 400;
			 add: ' ' asPresenter width: 20;
			 add: #barChart width: 100).

	policyMakerSpec := SpBoxLayout newVertical
		                   add: (SpBoxLayout newHorizontal
				                    add: 'Policy Maker''s Actions' asPresenter
				                    width: 200)
		                   height: self labelHeight + 5;
		                   yourself.
	policyMakerSpec
		add: #policyMakerActionList;
		add: #policyMakerActionButton expand: false.
	^ SpBoxLayout newVertical
		  add: (SpBoxLayout newHorizontal
				   add: citizenSpec expand: false;
				   add: '    ' asPresenter width: 50;
				   add: policyMakerSpec expand: false);
		  yourself
]

{ #category : #operations }
CMIDAIRRPGActionPresenter >> askEffectiveRate [

	(UIManager default
		 request: 'Effective rate among citizens?'
		 initialAnswer: '1.0') ifNotNil: [ :answer | 
		[ 
		| rate |
		rate := answer asFloat.
		(rate between: 0.0 and: 1.0) ifTrue: [ ^ rate ] ] ].
	^ nil
]

{ #category : #accessing }
CMIDAIRRPGActionPresenter >> citizen [

	^ playerList selectedItem ifNotNil: #value
]

{ #category : #operations }
CMIDAIRRPGActionPresenter >> citizenPlay: aString factor: aNumberOrSymbol wellbeing: anInteger [

	self citizen ifNotNil: [ :citizen | 
		citizen contactProfile
			actionName: aString;
			addToWellbeingPoints: anInteger.
		aNumberOrSymbol isSymbol
			ifTrue: [ citizen contactProfile perform: aNumberOrSymbol asSymbol ]
			ifFalse: [ 
			citizen contactProfile actionFactor: aNumberOrSymbol asFloat ].
		playerList refresh ]
]

{ #category : #operations }
CMIDAIRRPGActionPresenter >> clearRound [

	self model ifNotNil: #clearRound.
	playerList refresh
]

{ #category : #accessing }
CMIDAIRRPGActionPresenter >> diseaseDynamicsAndPopulation [

	^ self citizen
		  ifNotNil: [ :citizen | 
			  | histogram |
			  histogram := OrderedDictionary new.
			  citizen diseaseDynamics class colors keysDo: [ :dynamics | 
				  histogram at: dynamics put: 0 ].
			  citizen cormasModel theCitizens do: [ :c | 
				  c contactProfile player == citizen ifTrue: [ 
					  | name |
					  name := c diseaseDynamics name.
					  histogram at: name put: (histogram at: name) + 1 ] ].
			  histogram ]
		  ifNil: [ OrderedDictionary new ]
]

{ #category : #drawing }
CMIDAIRRPGActionPresenter >> drawBarChart: aCanvas [

	aCanvas color: Color transparent.

	self diseaseDynamicsAndPopulation ifNotNil: [ :amounts | 
		amounts ifNotEmpty: [ 
			| chart |
			chart := RSChart new.
			chart extent: 60 @ 400.
			chart container: aCanvas.
			chart maxValueY: amounts values sum.
			chart colors: (NSScale ordinal range:
					 self citizen diseaseDynamics class colors values).
			amounts values inject: 0 into: [ :bottom :value | 
				(chart barHeights: { value }) bottom: { bottom }.
				bottom + value ].
			chart addDecoration: (RSVerticalTick new
					 fontSize: 12;
					 integer;
					 yourself).
			"chart addDecoration: (RSChartTitleDecoration new
					 title: (self playerName ifNil: [ '-' ]);
					 fontSize: 12;
					 yourself)."
			chart build.
			RSZoomToFitCanvasInteraction new zoomToFitOnStart: aCanvas ] ]
]

{ #category : #initialization }
CMIDAIRRPGActionPresenter >> initializePresenters [

	playerList := self newTable
		              beResizable;
		              addColumn:
			              ((SpStringTableColumn
				                title: 'name'
				                evaluated: [ :assoc | assoc key ]) width: 140);
		              addColumn: ((SpStringTableColumn
				                title: 'well-being'
				                evaluated: [ :assoc | 
					                assoc value contactProfile wellbeingPoints
						                printString ]) width: 70);
		              addColumn: (SpStringTableColumn
				               title: 'action'
				               evaluated: [ :assoc | 
					               assoc value contactProfile actionName ]);
		              whenSelectionChangedDo: [ self playerChanged ];
		              yourself.
	barChart := self newRoassal script: [ :canvas | 
		            self drawBarChart: canvas ].
	citizenActionList := self newList
		                     display: [ :assoc | assoc key ];
		                     yourself.
	citizenActionYesButton := self newButton
		                          label: 'YES';
		                          action: [ self playCitizenActionYes ];
		                          yourself.
	citizenActionNoButton := self newButton
		                         label: 'NO';
		                         action: [ self playCitizenActionNo ];
		                         yourself.
	policyMakerActionList := self newList
		                         display: [ :assoc | assoc key ];
		                         yourself.
	policyMakerActionButton := self newButton
		                           label: 'YES';
		                           action: [ self playPolicyMakerAction ];
		                           yourself
]

{ #category : #initialization }
CMIDAIRRPGActionPresenter >> initializeWindow: aSpWindowPresenter [

	super initializeWindow: aSpWindowPresenter.
	aSpWindowPresenter initialExtent: 680 @ 600
]

{ #category : #accessing }
CMIDAIRRPGActionPresenter >> modelChanged [

	super modelChanged.
	self model cormasModel projectAnnouncer
		when: CMTimeChangedAnnouncement
		do: [ :announcement | barChart refresh ].
	self
		updatePlayerList;
		updateCitizenActionList;
		updatePolicyMakerActionList
]

{ #category : #operations }
CMIDAIRRPGActionPresenter >> playCitizenActionNo [

	citizenActionList selectedItem ifNotNil: [ :assoc | 
		self
			citizenPlay: assoc key , ' - NO'
			factor: assoc value second
			wellbeing: assoc value third negated ]
]

{ #category : #operations }
CMIDAIRRPGActionPresenter >> playCitizenActionYes [

	citizenActionList selectedItem ifNotNil: [ :assoc | 
		self
			citizenPlay: assoc key , ' - YES'
			factor: assoc value first
			wellbeing: assoc value third ]
]

{ #category : #operations }
CMIDAIRRPGActionPresenter >> playPolicyMakerAction [

	policyMakerActionList selectedItem ifNotNil: [ :assoc | 
		self policyMakerPlay: assoc value ]
]

{ #category : #updating }
CMIDAIRRPGActionPresenter >> playerChanged [

	barChart refresh
]

{ #category : #accessing }
CMIDAIRRPGActionPresenter >> playerName [

	^ playerList selectedItem ifNotNil: #key
]

{ #category : #operations }
CMIDAIRRPGActionPresenter >> policyMakerPlay: aNumberOrSymbol [

	self model ifNotNil: [ :contactModel | 
		aNumberOrSymbol isSymbol
			ifTrue: [ contactModel perform: aNumberOrSymbol asSymbol ]
			ifFalse: [ 
				self askEffectiveRate ifNotNil: [ :rate | 
					contactModel socialProfile factor:
						aNumberOrSymbol asFloat ** rate ] ] ]
]

{ #category : #api }
CMIDAIRRPGActionPresenter >> retrieveSpec: aSelector [

	| spec |
	spec := self perform: aSelector.
	spec isSpLayout ifTrue: [ spec selector: aSelector ].
	^ spec
]

{ #category : #accessing }
CMIDAIRRPGActionPresenter >> title [
	^ 'IDAIR RPG Actions'
]

{ #category : #updating }
CMIDAIRRPGActionPresenter >> updateCitizenActionList [

	citizenActionList items:
		self model citizenActionsAndFactors associations
]

{ #category : #updating }
CMIDAIRRPGActionPresenter >> updatePlayerList [

	playerList items: (self model
			 ifNotNil: [ :model | model players associations ]
			 ifNil: [ Array new ])
]

{ #category : #updating }
CMIDAIRRPGActionPresenter >> updatePolicyMakerActionList [

	policyMakerActionList items:
		self model policyMakerActionsAndFactors associations
]
