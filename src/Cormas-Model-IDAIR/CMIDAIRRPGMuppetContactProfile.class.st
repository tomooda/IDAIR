Class {
	#name : #CMIDAIRRPGMuppetContactProfile,
	#superclass : #CMIDAIRContactProfile,
	#instVars : [
		'player'
	],
	#category : #'Cormas-Model-IDAIR-Contact-RPG'
}

{ #category : #accessing }
CMIDAIRRPGMuppetContactProfile >> actionFactor: aNumber [
]

{ #category : #accessing }
CMIDAIRRPGMuppetContactProfile >> addToWellbeingPoints: anInteger [

	
]

{ #category : #accessing }
CMIDAIRRPGMuppetContactProfile >> clearRound [
]

{ #category : #actions }
CMIDAIRRPGMuppetContactProfile >> executeAction [

	player contactProfile action ifNotNil: [ :action | 
		action execute: self citizen ]
]

{ #category : #accessing }
CMIDAIRRPGMuppetContactProfile >> facemaskFactor: aNumber [

	
]

{ #category : #actions }
CMIDAIRRPGMuppetContactProfile >> facemasked [

	
]

{ #category : #accessing }
CMIDAIRRPGMuppetContactProfile >> immuneFactor: aNumber [
]

{ #category : #testing }
CMIDAIRRPGMuppetContactProfile >> isMuppetContactProfile [

	^ true
]

{ #category : #accessing }
CMIDAIRRPGMuppetContactProfile >> isVaccinated [

	| context |
	context := thisContext sender.
	[ context notNil ] whileTrue: [ 
		context receiver == self ifTrue: [ 
			^ self error: 'Recursive mupplets' ].
		context := context sender ].
	^ player contactProfile isVaccinated
]

{ #category : #actions }
CMIDAIRRPGMuppetContactProfile >> nofacemasked [

	
]

{ #category : #actions }
CMIDAIRRPGMuppetContactProfile >> novaccinated [

	
]

{ #category : #accessing }
CMIDAIRRPGMuppetContactProfile >> player [

	^ player
]

{ #category : #accessing }
CMIDAIRRPGMuppetContactProfile >> player: aCMIDAIRCitizen [

	player := aCMIDAIRCitizen
]

{ #category : #accessing }
CMIDAIRRPGMuppetContactProfile >> playerIndex [

	^ player contactProfile playerIndex
]

{ #category : #accessing }
CMIDAIRRPGMuppetContactProfile >> probabilityFromPrior: aNumber [

	| context |
	context := thisContext sender.
	[ context notNil ] whileTrue: [ 
		context receiver == self ifTrue: [ 
			^ self error: 'Recursive mupplets' ].
		context := context sender ].
	^ player contactProfile probabilityFromPrior: aNumber
]

{ #category : #actions }
CMIDAIRRPGMuppetContactProfile >> vaccinated [

	
]
