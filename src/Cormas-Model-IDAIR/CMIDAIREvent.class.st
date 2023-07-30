Class {
	#name : #CMIDAIREvent,
	#superclass : #Object,
	#instVars : [
		'date',
		'agent',
		'action'
	],
	#category : #'Cormas-Model-IDAIR-Core'
}

{ #category : #accessing }
CMIDAIREvent >> action [

	^ action
]

{ #category : #accessing }
CMIDAIREvent >> action: aString [

	action := aString asSymbol
]

{ #category : #accessing }
CMIDAIREvent >> agent [

	^ agent
]

{ #category : #accessing }
CMIDAIREvent >> agent: anObject [

	agent := anObject
]

{ #category : #accessing }
CMIDAIREvent >> date [

	^ date
]

{ #category : #accessing }
CMIDAIREvent >> date: anObject [

	date := anObject
]
