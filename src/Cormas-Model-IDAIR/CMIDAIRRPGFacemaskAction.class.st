Class {
	#name : #CMIDAIRRPGFacemaskAction,
	#superclass : #CMIDAIRRPGAction,
	#category : #'Cormas-Model-IDAIR-RPG-Actions'
}

{ #category : #constants }
CMIDAIRRPGFacemaskAction class >> facemasked [
	^ self name: 'Resource Card: Wear facemasks'
]

{ #category : #constants }
CMIDAIRRPGFacemaskAction class >> vaccinated [
	^ self name: 'Resource Card: Get vaccinated'
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
