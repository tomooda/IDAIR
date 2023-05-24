Class {
	#name : #CMIDAIRSubmodel,
	#superclass : #Object,
	#instVars : [
		'cormasModel'
	],
	#category : #'Cormas-Model-IDAIR-Core'
}

{ #category : #accessing }
CMIDAIRSubmodel >> cormasModel [

	^ cormasModel
]

{ #category : #accessing }
CMIDAIRSubmodel >> cormasModel: aCMIDAIRModel [

	cormasModel := aCMIDAIRModel
]

{ #category : #accessing }
CMIDAIRSubmodel >> name [

	^ self subclassResponsibility
]
