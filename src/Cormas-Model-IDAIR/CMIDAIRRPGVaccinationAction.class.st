Class {
	#name : #CMIDAIRRPGVaccinationAction,
	#superclass : #CMIDAIRRPGAction,
	#category : #'Cormas-Model-IDAIR-RPG-Actions'
}

{ #category : #constants }
CMIDAIRRPGVaccinationAction class >> vaccinated [
	^ self name: 'RC: Get vaccinated'
]

{ #category : #execution }
CMIDAIRRPGVaccinationAction >> execute: aCMIDAIRCitizen [

	aCMIDAIRCitizen cormasModel
		submodelAt: #resource
		do: [ :resourceModel | 
			aCMIDAIRCitizen contactProfile immuneFactor: 0.1.
			aCMIDAIRCitizen cormasModel recordHistory:
				(aCMIDAIRCitizen contactProfile playerName , ': ') asText allBold
				, self name asText ]
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
