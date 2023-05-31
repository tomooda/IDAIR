Class {
	#name : #CMIDAIRSymptomatic,
	#superclass : #CMIDAIRInfected,
	#category : #'Cormas-Model-IDAIR-Disease-Oxford'
}

{ #category : #testing }
CMIDAIRSymptomatic class >> isAbstract [

	^ self = CMIDAIRSymptomatic
]

{ #category : #testing }
CMIDAIRSymptomatic >> isSymptomatic [

	^ true
]

{ #category : #actions }
CMIDAIRSymptomatic >> test [

	^ self
]
