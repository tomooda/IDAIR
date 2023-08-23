Class {
	#name : #CMIDAIRRPGSocialProfile,
	#superclass : #Object,
	#instVars : [
		'factor'
	],
	#category : #'Cormas-Model-IDAIR-Contact-RPG'
}

{ #category : #accessing }
CMIDAIRRPGSocialProfile >> factor [

	^ factor
]

{ #category : #accessing }
CMIDAIRRPGSocialProfile >> factor: aNumber [

	factor := aNumber
]

{ #category : #initialization }
CMIDAIRRPGSocialProfile >> initialize [

	super initialize.
	factor := 1.0
]

{ #category : #accessing }
CMIDAIRRPGSocialProfile >> probabilityFromPrior: aNumber [

	^ aNumber * factor
]
