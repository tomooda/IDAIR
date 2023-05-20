Class {
	#name : #CMIDAIRPreSymptomatic,
	#superclass : #CMIDAIRSusceptible,
	#category : #'Cormas-Model-IDAIR'
}

{ #category : #actions }
CMIDAIRPreSymptomatic >> contaminate: aCMIDAIRLocation [

	
]

{ #category : #testing }
CMIDAIRPreSymptomatic >> isActive [

	^ true
]

{ #category : #testing }
CMIDAIRPreSymptomatic >> isTransmissible [

	^ false
]

{ #category : #actions }
CMIDAIRPreSymptomatic >> test [

	^ self
]
