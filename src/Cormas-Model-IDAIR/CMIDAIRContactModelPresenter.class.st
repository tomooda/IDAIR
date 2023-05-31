Class {
	#name : #CMIDAIRContactModelPresenter,
	#superclass : #SpPresenterWithModel,
	#instVars : [
		'r0',
		'estimatedTransmissibleDuration'
	],
	#category : #'Cormas-Model-IDAIR-Contact-SingleLocation'
}

{ #category : #specs }
CMIDAIRContactModelPresenter class >> defaultSpec [

	"self new open"

	^ SpGridLayout new
		  beColumnHomogeneous;
		  beRowHomogeneous;
		  add: 'R0' at: 1 @ 1;
		  add: #r0 at: 2 @ 1;
		  add: 'estimated transmissible duration' at: 1 @ 2;
		  add: #estimatedTransmissibleDuration at: 2 @ 2;
		  yourself
]

{ #category : #specs }
CMIDAIRContactModelPresenter class >> defaultSpec0 [

	"self new open"

	^ SpBoxLayout newVertical
		  add: (SpBoxLayout newHorizontal
				   add: 'r0' expand: false;
				   add: #r0;
				   yourself)
		  expand: false;
		  add: (SpBoxLayout newHorizontal
				   add: 'estimated transmissible duration' expand: false;
				   add: #estimatedTransmissibleDuration width: 100;
				   yourself)
		  expand: false;
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
		      yourself.
	estimatedTransmissibleDuration := self newNumberInput
		                                  beFloat;
		                                  minimum: 0.0;
		                                  climbRate: 1.0;
		                                  whenNumberChangedDo: [ :value | 
			                                  self model ifNotNil: [ :m | 
					                                  m 
						                                  estimatedTransmissibleDuration:
							                                  value ] ];
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
	self model ifNotNil: [ :m | 
		r0 number: m r0.
		estimatedTransmissibleDuration number:
			m estimatedTransmissibleDuration ]
]

{ #category : #accessing }
CMIDAIRContactModelPresenter >> title [
	^ 'Contact model parameters'
]
