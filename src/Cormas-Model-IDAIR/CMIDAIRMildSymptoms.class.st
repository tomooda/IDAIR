Class {
	#name : #CMIDAIRMildSymptoms,
	#superclass : #CMIDAIRSymptomatic,
	#category : #'Cormas-Model-IDAIR'
}

{ #category : #accessing }
CMIDAIRMildSymptoms >> color [

	^ Color yellow darker
]

{ #category : #actions }
CMIDAIRMildSymptoms >> contaminate: aCMIDAIRLocation [

	self random <= self pContaminate ifTrue: [ 
		aCMIDAIRLocation isContaminated: true ]
]

{ #category : #testing }
CMIDAIRMildSymptoms >> isActive [

	^ false
]

{ #category : #testing }
CMIDAIRMildSymptoms >> isTransmissible [

	^ true
]

{ #category : #parameters }
CMIDAIRMildSymptoms >> pContaminate [

	^ 0.9
]

{ #category : #parameters }
CMIDAIRMildSymptoms >> pCritical [

	^ 0.01
]

{ #category : #actions }
CMIDAIRMildSymptoms >> step [

	self duration: self duration + 1.
	self duration >= self recoveryPeriod ifTrue: [ ^ self beHealthy ].
	^ self
]

{ #category : #actions }
CMIDAIRMildSymptoms >> test [

	^ self
]
