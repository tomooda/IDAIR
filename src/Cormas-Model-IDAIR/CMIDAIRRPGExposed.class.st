Class {
	#name : #CMIDAIRRPGExposed,
	#superclass : #CMIDAIRRPGDiseaseDynamics,
	#category : #'Cormas-Model-IDAIR-Disease-RPG'
}

{ #category : #'instance creation' }
CMIDAIRRPGExposed class >> newFrom: anObject [

	^ (super newFrom: anObject)
		  duration: 0.0;
		  yourself
]

{ #category : #accessing }
CMIDAIRRPGExposed >> beta [

	^ self modelParameterAt: #beta_exposed
]

{ #category : #accessing }
CMIDAIRRPGExposed >> color [

	^ Color yellow darker
]

{ #category : #accessing }
CMIDAIRRPGExposed >> inCommunity [

	^ self
]

{ #category : #testing }
CMIDAIRRPGExposed >> isAsymptomatic [

	^ true
]

{ #category : #testing }
CMIDAIRRPGExposed >> isDead [

	^ false
]

{ #category : #testing }
CMIDAIRRPGExposed >> isHospitalized [

	^ false
]

{ #category : #testing }
CMIDAIRRPGExposed >> isICUed [

	^ false
]

{ #category : #testing }
CMIDAIRRPGExposed >> isInCommunity [

	^ true
]

{ #category : #testing }
CMIDAIRRPGExposed >> isInfected [

	^ true
]

{ #category : #testing }
CMIDAIRRPGExposed >> isQuarrantined [

	^ false
]

{ #category : #testing }
CMIDAIRRPGExposed >> isRecovered [

	^ false
]

{ #category : #testing }
CMIDAIRRPGExposed >> isSusceptible [

	^ false
]

{ #category : #testing }
CMIDAIRRPGExposed >> isSymptomatic [

	^ false
]

{ #category : #testing }
CMIDAIRRPGExposed >> isTransmissible [

	^ true
]

{ #category : #accessing }
CMIDAIRRPGExposed >> name [

	^ 'exposed'
]

{ #category : #accessing }
CMIDAIRRPGExposed >> next [

	^ self random <= 0.7
		  ifTrue: [ CMIDAIRRPGMildSymptom newFrom: self ]
		  ifFalse: [ CMIDAIRRPGSevereSymptom newFrom: self ]
]

{ #category : #accessing }
CMIDAIRRPGExposed >> tau [

	^ self modelParameterAt: #tau_exposed
]
