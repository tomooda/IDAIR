Class {
	#name : #CMIDAIRSingleLocationContactModel,
	#superclass : #CMIDAIRContactModel,
	#instVars : [
		'socialDistanceFactor'
	],
	#category : #'Cormas-Model-IDAIR-Contact-SingleLocation'
}

{ #category : #accessing }
CMIDAIRSingleLocationContactModel class >> submodelName [

	^ 'single location'
]

{ #category : #converting }
CMIDAIRSingleLocationContactModel >> asPresenter [

	^ CMIDAIRSingleLocationContactModelPresenter on: self
]

{ #category : #accessing }
CMIDAIRSingleLocationContactModel >> daysPerStep [

	^ self cormasModel daysPerStep
]

{ #category : #defaults }
CMIDAIRSingleLocationContactModel >> defaultSocialDistanceFactor [

	^ 0.0
]

{ #category : #accessing }
CMIDAIRSingleLocationContactModel >> estimatedTransmissibleDuration [

	^ self cormasModel
		  submodelAt: #disease
		  do: [ :diseaseModel | diseaseModel estimatedTransmissibleDuration ]
]

{ #category : #accessing }
CMIDAIRSingleLocationContactModel >> initializers [

	^ {  }
]

{ #category : #accessing }
CMIDAIRSingleLocationContactModel >> numberOfSusceptive [

	| num |
	num := 0.
	self cormasModel theCitizens do: [ :citizen | 
		citizen isSusceptive ifTrue: [ num := num + 1 ] ].
	^ num
]

{ #category : #converting }
CMIDAIRSingleLocationContactModel >> openGUI [

	^ self asPresenter openWithSpec
]

{ #category : #accessing }
CMIDAIRSingleLocationContactModel >> socialDistanceFactor [

	^ socialDistanceFactor ifNil: [ 
		  socialDistanceFactor := self defaultSocialDistanceFactor ]
]

{ #category : #accessing }
CMIDAIRSingleLocationContactModel >> socialDistanceFactor: aNumber [

	socialDistanceFactor := aNumber
]

{ #category : #control }
CMIDAIRSingleLocationContactModel >> step: anInteger [

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
			     * totalBeta / numberOfCitizensInCommunity * self daysPerStep.
			self cormasModel theCitizens do: [ :citizen | 
				(citizen isSusceptive and: [ self random <= p ]) ifTrue: [ 
					citizen beExposed ] ] ] ]
]
