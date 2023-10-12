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
CMIDAIRRPGFacemaskAction >> executeNo: aCMIDAIRCitizen [

	aCMIDAIRCitizen contactProfile facemaskFactor: 1.0.
	aCMIDAIRCitizen contactProfile nofacemasked.
	aCMIDAIRCitizen cormasModel recordHistory:
		(aCMIDAIRCitizen contactProfile playerName , ': ') asText allBold
		, (self name , ' - NO') asText
]

{ #category : #execution }
CMIDAIRRPGFacemaskAction >> executeYes: aCMIDAIRCitizen [

	aCMIDAIRCitizen contactProfile facemaskFactor: 0.8.
	aCMIDAIRCitizen contactProfile facemasked.
	aCMIDAIRCitizen cormasModel recordHistory:
		(aCMIDAIRCitizen contactProfile playerName , ': ') asText allBold
		, (self name , ' - YES') asText
]

{ #category : #converting }
CMIDAIRRPGFacemaskAction >> forNo [

	^ CMIDAIRRPGCitizenActionWrapperForNo on: self
]

{ #category : #converting }
CMIDAIRRPGFacemaskAction >> forYes [

	^ CMIDAIRRPGCitizenActionWrapperForYes on: self
]

{ #category : #testing }
CMIDAIRRPGFacemaskAction >> isImmediateAction [

	^ true
]
