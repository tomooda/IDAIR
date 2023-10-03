Class {
	#name : #CMIDAIRRPGActionPresenter,
	#superclass : #SpPresenterWithModel,
	#instVars : [
		'playerList',
		'citizenActionList',
		'policyMakerActionList',
		'hospitalManagerActionList',
		'citizenActionYesButton',
		'citizenActionNoButton',
		'policyMakerActionButton',
		'hospitalManagerActionButton',
		'pendingPolicymakerActionList',
		'executePendingPolicymakerActionButton',
		'removePendingPolicymakerActionButton',
		'gamePresenter'
	],
	#category : #'Cormas-Model-IDAIR-RPG-UI'
}

{ #category : #specs }
CMIDAIRRPGActionPresenter class >> defaultSpec [

	<script: 'CMIDAIRRPGContactModel new asPresenter openWithSpec'>
	| citizenSpec policyMakerSpec hospitalManagerSpec |
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
			 width: 350).
	policyMakerSpec := SpBoxLayout newVertical
		                   add: (SpBoxLayout newHorizontal
				                    add: 'Policymaker''s Actions' asPresenter
				                    width: 200)
		                   height: self labelHeight + 5;
		                   add: 'Waiting for poll' expand: false;
		                   add: #pendingPolicymakerActionList
		                   height: self inputTextHeight * 5;
		                   add: (SpBoxLayout newHorizontal
				                    add: #removePendingPolicymakerActionButton
				                    width: 50;
				                    add: #executePendingPolicymakerActionButton
				                    expand: true)
		                   expand: false;
		                   add: '' asPresenter expand: false;
		                   add: 'New actions' expand: false;
		                   add: #policyMakerActionList;
		                   add: #policyMakerActionButton expand: false;
		                   yourself.

	hospitalManagerSpec := SpBoxLayout newVertical
		                       add: (SpBoxLayout newHorizontal
				                        add:
					                        'Hospital Manager''s Actions' asPresenter
				                        width: 200)
		                       height: self labelHeight + 5;
		                       add: #hospitalManagerActionList;
		                       add: #hospitalManagerActionButton
		                       expand: false;
		                       yourself.

	^ SpBoxLayout newVertical
		  add: (SpBoxLayout newHorizontal
				   add: citizenSpec expand: false;
				   add: '    ' asPresenter width: 10;
				   add: hospitalManagerSpec expand: false;
				   add: '    ' asPresenter width: 10;
				   add: policyMakerSpec expand: false);
		  yourself
]

