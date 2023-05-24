Class {
	#name : #CMIDAIRSymptomatic,
	#superclass : #CMIDAIRSusceptible,
	#category : #'Cormas-Model-IDAIR-Disease'
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
