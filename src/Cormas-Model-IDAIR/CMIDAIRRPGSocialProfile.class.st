Class {
	#name : #CMIDAIRRPGSocialProfile,
	#superclass : #Object,
	#instVars : [
		'transientFactor',
		'cummulativeFactor',
		'action'
	],
	#category : #'Cormas-Model-IDAIR-Contact-RPG'
}

{ #category : #accessing }
CMIDAIRRPGSocialProfile >> action: aCMIDAIRPolicymakerAction [

	action := aCMIDAIRPolicymakerAction
]

{ #category : #accessing }
CMIDAIRRPGSocialProfile >> clearRound [

	transientFactor := 1.0.
	action := nil
]

{ #category : #accessing }
CMIDAIRRPGSocialProfile >> cummulativeFactor [

	^ cummulativeFactor
]

{ #category : #operations }
CMIDAIRRPGSocialProfile >> executeAction [

	action ifNotNil: [ action execute: self ]
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
