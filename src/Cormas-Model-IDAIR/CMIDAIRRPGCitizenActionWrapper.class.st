Class {
	#name : #CMIDAIRRPGCitizenActionWrapper,
	#superclass : #Object,
	#instVars : [
		'citizenAction'
	],
	#category : #'Cormas-Model-IDAIR-RPG-Actions'
}

{ #category : #'instance creation' }
CMIDAIRRPGCitizenActionWrapper class >> on: aCMIDAIRRPGCitizenAction [

	^ self new citizenAction: aCMIDAIRRPGCitizenAction
]

{ #category : #accessing }
CMIDAIRRPGCitizenActionWrapper >> actionName [

	^ citizenAction name
]

{ #category : #accessing }
CMIDAIRRPGCitizenActionWrapper >> citizenAction [

	^ citizenAction
]

{ #category : #accessing }
CMIDAIRRPGCitizenActionWrapper >> citizenAction: aCMIDAIRRPGCitizenAction [

	citizenAction := aCMIDAIRRPGCitizenAction
]

{ #category : #execution }
CMIDAIRRPGCitizenActionWrapper >> execute: aCMIDAIRCitizen [

	^ self subclassResponsibility
]

{ #category : #testing }
CMIDAIRRPGCitizenActionWrapper >> isForNo [

	^ self subclassResponsibility
]

{ #category : #testing }
CMIDAIRRPGCitizenActionWrapper >> isForYes [

	^ self subclassResponsibility
]

{ #category : #testing }
CMIDAIRRPGCitizenActionWrapper >> isImmediateAction [

	^ citizenAction isImmediateAction
]

{ #category : #accessing }
CMIDAIRRPGCitizenActionWrapper >> name [

	^ citizenAction name , ' - ' , self postfix
]

{ #category : #accessing }
CMIDAIRRPGCitizenActionWrapper >> postfix [

	^ self subclassResponsibility
]
