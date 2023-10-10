Class {
	#name : #CMIDAIRRPGFacemaskAction,
	#superclass : #CMIDAIRRPGAction,
	#category : #'Cormas-Model-IDAIR-RPG-Actions'
}

{ #category : #constants }
CMIDAIRRPGFacemaskAction class >> facemasked [

	^ self name: 'RC: Wear facemasks'
]

{ #category : #execution }
CMIDAIRRPGFacemaskAction >> execute: aCMIDAIRCitizen [

	aCMIDAIRCitizen contactProfile facemaskFactor: 0.8
]

{ #category : #converting }
CMIDAIRRPGFacemaskAction >> forNo [

	^ self
]

{ #category : #converting }
CMIDAIRRPGFacemaskAction >> forYes [

	^ self
]

{ #category : #testing }
CMIDAIRRPGFacemaskAction >> isImmediateAction [

	^ true
]
