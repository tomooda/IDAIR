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
CMIDAIRSubmodel class >> order [

	^ self subclassResponsibility
]

{ #category : #accessing }
CMIDAIRSubmodel class >> randomGenerator [

	^ RandomGenerator ifNil: [ RandomGenerator := Random new ]
]

{ #category : #accessing }
CMIDAIRSubmodel class >> submodelCategoryName [

	^ self subclassResponsibility
]

{ #category : #accessing }
CMIDAIRSubmodel class >> submodelName [

	^ self subclassResponsibility
]

{ #category : #accessing }
CMIDAIRSubmodel >> cormasModel [

	^ cormasModel
]

{ #category : #accessing }
CMIDAIRSubmodel >> cormasModel: aCMIDAIRModel [

	cormasModel := aCMIDAIRModel
]

{ #category : #'user interfaces' }
CMIDAIRSubmodel >> openGUI [
]

{ #category : #accessing }
CMIDAIRSubmodel >> order [

	^ self class order
]

{ #category : #accessing }
CMIDAIRSubmodel >> random [

	^ self class randomGenerator next
]

{ #category : #control }
CMIDAIRSubmodel >> step: anInteger [

	^ self subclassResponsibility
]

{ #category : #accessing }
CMIDAIRSubmodel >> submodelCategoryName [

	^ self class submodelCategoryName
]

{ #category : #accessing }
CMIDAIRSubmodel >> submodelName [

	^ self class submodelName
]
