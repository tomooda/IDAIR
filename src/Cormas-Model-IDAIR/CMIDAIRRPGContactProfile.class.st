Class {
	#name : #CMIDAIRRPGContactProfile,
	#superclass : #CMIDAIRContactProfile,
	#instVars : [
		'immuneFactor',
		'actionFactor',
		'actionName'
	],
	#category : #'Cormas-Model-IDAIR-Contact-RPG'
}

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

	^ actionName
]

{ #category : #accessing }
CMIDAIRRPGContactProfile >> actionName: aString [

	actionName := aString
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
	actionFactor := 1.0.
	actionName := ''
]

{ #category : #testing }
CMIDAIRRPGContactProfile >> isMuppetContactProfile [

	^ false
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
CMIDAIRRPGContactProfile >> probabilityFromPrior: aNumber [

	^ aNumber * immuneFactor * actionFactor
]