{ #category : #accessing }
CMIDAIRRPGActionPresenter >> citizen [

	^ playerList selectedItem ifNotNil: #value
]

{ #category : #operations }
CMIDAIRRPGActionPresenter >> citizenPlay: action [

	self citizen ifNotNil: [ :citizen | 
		citizen contactProfile action: action.
		playerList refresh ]
]

{ #category : #operations }
CMIDAIRRPGActionPresenter >> clearRound [

	self model ifNotNil: #clearRound.
	self model cormasModel nextHistory.
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

{ #category : #accessing }
CMIDAIRRPGActionPresenter >> gamePresenter: aCMIDAIRRPGPresenter [

	gamePresenter := aCMIDAIRRPGPresenter
]

{ #category : #operations }
CMIDAIRRPGActionPresenter >> hospitalManagerPlay: aCMIDAIRRPGAction [

	self model ifNotNil: [ :contactModel | 
		contactModel cormasModel
			submodelAt: #resource
			do: [ :resourceModel | 
				aCMIDAIRRPGAction execute: resourceModel.
				gamePresenter ifNotNil: #updateResources ] ]
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
				                title: 'wbp'
				                evaluated: [ :assoc | 
					                assoc value contactProfile wellbeingPoints
						                printString ]) width: 40);
		              addColumn: (SpStringTableColumn
				               title: 'action'
				               evaluated: [ :assoc | 
					               assoc value contactProfile actionName ]);
		              addColumn: ((SpStringTableColumn
				                title: ''
				                evaluated: [ :assoc | 
					                assoc value contactProfile actionPostfix ]) 
				               width: 50);
		              whenSelectionChangedDo: [ self playerChanged ];
		              yourself.
	citizenActionList := self newList
		                     display: [ :assoc | assoc name ];
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
		                         display: [ :action | action name ];
		                         yourself.
	policyMakerActionButton := self newButton
		                           label: 'Yes';
		                           action: [ self pollPolicymakerAction ];
		                           yourself.
	hospitalManagerActionList := self newList
		                             display: [ :action | action name ];
		                             yourself.
	hospitalManagerActionButton := self newButton
		                               label: 'YES';
		                               action: [ 
			                               self playHospitalManagerAction ];
		                               yourself.
	pendingPolicymakerActionList := self newList
		                                display: [ :action | action name ];
		                                yourself.
	executePendingPolicymakerActionButton := self newButton
		                                         label: 'Poll';
		                                         action: [ 
			                                         self playPolicymakerAction ];
		                                         yourself.
	removePendingPolicymakerActionButton := self newButton
		                                        label: 'Cancel';
		                                        action: [ 
			                                        self
				                                        removePendingPolicymakerAction ];
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
	self
		updatePlayerList;
		updateCitizenActionList;
		updatePolicyMakerActionList;
		updateHospitalManagerActionList
]

{ #category : #operations }
CMIDAIRRPGActionPresenter >> playCitizenActionNo [

	citizenActionList selectedItem ifNotNil: [ :action | 
		self citizenPlay: action forNo ]
]

{ #category : #operations }
CMIDAIRRPGActionPresenter >> playCitizenActionYes [

	citizenActionList selectedItem ifNotNil: [ :action | 
		self citizenPlay: action forYes ]
]

{ #category : #operations }
CMIDAIRRPGActionPresenter >> playHospitalManagerAction [

	hospitalManagerActionList selectedItem ifNotNil: [ :action | 
		self hospitalManagerPlay: action ]
]

{ #category : #operations }
CMIDAIRRPGActionPresenter >> playPolicymakerAction [

	pendingPolicymakerActionList selectedItem ifNotNil: [ :action | 
		self policymakerPlay: action.
		pendingPolicymakerActionList items:
			(pendingPolicymakerActionList items copyWithout: action) ]
]

{ #category : #updating }
CMIDAIRRPGActionPresenter >> playerChanged [

	
]

{ #category : #accessing }
CMIDAIRRPGActionPresenter >> playerName [

	^ playerList selectedItem ifNotNil: #key
]

{ #category : #operations }
CMIDAIRRPGActionPresenter >> policymakerPlay: aCMIDAIRRPGAction [

	self model ifNotNil: [ :contactModel | 
		aCMIDAIRRPGAction isSocialAction
			ifTrue: [ aCMIDAIRRPGAction execute: contactModel ]
			ifFalse: [ 
				contactModel cormasModel
					submodelAt: #resource
					do: [ :resourceModel | aCMIDAIRRPGAction execute: resourceModel ].
				gamePresenter ifNotNil: #updateResources ] ]
]

{ #category : #operations }
CMIDAIRRPGActionPresenter >> pollPolicymakerAction [

	policyMakerActionList selectedItem ifNotNil: [ :action | 
		action isSocialAction
			ifTrue: [ 
				pendingPolicymakerActionList items:
					pendingPolicymakerActionList items , { action } ]
			ifFalse: [ self policymakerPlay: action ] ]
]

{ #category : #operations }
CMIDAIRRPGActionPresenter >> recordHistory: aText [

	self model cormasModel recordHistory: aText
]

{ #category : #operations }
CMIDAIRRPGActionPresenter >> removePendingPolicymakerAction [

	pendingPolicymakerActionList selectedItem ifNotNil: [ :action | 
		pendingPolicymakerActionList items:
			(pendingPolicymakerActionList items copyWithout: action) ]
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

	citizenActionList items: self model citizenActions
]

{ #category : #updating }
CMIDAIRRPGActionPresenter >> updateHospitalManagerActionList [

	hospitalManagerActionList items: self model hospitalManagerActions
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
		self model policymakerActions
]
