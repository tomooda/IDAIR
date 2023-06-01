Class {
	#name : #CMIDAIRContactModelPresenter,
	#superclass : #SpPresenterWithModel,
	#instVars : [
		'r0'
	],
	#category : #'Cormas-Model-IDAIR-Contact-SingleLocation'
}

{ #category : #specs }
CMIDAIRContactModelPresenter class >> defaultSpec [

	^ SpGridLayout new
		  beColumnHomogeneous;
		  beRowHomogeneous;
		  add: 'R0' at: 1 @ 1;
		  add: #r0 at: 2 @ 1;
		  yourself
]

{ #category : #initialization }
CMIDAIRContactModelPresenter >> initializePresenters [

	"self new open"

	super initializePresenters.
	r0 := self newNumberInput
		      beFloat;
		      minimum: 0.0;
		      climbRate: 1.0;
		      whenNumberChangedDo: [ :value | 
			      self model ifNotNil: [ :m | m r0: value ] ];
		      yourself
]

{ #category : #initialization }
CMIDAIRContactModelPresenter >> initializeWindow: aSpWindowPresenter [

	super initializeWindow: aSpWindowPresenter.
	aSpWindowPresenter initialExtent: 600 @ 100
]

{ #category : #initialization }
CMIDAIRContactModelPresenter >> modelChanged [

	super modelChanged.
	self model ifNotNil: [ :m | r0 number: m r0 ]
]

{ #category : #accessing }
CMIDAIRContactModelPresenter >> title [
	^ 'Contact model parameters'
]
