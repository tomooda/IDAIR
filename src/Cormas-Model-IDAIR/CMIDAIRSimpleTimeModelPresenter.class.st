Class {
	#name : #CMIDAIRSimpleTimeModelPresenter,
	#superclass : #SpPresenterWithModel,
	#instVars : [
		'daysPerStep'
	],
	#category : #'Cormas-Model-IDAIR-Time-Simple'
}

{ #category : #specs }
CMIDAIRSimpleTimeModelPresenter class >> defaultSpec [

	^ SpGridLayout new
		  beColumnHomogeneous;
		  beRowHomogeneous;
		  add: 'Days per step' at: 1 @ 1;
		  add: #daysPerStep at: 2 @ 1;
		  yourself
]

{ #category : #initialization }
CMIDAIRSimpleTimeModelPresenter >> initializePresenters [

	super initializePresenters.
	daysPerStep := self newNumberInput
		               beFloat;
		               minimum: 0.0;
		               climbRate: 0.1;
		               whenNumberChangedDo: [ :value | 
			               self model ifNotNil: [ :m | m daysPerStep: value ] ];
		               yourself
]

{ #category : #initialization }
CMIDAIRSimpleTimeModelPresenter >> initializeWindow: aSpWindowPresenter [

	super initializeWindow: aSpWindowPresenter.
	aSpWindowPresenter initialExtent: 600 @ 100
]

{ #category : #initialization }
CMIDAIRSimpleTimeModelPresenter >> modelChanged [

	super modelChanged.
	self model ifNotNil: [ :m | daysPerStep number: m daysPerStep ]
]

{ #category : #accessing }
CMIDAIRSimpleTimeModelPresenter >> title [
	^ 'Time model parameters'
]
