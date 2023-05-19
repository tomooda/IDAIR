Class {
	#name : #CMIDAIRHomeCared,
	#superclass : #CMIDAIRPositive,
	#category : #'Cormas-Model-IDAIR'
}

{ #category : #accessing }
CMIDAIRHomeCared >> color [

	^ Color red
]

{ #category : #actions }
CMIDAIRHomeCared >> contaminate: aCMIDAIRLocation [

	self random <= self pContaminate ifTrue: [ 
		aCMIDAIRLocation isContaminated: true ]
]

{ #category : #testing }
CMIDAIRHomeCared >> isActive [

	^ false
]

{ #category : #testing }
CMIDAIRHomeCared >> isTransmissible [

	^ true
]

{ #category : #parameters }
CMIDAIRHomeCared >> pContaminate [

	^ 0.9
]

{ #category : #parameters }
CMIDAIRHomeCared >> pCritical [

	^ 0.01
]

{ #category : #actions }
CMIDAIRHomeCared >> step [

	self duration: self duration + 1.
	self duration >= self recoveryPeriod ifTrue: [ ^ self beNegative ].
	self random <= self pCritical ifTrue: [ ^ self beHospitalized ].
	^ self
]

{ #category : #actions }
CMIDAIRHomeCared >> test [

	^ self
]
