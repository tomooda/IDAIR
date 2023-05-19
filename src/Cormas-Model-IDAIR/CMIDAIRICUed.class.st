Class {
	#name : #CMIDAIRICUed,
	#superclass : #CMIDAIRPositive,
	#category : #'Cormas-Model-IDAIR'
}

{ #category : #accessing }
CMIDAIRICUed >> color [

	^ Color darkGray
]

{ #category : #actions }
CMIDAIRICUed >> contaminate: aCMIDAIRLocation [

	
]

{ #category : #testing }
CMIDAIRICUed >> isActive [

	^ false
]

{ #category : #testing }
CMIDAIRICUed >> isIsolated [

	^ true
]

{ #category : #testing }
CMIDAIRICUed >> isTransmissible [

	^ true
]

{ #category : #parameters }
CMIDAIRICUed >> pCritical [

	^ 0.1
]

{ #category : #actions }
CMIDAIRICUed >> step [

	self duration: self duration + 1.
	self duration >= self recoveryPeriod ifTrue: [ ^ self beNegative ].
	self random <= self pCritical ifTrue: [ ^ self beDead ].
	^ self
]

{ #category : #actions }
CMIDAIRICUed >> test [

	^ self
]
