Class {
	#name : #CMIDAIRRPGSocialProfile,
	#superclass : #Object,
	#instVars : [
		'socialFactor'
	],
	#category : #'Cormas-Model-IDAIR-Contact-RPG'
}

{ #category : #initialization }
CMIDAIRRPGSocialProfile >> initialize [

	super initialize.
	socialFactor := 1.0
]

{ #category : #accessing }
CMIDAIRRPGSocialProfile >> probabilityFromPrior: aNumber [

	^ aNumber * socialFactor
]

{ #category : #accessing }
CMIDAIRRPGSocialProfile >> socialFactor [

	^ socialFactor
]

{ #category : #accessing }
CMIDAIRRPGSocialProfile >> socialFactor: aNumber [

	socialFactor := aNumber
]
