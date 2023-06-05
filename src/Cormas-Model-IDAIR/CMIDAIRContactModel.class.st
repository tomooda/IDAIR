Class {
	#name : #CMIDAIRContactModel,
	#superclass : #CMIDAIRSubmodel,
	#instVars : [
		'socialDistanceFactor'
	],
	#category : #'Cormas-Model-IDAIR-Contact-SingleLocation'
}

{ #category : #converting }
CMIDAIRContactModel >> asPresenter [

	^ CMIDAIRContactModelPresenter on: self
]

{ #category : #defaults }
CMIDAIRContactModel >> defaultSocialDistanceFactor [

	^ 0.0
]

{ #category : #accessing }
CMIDAIRContactModel >> estimatedTransmissibleDuration [

	^ self cormasModel
		  submodelAt: #disease
		  do: [ :diseaseModel | diseaseModel estimatedTransmissibleDuration ]
]

{ #category : #accessing }
CMIDAIRContactModel >> name [

	^ #contact
]

{ #category : #accessing }
CMIDAIRContactModel >> numberOfSusceptive [

	| num |
	num := 0.
	self cormasModel theCitizens do: [ :citizen | 
		citizen isSusceptive ifTrue: [ num := num + 1 ] ].
	^ num
]

{ #category : #converting }
CMIDAIRContactModel >> openGUI [

	^ self asPresenter openWithSpec
]

{ #category : #accessing }
CMIDAIRContactModel >> socialDistanceFactor [

	^ socialDistanceFactor ifNil: [ 
		  socialDistanceFactor := self defaultSocialDistanceFactor ]
]

{ #category : #accessing }
CMIDAIRContactModel >> socialDistanceFactor: aNumber [

	socialDistanceFactor := aNumber
]

{ #category : #control }
CMIDAIRContactModel >> step: anInteger [

	| numberOfCitizensInCommunity |
	numberOfCitizensInCommunity := 0.
	self cormasModel theCitizens do: [ :citizen | 
		citizen isInCommunity ifTrue: [ 
			numberOfCitizensInCommunity := numberOfCitizensInCommunity + 1 ] ].

	numberOfCitizensInCommunity > 0 ifTrue: [ 
		| totalBeta |
		totalBeta := self cormasModel theCitizens
			             inject: 0.0
			             into: [ :sum :citizen | 
				             citizen diseaseDynamics beta
				             / citizen diseaseDynamics tau + sum ].
		totalBeta > 0.0 ifTrue: [ 
			| p |
			p := (1.0 - self socialDistanceFactor min: 1.0 max: 0.0)
			     * totalBeta / numberOfCitizensInCommunity.
			self cormasModel theCitizens do: [ :citizen | 
				(citizen isSusceptive and: [ self random <= p ]) ifTrue: [ 
					citizen beExposed ] ] ] ]
]
