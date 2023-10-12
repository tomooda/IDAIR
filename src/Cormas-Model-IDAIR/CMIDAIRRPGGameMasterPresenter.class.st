Class {
	#name : #CMIDAIRRPGGameMasterPresenter,
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
		'gamePresenter',
		'gameMasterChart',
		'gameMasterChartInteraction',
		'currentActionsText'
	],
	#category : #'Cormas-Model-IDAIR-RPG-UI'
}

{ #category : #specs }
CMIDAIRRPGGameMasterPresenter class >> defaultSpec [

	<script: 'CMIDAIRRPGContactModel new asPresenter openWithSpec'>
	| citizenSpec policyMakerSpec hospitalManagerSpec |
	citizenSpec := SpBoxLayout newVertical
		               add: (SpBoxLayout newHorizontal
				                add: 'Citizen''s Actions' asPresenter
				                width: 200)
		               height: self labelHeight + 5;
		               yourself.
	citizenSpec add:
		(SpBoxLayout newHorizontal add: (SpPanedLayout newVertical
				  positionOfSlider: 0.5;
				  add: #playerList;
				  add: (SpBoxLayout newVertical
						   add: #citizenActionList;
						   add: (SpBoxLayout newHorizontal
								    add: #citizenActionYesButton;
								    add: #citizenActionNoButton;
								    yourself)
						   expand: false))).
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

	^ SpPanedLayout newHorizontal
		  positionOfSlider: 0.7;
		  add: (SpBoxLayout newHorizontal
				   add: citizenSpec expand: true;
				   add: '    ' asPresenter width: 10;
				   add: hospitalManagerSpec expand: true;
				   add: '    ' asPresenter width: 10;
				   add: policyMakerSpec expand: true;
				   add: '    ' asPresenter width: 10;
				   yourself);
		  add: (SpPanedLayout newVertical
				   positionOfSlider: 0.7;
				   add: #gameMasterChart;
				   add: #currentActionsText;
				   yourself);
		  yourself
]

{ #category : #accessing }
CMIDAIRRPGGameMasterPresenter >> citizen [

	^ playerList selectedItem ifNotNil: #value
]

{ #category : #operations }
CMIDAIRRPGGameMasterPresenter >> citizenPlay: action [

	self citizen ifNotNil: [ :citizen | 
		action isImmediateAction
			ifTrue: [ action execute: citizen ]
			ifFalse: [ 
				citizen contactProfile action: action.
				playerList refresh ].
		self updateCurrentActionsText.
		gameMasterChart refresh.
		gamePresenter updatePublicCharts ]
]

{ #category : #operations }
CMIDAIRRPGGameMasterPresenter >> clearRound [

	self model ifNotNil: #clearRound.
	self model cormasModel nextHistory.
	playerList refresh.
	gameMasterChart refresh
]

{ #category : #accessing }
CMIDAIRRPGGameMasterPresenter >> cormasModel [

	^ self model cormasModel
]

{ #category : #accessing }
CMIDAIRRPGGameMasterPresenter >> diseaseDynamicsAndPopulation [

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
CMIDAIRRPGGameMasterPresenter >> drawGameMasterChart: aCanvas [

	| charts chart |
	aCanvas color: Color white.
	charts := { 
		          self cormasModel patientsChart.
		          self cormasModel hospitalChart }.
	RSVerticalLineLayout new
		alignCenter;
		gapSize: 10;
		on: charts.
	aCanvas addAll: charts.
	gameMasterChartInteraction ifNil: [ 
		gameMasterChartInteraction := CMIDAIRMultiChartInteraction new ].
	aCanvas @ gameMasterChartInteraction.
	chart := charts
		         at: gameMasterChartInteraction currentShapeIndex
		         ifAbsent: [ aCanvas ].
	aCanvas camera
		zoomToFit: chart extent
		rectangle: chart encompassingRectangle
]

{ #category : #accessing }
CMIDAIRRPGGameMasterPresenter >> gamePresenter: aCMIDAIRRPGPresenter [

	gamePresenter := aCMIDAIRRPGPresenter
]

{ #category : #operations }
CMIDAIRRPGGameMasterPresenter >> hospitalManagerPlay: aCMIDAIRRPGAction [

	self model ifNotNil: [ :contactModel | 
		contactModel cormasModel
			submodelAt: #resource
			do: [ :resourceModel | 
				aCMIDAIRRPGAction execute: resourceModel.
				self updateCurrentActionsText.
				gamePresenter ifNotNil: #updatePublicCharts.
				gameMasterChart refresh ] ]
]

{ #category : #initialization }
CMIDAIRRPGGameMasterPresenter >> initializePresenters [

	playerList := self newTable
		              beResizable;
		              addColumn:
			              ((SpStringTableColumn
				                title: 'name'
				                evaluated: [ :assoc | assoc key ]) width: 110);
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
		                         displayIcon: [ :action | action icon ];
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
		                                        yourself.
	gameMasterChart := self newRoassal script: [ :canvas | 
		                   self drawGameMasterChart: canvas ].
	currentActionsText := self newText.
]

{ #category : #initialization }
CMIDAIRRPGGameMasterPresenter >> initializeWindow: aSpWindowPresenter [

	super initializeWindow: aSpWindowPresenter.
	aSpWindowPresenter initialExtent: 680 @ 600
]

{ #category : #accessing }
CMIDAIRRPGGameMasterPresenter >> modelChanged [

	super modelChanged.
	self
		updateChart;
		updateCurrentActionsText;
		updatePlayerList;
		updateCitizenActionList;
		updatePolicyMakerActionList;
		updateHospitalManagerActionList
]

{ #category : #operations }
CMIDAIRRPGGameMasterPresenter >> playCitizenActionNo [

	citizenActionList selectedItem ifNotNil: [ :action | 
		self citizenPlay: action forNo ]
]

{ #category : #operations }
CMIDAIRRPGGameMasterPresenter >> playCitizenActionYes [

	citizenActionList selectedItem ifNotNil: [ :action | 
		self citizenPlay: action forYes ]
]

{ #category : #operations }
CMIDAIRRPGGameMasterPresenter >> playHospitalManagerAction [

	hospitalManagerActionList selectedItem ifNotNil: [ :action | 
		self hospitalManagerPlay: action ]
]

{ #category : #operations }
CMIDAIRRPGGameMasterPresenter >> playPolicymakerAction [

	pendingPolicymakerActionList selectedItem ifNotNil: [ :action | 
		self policymakerPlay: action.
		pendingPolicymakerActionList items:
			(pendingPolicymakerActionList items copyWithout: action) ]
]

{ #category : #updating }
CMIDAIRRPGGameMasterPresenter >> playerChanged [

	
]

{ #category : #accessing }
CMIDAIRRPGGameMasterPresenter >> playerName [

	^ playerList selectedItem ifNotNil: #key
]

{ #category : #operations }
CMIDAIRRPGGameMasterPresenter >> policymakerPlay: aCMIDAIRRPGAction [

	self model ifNotNil: [ :contactModel | 
		aCMIDAIRRPGAction isSocialAction
			ifTrue: [ aCMIDAIRRPGAction execute: contactModel ]
			ifFalse: [ 
				contactModel cormasModel
					submodelAt: #resource
					do: [ :resourceModel | aCMIDAIRRPGAction execute: resourceModel ] ].
		self updateCurrentActionsText.
		gamePresenter ifNotNil: #updatePublicCharts.
		gameMasterChart refresh ]
]

{ #category : #operations }
CMIDAIRRPGGameMasterPresenter >> pollPolicymakerAction [

	policyMakerActionList selectedItem ifNotNil: [ :action | 
		action isSocialAction
			ifTrue: [ 
				pendingPolicymakerActionList items:
					pendingPolicymakerActionList items , { action } ]
			ifFalse: [ self policymakerPlay: action ] ]
]

{ #category : #operations }
CMIDAIRRPGGameMasterPresenter >> recordHistory: aText [

	self model cormasModel recordHistory: aText
]

{ #category : #operations }
CMIDAIRRPGGameMasterPresenter >> removePendingPolicymakerAction [

	pendingPolicymakerActionList selectedItem ifNotNil: [ :action | 
		pendingPolicymakerActionList items:
			(pendingPolicymakerActionList items copyWithout: action) ]
]

{ #category : #api }
CMIDAIRRPGGameMasterPresenter >> retrieveSpec: aSelector [

	| spec |
	spec := self perform: aSelector.
	spec isSpLayout ifTrue: [ spec selector: aSelector ].
	^ spec
]

{ #category : #accessing }
CMIDAIRRPGGameMasterPresenter >> title [
	^ 'IDAIR RPG Actions'
]

{ #category : #updating }
CMIDAIRRPGGameMasterPresenter >> updateChart [

	gameMasterChart refresh
]

{ #category : #updating }
CMIDAIRRPGGameMasterPresenter >> updateCitizenActionList [

	citizenActionList items: self model citizenActions
]

{ #category : #updating }
CMIDAIRRPGGameMasterPresenter >> updateCurrentActionsText [

	currentActionsText text: self model cormasModel latestHistory
]

{ #category : #updating }
CMIDAIRRPGGameMasterPresenter >> updateHospitalManagerActionList [

	hospitalManagerActionList items: self model hospitalManagerActions
]

{ #category : #updating }
CMIDAIRRPGGameMasterPresenter >> updatePlayerList [

	playerList items: (self model
			 ifNotNil: [ :model | model players associations ]
			 ifNil: [ Array new ])
]

{ #category : #updating }
CMIDAIRRPGGameMasterPresenter >> updatePolicyMakerActionList [

	policyMakerActionList items:
		self model policymakerActions
]
