Class {
	#name : #CMIDAIRRPGResourceModel,
	#superclass : #CMIDAIRResourceModel,
	#instVars : [
		'numICUs',
		'numBeds',
		'occupiedICUs',
		'occupiedBeds'
	],
	#category : #'Cormas-Model-IDAIR-Resource-RPG'
}

{ #category : #accessing }
CMIDAIRRPGResourceModel class >> submodelName [

	^ 'RPG'
]

{ #category : #converting }
CMIDAIRRPGResourceModel >> asPresenter [

	^ CMIDAIRRPGResourceModelPresenter on: self
]

{ #category : #operations }
CMIDAIRRPGResourceModel >> citizenDead [

	occupiedICUs + occupiedBeds < self cormasModel numberOfSymptomatic 
		ifTrue: [ ^ self ].
	occupiedBeds > 0 ifTrue: [ 
		occupiedBeds := occupiedBeds - 1.
		^ self ].
	occupiedICUs > 0 ifTrue: [ 
		occupiedICUs := occupiedICUs - 1.
		^ self ]
]

{ #category : #operations }
CMIDAIRRPGResourceModel >> citizenRecovered [

	occupiedICUs > 0 ifTrue: [ 
		occupiedICUs := occupiedICUs - 1.
		^ self ].
	occupiedBeds > 0 ifTrue: [ 
		occupiedBeds := occupiedBeds - 1.
		^ self ]
]

{ #category : #control }
CMIDAIRRPGResourceModel >> consume: anInteger [

	
]

{ #category : #defaults }
CMIDAIRRPGResourceModel >> defaultCitizenResourceDynamicsClass [

	^ CMIDAIRRPGCitizenResourceDynamics
]

{ #category : #operations }
CMIDAIRRPGResourceModel >> increaseBeds: anInteger ICUs: anotherInteger [

	numBeds := numBeds + anInteger.
	numICUs := numICUs + anotherInteger
]

{ #category : #initialization }
CMIDAIRRPGResourceModel >> init [

	
]

{ #category : #initialization }
CMIDAIRRPGResourceModel >> initialize [

	super initialize.
	numICUs := 2.0.
	numBeds := 10.0.
	occupiedBeds := 0.
	occupiedICUs := 0
]

{ #category : #accessing }
CMIDAIRRPGResourceModel >> initializers [

	^ {  }
]

{ #category : #accessing }
CMIDAIRRPGResourceModel >> numBeds [

	^ numBeds
]

{ #category : #accessing }
CMIDAIRRPGResourceModel >> numBeds: aNumber [

	numBeds := aNumber
]

{ #category : #accessing }
CMIDAIRRPGResourceModel >> numICUs [

	^ numICUs
]

{ #category : #accessing }
CMIDAIRRPGResourceModel >> numICUs: aNumber [

	numICUs := aNumber
]

{ #category : #accessing }
CMIDAIRRPGResourceModel >> occupiedBeds [

	^ occupiedBeds
]

{ #category : #accessing }
CMIDAIRRPGResourceModel >> occupiedBeds: anInteger [

	occupiedBeds := anInteger
]

{ #category : #accessing }
CMIDAIRRPGResourceModel >> occupiedICUs [

	^ occupiedICUs
]

{ #category : #accessing }
CMIDAIRRPGResourceModel >> occupiedICUs: anInteger [

	occupiedICUs := anInteger
]

{ #category : #operations }
CMIDAIRRPGResourceModel >> occupyBed [

	numBeds > occupiedBeds ifTrue: [ occupiedBeds := occupiedBeds + 1 ]
]

{ #category : #operations }
CMIDAIRRPGResourceModel >> occupyICU [

	numICUs > occupiedICUs ifTrue: [ occupiedICUs := occupiedICUs + 1 ]
]

{ #category : #accessing }
CMIDAIRRPGResourceModel >> socialPreventionResourceFactor [

	^ 1.0
]

{ #category : #control }
CMIDAIRRPGResourceModel >> supply: anInteger [

	
]
