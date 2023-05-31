Class {
	#name : #CMIDAIRContactModel,
	#superclass : #CMIDAIRSubmodel,
	#instVars : [
		'r0',
		'estimatedTransmissibleDuration'
	],
	#category : #'Cormas-Model-IDAIR-Contact-SingleLocation'
}

{ #category : #converting }
CMIDAIRContactModel >> asPresenter [

	^ CMIDAIRContactModelPresenter on: self
]

{ #category : #defaults }
CMIDAIRContactModel >> defaultEstimatedTransmissibleDuration [

	^ 13.0
]

{ #category : #defaults }
CMIDAIRContactModel >> defaultR0 [

	^ 1.0
]

{ #category : #accessing }
CMIDAIRContactModel >> estimatedTransmissibleDuration [

	^ estimatedTransmissibleDuration ifNil: [ 
		  estimatedTransmissibleDuration := self
			                                    defaultEstimatedTransmissibleDuration ]
]

{ #category : #accessing }
CMIDAIRContactModel >> estimatedTransmissibleDuration: aNumber [

	estimatedTransmissibleDuration := aNumber
]

{ #category : #accessing }
CMIDAIRContactModel >> name [

	^ #contact
]

{ #category : #accessing }
CMIDAIRContactModel >> numberOfHealthy [

	| num |
	num := 0.
	self cormasModel theCitizens do: [ :citizen | 
		citizen isHealthy ifTrue: [ num := num + 1 ] ].
	^ num
]

{ #category : #accessing }
CMIDAIRContactModel >> numberOfNonIsolatedInfected [

	| num |
	num := 0.
	self cormasModel theCitizens do: [ :citizen | 
		(citizen isInfected and: [ citizen isIsolated not ]) ifTrue: [ 
			num := num + 1 ] ].
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

	| numberOfHealthy numberOfNonIsolatedInfected p |
	numberOfNonIsolatedInfected := self numberOfNonIsolatedInfected.
	numberOfHealthy := self numberOfHealthy.
	numberOfHealthy > 0 ifTrue: [ 
		p := self r0 asFloat * numberOfNonIsolatedInfected / numberOfHealthy
		     / self estimatedTransmissibleDuration.
		self cormasModel theCitizens do: [ :citizen | 
			(citizen isHealthy and: [ self random <= p ]) ifTrue: [ 
				citizen beInfected ] ] ]
]
