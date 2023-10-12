Class {
	#name : #CMIDAIRRPGCitizenActionWrapperForNo,
	#superclass : #CMIDAIRRPGCitizenActionWrapper,
	#category : #'Cormas-Model-IDAIR-RPG-Actions'
}

{ #category : #execution }
CMIDAIRRPGCitizenActionWrapperForNo >> execute: aCMIDAIRCitizen [

	citizenAction executeNo: aCMIDAIRCitizen
]

{ #category : #accessing }
CMIDAIRRPGCitizenActionWrapperForNo >> postfix [

	^ 'NO'
]
