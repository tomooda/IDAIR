Class {
	#name : #CMIDAIRSingleLocationContactModelPresenter,
	#superclass : #SpPresenterWithModel,
	#instVars : [
		'socialDistanceFactor'
	],
	#category : #'Cormas-Model-IDAIR-Contact-SingleLocation'
}

{ #category : #specs }
CMIDAIRSingleLocationContactModelPresenter class >> defaultSpec [

	^ SpGridLayout new
		  beColumnHomogeneous;
		  beRowHomogeneous;
		  add: 'Social distance factor' at: 1 @ 1;
		  add: #socialDistanceFactor at: 2 @ 1;
		  yourself
]

{ #category : #initialization }
CMIDAIRSingleLocationContactModelPresenter >> initializePresenters [

	super initializePresenters.
	socialDistanceFactor := self newNumberInput
		                        beFloat;
		                        minimum: 0.0;
		                        maximum: 1.0;
		                        climbRate: 0.1;
		                        whenNumberChangedDo: [ :value | 
			                        self model ifNotNil: [ :m | 
					                        m socialDistanceFactor: value ] ];
		                        yourself
]

{ #category : #initialization }
CMIDAIRSingleLocationContactModelPresenter >> initializeWindow: aSpWindowPresenter [

	super initializeWindow: aSpWindowPresenter.
	aSpWindowPresenter initialExtent: 600 @ 100
]

{ #category : #initialization }
CMIDAIRSingleLocationContactModelPresenter >> modelChanged [

	super modelChanged.
	self model ifNotNil: [ :m | 
		socialDistanceFactor number: m socialDistanceFactor ]
]

{ #category : #accessing }
CMIDAIRSingleLocationContactModelPresenter >> title [
	^ 'Contact model parameters'
]
