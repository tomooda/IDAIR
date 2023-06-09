Class {
	#name : #CMIDAIRModelPresenter,
	#superclass : #SpPresenterWithModel,
	#instVars : [
		'notebook'
	],
	#category : #'Cormas-Model-IDAIR-Core'
}

{ #category : #specs }
CMIDAIRModelPresenter class >> defaultSpec [

	^ SpBoxLayout newVertical
		  add: #notebook;
		  yourself
]

{ #category : #initialization }
CMIDAIRModelPresenter >> initializePresenters [

	notebook := self newNotebook.
	self model ifNotNil: [ :cormasModel | 
		notebook addPage: (self newNotebookPage
				 title: 'Chart';
				 presenterProvider: [ cormasModel chartPresenter ];
				 yourself).
		cormasModel submodelsInOrderDo: [ :submodel | 
			notebook addPage: (self newNotebookPage
					 title: submodel name asString;
					 presenterProvider: [ submodel asPresenter ];
					 yourself) ] ]
]

{ #category : #initialization }
CMIDAIRModelPresenter >> initializeWindow: aWindowPresenter [

	super initializeWindow: aWindowPresenter.
	aWindowPresenter initialExtent: 800 @ 600
]

{ #category : #accessing }
CMIDAIRModelPresenter >> title [

	^ 'I-DAIR ABM'
]
