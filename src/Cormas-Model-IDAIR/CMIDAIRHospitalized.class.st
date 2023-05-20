Class {
	#name : #CMIDAIRHospitalized,
	#superclass : #CMIDAIRSymptomatic,
	#instVars : [
		'toSurvive'
	],
	#category : #'Cormas-Model-IDAIR'
}

{ #category : #accessing }
CMIDAIRHospitalized >> color [

	^ Color black
]

{ #category : #actions }
CMIDAIRHospitalized >> contaminate: aCMIDAIRLocation [

	
]

{ #category : #testing }
CMIDAIRHospitalized >> isActive [

	^ false
]

{ #category : #testing }
CMIDAIRHospitalized >> isIsolated [

	^ true
]

{ #category : #testing }
CMIDAIRHospitalized >> isTransmissible [

	^ true
]

{ #category : #accessing }
CMIDAIRHospitalized >> name [

	^ 'hospitalized'
]

{ #category : #actions }
CMIDAIRHospitalized >> step [

	self duration: self duration + 1.
	self toSurvive
		ifTrue: [ 
		self duration >= self tauHospRec ifTrue: [ ^ self beHealthy ] ]
		ifFalse: [ self duration >= self tauCrit ifTrue: [ ^ self beDead ] ].
	^ self
]

{ #category : #actions }
CMIDAIRHospitalized >> test [

	^ self
]

{ #category : #testing }
CMIDAIRHospitalized >> toSurvive [

	^ toSurvive ifNil: [ 
		  toSurvive := self random <= self pSurvivalInHospital ]
]
