Class {
	#name : #CMIDAIRRPGCitizenActionWrapperForYes,
	#superclass : #CMIDAIRRPGCitizenActionWrapper,
	#category : #'Cormas-Model-IDAIR-RPG-Actions'
}

{ #category : #accessing }
CMIDAIRRPGCitizenActionWrapperForYes >> contactFactor [

	^ citizenAction contactFactor
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
