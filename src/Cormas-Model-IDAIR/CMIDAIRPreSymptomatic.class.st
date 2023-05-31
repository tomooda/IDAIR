Class {
	#name : #CMIDAIRPreSymptomatic,
	#superclass : #CMIDAIRInfected,
	#category : #'Cormas-Model-IDAIR-Disease-Oxford'
}

{ #category : #testing }
CMIDAIRPreSymptomatic class >> isAbstract [

	^ self = CMIDAIRPreSymptomatic
]

{ #category : #actions }
CMIDAIRPreSymptomatic >> contaminate: aCMIDAIRLocation [

	
]

{ #category : #testing }
CMIDAIRPreSymptomatic >> isActive [

	^ true
]

{ #category : #testing }
CMIDAIRPreSymptomatic >> isPreSymptomatic [

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
