Class {
	#name : #CMIDAIRModelPresenter,
	#superclass : #SpPresenterWithModel,
	#instVars : [
		'notebook',
		'daysLabel',
		'daysField',
		'runButton',
		'chart'
	],
	#category : #'Cormas-Model-IDAIR-UI'
}

{ #category : #specs }
CMIDAIRModelPresenter class >> defaultSpec [

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
				   yourself)
		  expand: false;
		  yourself
]

{ #category : #private }
CMIDAIRModelPresenter class >> launch [

	<example>
	| cormasModel initializer |
	cormasModel := CMIDAIRModel new
		               loadDefaultSubmodels;
		               yourself.
	(initializer := CMIDAIRRPGInitializationPresenter on: cormasModel)
		openDialogWithSpec okAction: [ 
		cormasModel initializer: initializer.
		cormasModel activeInit: #init.
		cormasModel activeControl: #step:.
		cormasModel initSimulation.
		cormasModel openGUI ]
]

{ #category : #private }
CMIDAIRModelPresenter class >> worldMenuOn: aBuilder [

	<worldMenu>
	(aBuilder item: #'I-DAIR')
		action: [ self launch ];
		order: 4.9.

	aBuilder withSeparatorAfter
]

{ #category : #initialization }
CMIDAIRModelPresenter >> initializePresenters [

	super initializePresenters.
	notebook := self newNotebook.
	self model ifNotNil: [ :cormasModel | 
		cormasModel submodelsInOrderDo: [ :submodel | 
			submodel asPresenter ifNotNil: [ :presenter | 
				notebook addPage: (self newNotebookPage
						 title: submodel submodelCategoryName asString;
						 presenterProvider: [ presenter ];
						 yourself) ] ] ].
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
		             yourself
]

{ #category : #initialization }
CMIDAIRModelPresenter >> initializeWindow: aWindowPresenter [

	super initializeWindow: aWindowPresenter.
	aWindowPresenter initialExtent: 900 @ 600
]

{ #category : #accessing }
CMIDAIRModelPresenter >> runSimulation [

	self model ifNotNil: [ :model | 
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
						model runStep.
						(count := count + 1) % step = 0 ifTrue: [ 
							progress value: count // step ] ] ].
			daysLabel label:
				(model timeStep * model daysPerStep printShowingDecimalPlaces: 2).
			chart ifNotNil: [ chart newMaxX: model timeStep ].
			"notebook selectPage: notebook pages last" ] ]
]

{ #category : #accessing }
CMIDAIRModelPresenter >> title [

	^ 'I-DAIR ABM'
]
