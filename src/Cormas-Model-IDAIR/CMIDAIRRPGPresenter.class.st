Class {
	#name : #CMIDAIRRPGPresenter,
	#superclass : #SpPresenterWithModel,
	#instVars : [
		'notebook',
		'daysField',
		'daysLabel',
		'runButton',
		'settingsButton',
		'publicChartsPresenter',
		'gameMasterPresenter',
		'openPublicChartsButton'
	],
	#category : #'Cormas-Model-IDAIR-RPG-UI'
}

{ #category : #specs }
CMIDAIRRPGPresenter class >> defaultSpec [

	<script: 'CMIDAIRRPGContactModel new asPresenter openWithSpec'>
	^ SpBoxLayout newVertical
		  add: #notebook;
		  add: (SpBoxLayout newHorizontal
				   vAlignCenter;
				   add: 'now: ' expand: false;
				   add: #daysLabel width: 30;
				   add: ' days         run ' expand: false;
				   add: #daysField expand: false;
				   add: ' days ' expand: false;
				   add: #runButton expand: false;
				   add: '' asPresenter expand: true;
				   add: #openPublicChartsButton expand: false;
				   add: #settingsButton expand: false;
				   yourself)
		  expand: false;
		  yourself
]

{ #category : #initialization }
CMIDAIRRPGPresenter >> initializePresenters [

	notebook := self newNotebook
		            addPage: (self newNotebookPage
				             title: 'Game Master';
				             presenterProvider: [ 
					             gameMasterPresenter := (CMIDAIRRPGGameMasterPresenter 
						                                     on: self model)
						                                    gamePresenter: self;
						                                    yourself ];
				             yourself);
		            addPage: (self newNotebookPage
				             title: 'Public View';
				             presenterProvider: [ 
					             publicChartsPresenter := CMIDAIRRPGPublicChartsPresenter 
						                                      on: self model cormasModel ];
				             yourself);
		            yourself.
	daysLabel := self newLabel
		             label: '0.0';
		             yourself.
	daysField := self newNumberInput
		             beFloat;
		             climbRate: 1.0;
		             minimum: 0.0;
		             number: 7.0;
		             yourself.
	runButton := self newButton
		             icon: (Smalltalk ui iconNamed: #forward);
		             label: 'run';
		             action: [ self runSimulation ];
		             yourself.
	settingsButton := self newButton
		                  icon: (Smalltalk ui iconNamed: #configuration);
		                  action: [ self openSettings ];
		                  yourself.
	openPublicChartsButton := self newButton
		                          icon:
			                          (Smalltalk ui icons iconNamed:
					                           #smallWindow);
		                          action: [ self openPublicCharts ];
		                          yourself
]

{ #category : #initialization }
CMIDAIRRPGPresenter >> initializeWindow: aSpWindowPresenter [

	super initializeWindow: aSpWindowPresenter.
	aSpWindowPresenter initialExtent: 1024 @ 600
]

{ #category : #operations }
CMIDAIRRPGPresenter >> openPublicCharts [

	notebook pages size = 2 ifTrue: [ 
		notebook removePageAt: 2.
		openPublicChartsButton disable.
		publicChartsPresenter := CMIDAIRRPGPublicChartsPresenter on:
			                         self model cormasModel.
		publicChartsPresenter asWindow in: [ :window | 
			window buildWithSpecLayout: publicChartsPresenter defaultSpec.
			window withAdapterDo: [ :a | a widget openInExternalWindow ].
			window title: 'simulation'.
			window maximize ] ]
]

{ #category : #operations }
CMIDAIRRPGPresenter >> openSettings [

	self model cormasModel asPresenter openWithSpec
]

{ #category : #api }
CMIDAIRRPGPresenter >> retrieveSpec: aSelector [

	| spec |
	spec := self perform: aSelector.
	spec isSpLayout ifTrue: [ spec selector: aSelector ].
	^ spec
]

{ #category : #operations }
CMIDAIRRPGPresenter >> runSimulation [

	self model ifNotNil: [ :model | 
		model cormasModel theCitizens do: [ :citizen | 
			citizen locationDynamics finishMove.
			citizen contactProfile executeAction ].
		model cormasModel
			submodelAt: #disease
			do: [ :diseaseModel | diseaseModel initializeRound ].
		daysField number ifNotNil: [ :days | 
			'Simulating...'
				displayProgressFrom: 0
				to: 100
				during: [ :progress | 
					| steps count step |
					steps := (days / model daysPerStep) rounded.
					count := 0.
					step := steps // 100 + 1.
					steps timesRepeat: [ 
						model cormasModel runStep.
						(count := count + 1) % step = 0 ifTrue: [ 
							progress value: count // step ] ] ].
			daysLabel label: (model cormasModel timeStep * model daysPerStep 
					 printShowingDecimalPlaces: 2).
			publicChartsPresenter ifNotNil: [ publicChartsPresenter refresh ].
			gameMasterPresenter ifNotNil: #clearRound ] ]
]

{ #category : #accessing }
CMIDAIRRPGPresenter >> title [
	^ 'IDAIR RPG Actions'
]

{ #category : #operations }
CMIDAIRRPGPresenter >> updatePublicCharts [

	publicChartsPresenter ifNotNil: #refresh
]
