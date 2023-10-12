Class {
	#name : #CMIDAIRRPGContactProfile,
	#superclass : #CMIDAIRContactProfile,
	#instVars : [
		'immuneFactor',
		'actionFactor',
		'action',
		'actionName',
		'wellbeingPoints',
		'facemaskFactor',
		'isVaccinated',
		'isFacemasked'
	],
	#category : #'Cormas-Model-IDAIR-Contact-RPG'
}

{ #category : #accessing }
CMIDAIRRPGContactProfile >> action [

	^ action
]

{ #category : #accessing }
CMIDAIRRPGContactProfile >> action: aCMIDAIRRPGCitizenAction [

	action := aCMIDAIRRPGCitizenAction
]

{ #category : #accessing }
CMIDAIRRPGContactProfile >> actionFactor [

	^ actionFactor
]

{ #category : #accessing }
CMIDAIRRPGContactProfile >> actionFactor: aNumber [

	actionFactor := aNumber
]

{ #category : #accessing }
CMIDAIRRPGContactProfile >> actionName [

	^ action ifNotNil: #actionName ifNil: [ '' ]
]

{ #category : #accessing }
CMIDAIRRPGContactProfile >> actionPostfix [

	^ action ifNotNil: #postfix ifNil: [ '' ]
]

{ #category : #accessing }
CMIDAIRRPGContactProfile >> addToWellbeingPoints: anInteger [

	wellbeingPoints := wellbeingPoints + anInteger
]

{ #category : #accessing }
CMIDAIRRPGContactProfile >> beVaccinated [

	self immuneFactor: 0.1
]

{ #category : #accessing }
CMIDAIRRPGContactProfile >> clearRound [

	actionFactor := 1.0.
	action := nil.
	facemaskFactor := 1.0.
	isFacemasked := nil
]

{ #category : #operatoins }
CMIDAIRRPGContactProfile >> executeAction [

	action ifNotNil: [ action execute: self citizen ]
]

{ #category : #accessing }
CMIDAIRRPGContactProfile >> facemaskFactor [

	^ facemaskFactor
]

{ #category : #accessing }
CMIDAIRRPGContactProfile >> facemaskFactor: aNumber [

	facemaskFactor := aNumber
]

{ #category : #operatoins }
CMIDAIRRPGContactProfile >> facemasked [

	isFacemasked := true
]

{ #category : #accessing }
CMIDAIRRPGContactProfile >> immuneFactor [

	^ immuneFactor
]

{ #category : #accessing }
CMIDAIRRPGContactProfile >> immuneFactor: aNumber [

	immuneFactor := aNumber
]

{ #category : #initialization }
CMIDAIRRPGContactProfile >> initialize [

	super initialize.
	immuneFactor := 1.0.
	facemaskFactor := 1.0.
	actionFactor := 1.0.
	wellbeingPoints := 20.
	isVaccinated := false.
	isFacemasked := nil
]

{ #category : #accessing }
CMIDAIRRPGContactProfile >> isFacemasked [

	^ isFacemasked
]

{ #category : #testing }
CMIDAIRRPGContactProfile >> isMuppetContactProfile [

	^ false
]

{ #category : #accessing }
CMIDAIRRPGContactProfile >> isVaccinated [

	^ isVaccinated
]

{ #category : #operatoins }
CMIDAIRRPGContactProfile >> nofacemasked [

	isFacemasked := false
]

{ #category : #accessing }
CMIDAIRRPGContactProfile >> player [

	^ citizen
]

{ #category : #accessing }
CMIDAIRRPGContactProfile >> player: aCMIDAIRCitizen [

	| muppetProfile |
	aCMIDAIRCitizen contactProfile isMuppetContactProfile ifTrue: [ 
		^ self error: 'Should not create muppet on muppet' ].
	muppetProfile := (CMIDAIRRPGMuppetContactProfile on: citizen)
		                 player: aCMIDAIRCitizen;
		                 yourself.
	citizen contactProfile: muppetProfile.
	^ muppetProfile
]

{ #category : #accessing }
CMIDAIRRPGContactProfile >> playerIndex [

	self citizen cormasModel
		submodelAt: #contact
		do: [ :contactModel | ^ contactModel playerIndexOf: citizen ].
	^ 0
]

{ #category : #accessing }
CMIDAIRRPGContactProfile >> playerName [

	self citizen cormasModel
		submodelAt: #contact
		do: [ :contactModel | ^ contactModel playerNameOf: citizen ].
	^ nil
]

{ #category : #accessing }
CMIDAIRRPGContactProfile >> probabilityFromPrior: aNumber [

	^ aNumber * immuneFactor * facemaskFactor * actionFactor
]

{ #category : #operatoins }
CMIDAIRRPGContactProfile >> vaccinated [

	isVaccinated := true
]

{ #category : #accessing }
CMIDAIRRPGContactProfile >> wellbeingPoints [

	^ wellbeingPoints
]
