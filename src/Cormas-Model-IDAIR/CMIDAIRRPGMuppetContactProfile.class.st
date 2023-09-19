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
CMIDAIRRPGMuppetContactProfile >> clearRound [
]

{ #category : #accessing }
CMIDAIRRPGMuppetContactProfile >> immuneFactor: aNumber [
]

{ #category : #testing }
CMIDAIRRPGMuppetContactProfile >> isMuppetContactProfile [

	^ true
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
CMIDAIRRPGMuppetContactProfile >> probabilityFromPrior: aNumber [

	| context |
	context := thisContext sender.
	[ context notNil ] whileTrue: [ 
		context receiver == self ifTrue: [ 
			^ self error: 'Recursive mupplets' ].
		context := context sender ].
	^ player contactProfile probabilityFromPrior: aNumber
]