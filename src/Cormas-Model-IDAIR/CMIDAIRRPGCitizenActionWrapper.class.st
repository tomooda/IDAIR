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

{ #category : #accessing }
CMIDAIRRPGCitizenActionWrapper >> contactFactor [

	^ self subclassResponsibility
]

{ #category : #execution }
CMIDAIRRPGCitizenActionWrapper >> execute: aCMIDAIRCitizen [

	aCMIDAIRCitizen contactProfile
		actionFactor: self contactFactor;
		addToWellbeingPoints: self wellbeingPoints
]

{ #category : #accessing }
CMIDAIRRPGCitizenActionWrapper >> locations [

	^ self subclassResponsibility
]

{ #category : #accessing }
CMIDAIRRPGCitizenActionWrapper >> name [

	^ citizenAction name , ' - ' , self postfix
]

{ #category : #accessing }
CMIDAIRRPGCitizenActionWrapper >> postfix [

	^ self subclassResponsibility
]

{ #category : #accessing }
CMIDAIRRPGCitizenActionWrapper >> wellbeingPoints [

	^ self subclassResponsibility
]
