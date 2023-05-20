Class {
	#name : #CMIDAIRSusceptible,
	#superclass : #CMIDAIRDiseaseDynamics,
	#instVars : [
		'duration',
		'recoveryPeriod'
	],
	#category : #'Cormas-Model-IDAIR'
}

{ #category : #testing }
CMIDAIRSusceptible class >> isAbstract [

	^ self = CMIDAIRSusceptible
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

	^ duration ifNil: [ duration := 0 ]
]

{ #category : #accessing }
CMIDAIRSusceptible >> duration: anInteger [

	duration := anInteger
]

{ #category : #parameters }
CMIDAIRSusceptible >> recoveryCurve [

	^ self random * 30 + 15
]

{ #category : #accessing }
CMIDAIRSusceptible >> recoveryPeriod [

	^ recoveryPeriod ifNil: [ recoveryPeriod := self recoveryCurve ]
]

{ #category : #accessing }
CMIDAIRSusceptible >> recoveryPeriod: anObject [

	recoveryPeriod := anObject
]
