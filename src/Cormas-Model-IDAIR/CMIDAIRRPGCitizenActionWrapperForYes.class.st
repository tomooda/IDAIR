Class {
	#name : #CMIDAIRRPGCitizenActionWrapperForYes,
	#superclass : #CMIDAIRRPGCitizenActionWrapper,
	#category : #'Cormas-Model-IDAIR-RPG-Actions'
}

{ #category : #execution }
CMIDAIRRPGCitizenActionWrapperForYes >> execute: aCMIDAIRCitizen [

	citizenAction executeYes: aCMIDAIRCitizen
]

{ #category : #accessing }
CMIDAIRRPGCitizenActionWrapperForYes >> postfix [

	^ 'YES'
]
