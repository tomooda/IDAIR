Class {
	#name : #CMIDAIRAgent,
	#superclass : #CMLocatedAgent,
	#category : #'Cormas-Model-IDAIR-Core'
}

{ #category : #testing }
CMIDAIRAgent class >> isAbstract [

	^ self = CMIDAIRAgent
]

{ #category : #accessing }
CMIDAIRAgent >> daysPerStep [

	^ self cormasModel daysPerStep
]
