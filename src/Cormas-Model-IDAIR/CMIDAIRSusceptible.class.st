Class {
	#name : #CMIDAIRSusceptible,
	#superclass : #CMIDAIRDiseaseDynamics,
	#instVars : [
		'duration'
	],
	#category : #'Cormas-Model-IDAIR'
}

{ #category : #testing }
CMIDAIRSusceptible class >> isAbstract [

	^ self = CMIDAIRSusceptible
]

{ #category : #'instance creation' }
CMIDAIRSusceptible class >> newFrom: anObject [

	^ (super newFrom: anObject)
		  duration: 0.0;
		  yourself
]

{ #category : #transitioning }
CMIDAIRSusceptible >> beSusceptible [

	^ self
]

{ #category : #actions }
CMIDAIRSusceptible >> contact [

	^ self
]

{ #category : #accessing }
CMIDAIRSusceptible >> duration [

	^ duration ifNil: [ duration := 0.0 ]
]

{ #category : #accessing }
CMIDAIRSusceptible >> duration: aNumber [

	duration := aNumber
]
