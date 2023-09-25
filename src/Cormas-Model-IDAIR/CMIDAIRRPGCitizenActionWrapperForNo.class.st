Class {
	#name : #CMIDAIRRPGCitizenActionWrapperForNo,
	#superclass : #CMIDAIRRPGCitizenActionWrapper,
	#category : #'Cormas-Model-IDAIR-RPG-Actions'
}

{ #category : #accessing }
CMIDAIRRPGCitizenActionWrapperForNo >> contactFactor [

	^ 1.0
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
