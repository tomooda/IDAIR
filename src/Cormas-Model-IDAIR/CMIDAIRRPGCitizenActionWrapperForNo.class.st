Class {
	#name : #CMIDAIRRPGCitizenActionWrapperForNo,
	#superclass : #CMIDAIRRPGCitizenActionWrapper,
	#category : #'Cormas-Model-IDAIR-RPG-Actions'
}

{ #category : #accessing }
CMIDAIRRPGCitizenActionWrapperForNo >> contactFactor [

	^ 1.0
]

{ #category : #execution }
CMIDAIRRPGCitizenActionWrapperForNo >> execute: aCMIDAIRCitizen [

	super execute: aCMIDAIRCitizen.
	aCMIDAIRCitizen contactProfile isMuppetContactProfile ifFalse: [ 
		aCMIDAIRCitizen cormasModel recordNo ]
]

{ #category : #accessing }
CMIDAIRRPGCitizenActionWrapperForNo >> locations [

	^ citizenAction locationsForNo
]

{ #category : #accessing }
CMIDAIRRPGCitizenActionWrapperForNo >> postfix [

	^ 'NO'
]

{ #category : #accessing }
CMIDAIRRPGCitizenActionWrapperForNo >> wellbeingPoints [

	^ citizenAction wellbeingPoints negated
]
