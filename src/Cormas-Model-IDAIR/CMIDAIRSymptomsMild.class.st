Class {
	#name : #CMIDAIRSymptomsMild,
	#superclass : #CMIDAIRSymptomatic,
	#category : #'Cormas-Model-IDAIR-Disease'
}

{ #category : #accessing }
CMIDAIRSymptomsMild >> color [

	^ self modelParameterAt: #symptomsMildColor
]

{ #category : #actions }
CMIDAIRSymptomsMild >> contaminate: aCMIDAIRLocation [

	self random <= self pContaminate ifTrue: [ 
		aCMIDAIRLocation isContaminated: true ]
]

{ #category : #testing }
CMIDAIRSymptomsMild >> isActive [

	^ false
]

{ #category : #testing }
CMIDAIRSymptomsMild >> isTransmissible [

	^ true
]

{ #category : #accessing }
CMIDAIRSymptomsMild >> name [

	^ 'mild symptom'
]

{ #category : #parameters }
CMIDAIRSymptomsMild >> pContaminate [

	^ 0.9
]

{ #category : #actions }
CMIDAIRSymptomsMild >> step [

	self duration: self duration + 1.
	self duration >= self tauRec ifTrue: [ ^ self beHealthy ].
	^ self
]
