Class {
	#name : #CMIDAIRModelPresenter,
	#superclass : #SpPresenterWithModel,
	#instVars : [
		'notebook',
		'daysLabel',
		'daysField',
		'runButton'
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
				   add: #daysLabel width: 50;
				   add: ' days    run ' expand: false;
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
	| cormasModel |
	cormasModel := CMIDAIRModel new
		               loadDefaultSubmodels;
		               yourself.
	(CMIDAIRModelSubmodelsPresenter on: cormasModel) openDialogWithSpec 
		okAction: [ 
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
			notebook addPage: (self newNotebookPage
					 title: submodel submodelCategoryName asString;
					 presenterProvider: [ submodel asPresenter ];
					 yourself) ].
		notebook addPage: (self newNotebookPage
				 title: 'Chart';
				 presenterProvider: [ cormasModel chartPresenter ];
				 yourself) ].
	daysLabel := self newLabel
		             label: '0.0';
		             yourself.
	daysField := self newNumberInput
		             beFloat;
		             climbRate: 1.0;
		             minimum: 0.0;
		             number: 365.0;
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
	aWindowPresenter initialExtent: 800 @ 600
]

{ #category : #accessing }
CMIDAIRModelPresenter >> runSimulation [

	self model ifNotNil: [ :model | 
		daysField number ifNotNil: [ :days | 
			(days / model daysPerStep) rounded timesRepeat: [ model runStep ].
			daysLabel label:
				(model timeStep * model daysPerStep printShowingDecimalPlaces: 2).
			notebook selectPage: notebook pages last ] ]
]

{ #category : #accessing }
CMIDAIRModelPresenter >> title [

	^ 'I-DAIR ABM'
]