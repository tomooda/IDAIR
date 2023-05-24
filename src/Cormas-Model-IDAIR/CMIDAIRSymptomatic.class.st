Class {
	#name : #CMIDAIRSymptomatic,
	#superclass : #CMIDAIRSusceptible,
	#category : #'Cormas-Model-IDAIR-Disease'
}

{ #category : #testing }
CMIDAIRSymptomatic class >> isAbstract [

	^ self = CMIDAIRSymptomatic
]

{ #category : #actions }
CMIDAIRSymptomatic >> test [

	^ self
]
