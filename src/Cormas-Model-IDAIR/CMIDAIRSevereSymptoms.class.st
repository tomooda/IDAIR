Class {
	#name : #CMIDAIRSevereSymptoms,
	#superclass : #CMIDAIRSymptomatic,
	#category : #'Cormas-Model-IDAIR'
}

{ #category : #accessing }
CMIDAIRSevereSymptoms >> color [

	^ Color red darker
]

{ #category : #actions }
CMIDAIRSevereSymptoms >> contaminate: aCMIDAIRLocation [

	self random <= self pContaminate ifTrue: [ 
		aCMIDAIRLocation isContaminated: true ]
]

{ #category : #testing }
CMIDAIRSevereSymptoms >> isActive [

	^ false
]

{ #category : #testing }
CMIDAIRSevereSymptoms >> isTransmissible [

	^ true
]

{ #category : #parameters }
CMIDAIRSevereSymptoms >> pContaminate [

	^ 0.9
]

{ #category : #parameters }
CMIDAIRSevereSymptoms >> pCritical [

	^ 0.01
]

{ #category : #stepping }
CMIDAIRSevereSymptoms >> step [

	self duration: self duration + 1.
	self duration >= self recoveryPeriod ifTrue: [ ^ self beHealthy ].
	self random <= self pCritical ifTrue: [ ^ self beHospitalized ].
	^ self
]

{ #category : #tests }
CMIDAIRSevereSymptoms >> test [

	^ self
]
