Class {
	#name : #CMIDAIRContactModel,
	#superclass : #CMIDAIRSubmodel,
	#instVars : [
		'r0'
	],
	#category : #'Cormas-Model-IDAIR-Contact-SingleLocation'
}

{ #category : #converting }
CMIDAIRContactModel >> asPresenter [

	^ CMIDAIRContactModelPresenter on: self
]

{ #category : #defaults }
CMIDAIRContactModel >> defaultR0 [

	^ 1.0
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

{ #category : #accessing }
CMIDAIRContactModel >> numberOfTransmissibleInCommunity [

	| num |
	num := 0.
	self cormasModel theCitizens do: [ :citizen | 
		(citizen isTransmissible and: [ citizen isHospitalized not ]) 
			ifTrue: [ num := num + 1 ] ].
	^ num
]

{ #category : #converting }
CMIDAIRContactModel >> openGUI [

	^ self asPresenter openWithSpec
]

{ #category : #accessing }
CMIDAIRContactModel >> r0 [

	^ r0 ifNil: [ r0 := self defaultR0 ]
]

{ #category : #accessing }
CMIDAIRContactModel >> r0: aNumber [

	r0 := aNumber
]

{ #category : #control }
CMIDAIRContactModel >> step: anInteger [

	| numberOfSusceptive numberOfTransmissibleInCommunity p |
	numberOfTransmissibleInCommunity := self
		                                    numberOfTransmissibleInCommunity.
	numberOfSusceptive := self numberOfSusceptive.
	(numberOfSusceptive > 0 and: [ numberOfTransmissibleInCommunity > 0 ]) 
		ifTrue: [ 
			p := self r0 asFloat * numberOfTransmissibleInCommunity
			     / numberOfSusceptive / self estimatedTransmissibleDuration.
			self cormasModel theCitizens do: [ :citizen | 
				(citizen isSusceptive and: [ self random <= p ]) ifTrue: [ 
					citizen beExposed ] ] ]
]
