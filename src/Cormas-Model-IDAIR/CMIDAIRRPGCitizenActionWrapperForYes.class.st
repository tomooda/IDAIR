Class {
	#name : #CMIDAIRRPGCitizenActionWrapperForYes,
	#superclass : #CMIDAIRRPGCitizenActionWrapper,
	#category : #'Cormas-Model-IDAIR-RPG-Actions'
}

{ #category : #accessing }
CMIDAIRRPGCitizenActionWrapperForYes >> contactFactor [

	^ citizenAction contactFactor
]

{ #category : #execution }
CMIDAIRRPGCitizenActionWrapperForYes >> execute: aCMIDAIRCitizen [

	super execute: aCMIDAIRCitizen.
	aCMIDAIRCitizen contactProfile isMuppetContactProfile ifFalse: [ 
		aCMIDAIRCitizen cormasModel recordYes ]
]

{ #category : #accessing }
CMIDAIRRPGCitizenActionWrapperForYes >> locations [

	^ citizenAction locationsForYes
]

{ #category : #accessing }
CMIDAIRRPGCitizenActionWrapperForYes >> postfix [

	^ 'YES'
]

{ #category : #accessing }
CMIDAIRRPGCitizenActionWrapperForYes >> wellbeingPoints [

	^ citizenAction wellbeingPoints
]
