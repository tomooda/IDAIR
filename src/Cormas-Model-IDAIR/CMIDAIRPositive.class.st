Class {
	#name : #CMIDAIRPositive,
	#superclass : #CMIDAIRDiseaseDynamics,
	#instVars : [
		'duration',
		'recoveryPeriod'
	],
	#category : #'Cormas-Model-IDAIR'
}

{ #category : #testing }
CMIDAIRPositive class >> isAbstract [

	^ self = CMIDAIRPositive
]

{ #category : #actions }
CMIDAIRPositive >> contact [

	^ self
]

{ #category : #accessing }
CMIDAIRPositive >> duration [

	^ duration ifNil: [ duration := 0 ]
]

{ #category : #accessing }
CMIDAIRPositive >> duration: anInteger [

	duration := anInteger
]

{ #category : #parameters }
CMIDAIRPositive >> recoveryCurve [

	^ self random * 30 + 15
]

{ #category : #accessing }
CMIDAIRPositive >> recoveryPeriod [

	^ recoveryPeriod ifNil: [ recoveryPeriod := self recoveryCurve ]
]

{ #category : #accessing }
CMIDAIRPositive >> recoveryPeriod: anObject [

	recoveryPeriod := anObject
]
