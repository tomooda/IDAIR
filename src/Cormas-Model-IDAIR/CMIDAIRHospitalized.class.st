Class {
	#name : #CMIDAIRHospitalized,
	#superclass : #CMIDAIRPositive,
	#category : #'Cormas-Model-IDAIR'
}

{ #category : #accessing }
CMIDAIRHospitalized >> color [

	^ Color gray
]

{ #category : #actions }
CMIDAIRHospitalized >> contaminate: aCMIDAIRLocation [

	
]

{ #category : #testing }
CMIDAIRHospitalized >> isActive [

	^ false
]

{ #category : #testing }
CMIDAIRHospitalized >> isIsolated [

	^ true
]

{ #category : #testing }
CMIDAIRHospitalized >> isTransmissible [

	^ true
]

{ #category : #parameters }
CMIDAIRHospitalized >> pCritical [

	^ 0.01
]

{ #category : #actions }
CMIDAIRHospitalized >> step [

	self duration: self duration + 1.
	self duration >= self recoveryPeriod ifTrue: [ ^ self beNegative ].
	self random <= self pCritical ifTrue: [ ^ self beICUed ].
	^ self
]

{ #category : #actions }
CMIDAIRHospitalized >> test [

	^ self
]
