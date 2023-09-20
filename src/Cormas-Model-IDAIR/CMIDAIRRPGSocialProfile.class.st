Class {
	#name : #CMIDAIRRPGSocialProfile,
	#superclass : #Object,
	#instVars : [
		'transientFactor',
		'cummulativeFactor'
	],
	#category : #'Cormas-Model-IDAIR-Contact-RPG'
}

{ #category : #accessing }
CMIDAIRRPGSocialProfile >> clearRound [

	transientFactor := 1.0
]

{ #category : #accessing }
CMIDAIRRPGSocialProfile >> cummulativeFactor [

	^ cummulativeFactor
]

{ #category : #accessing }
CMIDAIRRPGSocialProfile >> factor: aNumber [

	transientFactor := aNumber
]

{ #category : #initialization }
CMIDAIRRPGSocialProfile >> initialize [

	super initialize.
	transientFactor := 1.0.
	cummulativeFactor := 1.0
]

{ #category : #accessing }
CMIDAIRRPGSocialProfile >> multiplyCummulativeFactor: aNumber [

	cummulativeFactor := cummulativeFactor * aNumber
]

{ #category : #accessing }
CMIDAIRRPGSocialProfile >> probabilityFromPrior: aNumber [

	^ aNumber * transientFactor * cummulativeFactor
]

{ #category : #accessing }
CMIDAIRRPGSocialProfile >> transientFactor [

	^ transientFactor
]

{ #category : #accessing }
CMIDAIRRPGSocialProfile >> transientFactor: aNumber [

	transientFactor := aNumber
]
