Class {
	#name : #CMIDAIRRPGVaccinationAction,
	#superclass : #CMIDAIRRPGAction,
	#category : #'Cormas-Model-IDAIR-RPG-Actions'
}

{ #category : #constants }
CMIDAIRRPGVaccinationAction class >> vaccinated [
	^ self name: 'Resource Card: Get vaccinated'
]

{ #category : #execution }
CMIDAIRRPGVaccinationAction >> execute: aCMIDAIRCitizen [

	aCMIDAIRCitizen cormasModel
		submodelAt: #resource
		do: [ :resourceModel | 
			aCMIDAIRCitizen contactProfile immuneFactor:
				1.0 - (resourceModel vaccineEligibilityRate * 0.9) ]
]

{ #category : #converting }
CMIDAIRRPGVaccinationAction >> forNo [

	^ self
]

{ #category : #converting }
CMIDAIRRPGVaccinationAction >> forYes [

	^ self
]

{ #category : #testing }
CMIDAIRRPGVaccinationAction >> isImmediateAction [

	^ true
]
