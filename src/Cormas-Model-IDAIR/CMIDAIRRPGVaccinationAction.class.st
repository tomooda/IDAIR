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
CMIDAIRRPGVaccinationAction >> executeNo: aCMIDAIRCitizen [

	aCMIDAIRCitizen cormasModel recordHistory:
		(aCMIDAIRCitizen contactProfile playerName , ': ') asText allBold
		, (self name , ' - NO') asText
]

{ #category : #execution }
CMIDAIRRPGVaccinationAction >> executeYes: aCMIDAIRCitizen [

	aCMIDAIRCitizen contactProfile
		immuneFactor: 0.1;
		vaccinated.
	aCMIDAIRCitizen cormasModel recordHistory:
		(aCMIDAIRCitizen contactProfile playerName , ': ') asText allBold
		, (self name , ' - YES') asText
]

{ #category : #converting }
CMIDAIRRPGVaccinationAction >> forNo [

	^ CMIDAIRRPGCitizenActionWrapperForNo on: self
]

{ #category : #converting }
CMIDAIRRPGVaccinationAction >> forYes [

	^ CMIDAIRRPGCitizenActionWrapperForYes on: self
]

{ #category : #testing }
CMIDAIRRPGVaccinationAction >> isImmediateAction [

	^ true
]
