Class {
	#name : #CMIDAIRRPGPresenter,
	#superclass : #SpPresenterWithModel,
	#instVars : [
		'notebook',
		'citizensChart',
		'medicalChart',
		'daysField',
		'daysLabel',
		'runButton',
		'settingsButton',
		'actionPresenter',
		'map',
		'populationChart'
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
					             actionPresenter := (CMIDAIRRPGActionPresenter on:
							                                 self model)
						                                gamePresenter: self;
						                                yourself ];
				             yourself);
		            addPage: (self newNotebookPage
				             title: 'Public View';
				             presenterProvider: [ 
					             populationChart := CMIDAIRRPGPublicChartsPresenter 
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
		                  yourself
]

{ #category : #initialization }
CMIDAIRRPGPresenter >> initializeWindow: aSpWindowPresenter [

	super initializeWindow: aSpWindowPresenter.
	aSpWindowPresenter initialExtent: 1024 @ 600
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
			populationChart ifNotNil: [ populationChart refresh ].
			citizensChart ifNotNil: #refresh.
			medicalChart ifNotNil: #refresh.
			map ifNotNil: #refresh.
			actionPresenter ifNotNil: #clearRound ] ]
]

{ #category : #accessing }
CMIDAIRRPGPresenter >> title [
	^ 'IDAIR RPG Actions'
]

{ #category : #operations }
CMIDAIRRPGPresenter >> updateResources [

	citizensChart ifNotNil: #refresh
]
