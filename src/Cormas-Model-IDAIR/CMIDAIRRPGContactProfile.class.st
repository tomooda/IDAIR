Class {
	#name : #CMIDAIRRPGContactProfile,
	#superclass : #CMIDAIRContactProfile,
	#instVars : [
		'immuneFactor',
		'actionFactor'
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
	actionFactor := 1.0
]

{ #category : #accessing }
CMIDAIRRPGContactProfile >> probabilityFromPrior: aNumber [

	^ aNumber * immuneFactor * actionFactor
]
