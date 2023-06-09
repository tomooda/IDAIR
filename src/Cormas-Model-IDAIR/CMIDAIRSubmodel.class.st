Class {
	#name : #CMIDAIRSubmodel,
	#superclass : #Object,
	#instVars : [
		'cormasModel'
	],
	#classVars : [
		'RandomGenerator'
	],
	#category : #'Cormas-Model-IDAIR-Core'
}

{ #category : #testing }
CMIDAIRSubmodel class >> isAbstract [

	^ self = CMIDAIRSubmodel
]

{ #category : #'instance creation' }
CMIDAIRSubmodel class >> on: aCMIDAIRModel [

	^ self new
		  cormasModel: aCMIDAIRModel;
		  yourself
]

{ #category : #accessing }
CMIDAIRSubmodel class >> randomGenerator [

	^ RandomGenerator ifNil: [ RandomGenerator := Random new ]
]

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

{ #category : #'user interfaces' }
CMIDAIRSubmodel >> openGUI [
]

{ #category : #accessing }
CMIDAIRSubmodel >> order [

	^ self subclassResponsibility
]

{ #category : #accessing }
CMIDAIRSubmodel >> random [

	^ self class randomGenerator next
]

{ #category : #control }
CMIDAIRSubmodel >> step: anInteger [

	^ self subclassResponsibility
]
