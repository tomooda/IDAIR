Class {
	#name : #CMIDAIRNegative,
	#superclass : #CMIDAIRDiseaseDynamics,
	#category : #'Cormas-Model-IDAIR'
}

{ #category : #accessing }
CMIDAIRNegative >> color [

	^ Color green
]

{ #category : #actions }
CMIDAIRNegative >> contact [

	self random <= self pInfection ifTrue: [ ^ self beIncubative ].
	^ self
]

{ #category : #actions }
CMIDAIRNegative >> contaminate: aCMIDAIRLocation [

	
]

{ #category : #testing }
CMIDAIRNegative >> isActive [

	^ true
]

{ #category : #testing }
CMIDAIRNegative >> isTransmissible [

	^ false
]

{ #category : #actions }
CMIDAIRNegative >> step [

	^ self
]

{ #category : #actions }
CMIDAIRNegative >> test [

	^ self
]
