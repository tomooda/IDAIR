Class {
	#name : #CMIDAIRSEIRExposed,
	#superclass : #CMIDAIRSEIRDiseaseDynamics,
	#category : #'Cormas-Model-IDAIR-Disease-SEIR'
}

{ #category : #'instance creation' }
CMIDAIRSEIRExposed class >> newFrom: anObject [

	^ (super newFrom: anObject)
		  duration: 0.0;
		  yourself
]

{ #category : #accessing }
CMIDAIRSEIRExposed >> beta [

	^ self modelParameterAt: #beta_exposed
]

{ #category : #accessing }
CMIDAIRSEIRExposed >> color [

	^ Color yellow darker alpha: 0.5
]

{ #category : #accessing }
CMIDAIRSEIRExposed >> inCommunity [

	^ self
]

{ #category : #testing }
CMIDAIRSEIRExposed >> isAsymptomatic [

	^ true
]

{ #category : #testing }
CMIDAIRSEIRExposed >> isDead [

	^ false
]

{ #category : #testing }
CMIDAIRSEIRExposed >> isHospitalized [

	^ false
]

{ #category : #testing }
CMIDAIRSEIRExposed >> isICUed [

	^ false
]

{ #category : #testing }
CMIDAIRSEIRExposed >> isInCommunity [

	^ true
]

{ #category : #testing }
CMIDAIRSEIRExposed >> isInfected [

	^ true
]

{ #category : #testing }
CMIDAIRSEIRExposed >> isQuarrantined [

	^ false
]

{ #category : #testing }
CMIDAIRSEIRExposed >> isRecovered [

	^ false
]

{ #category : #testing }
CMIDAIRSEIRExposed >> isSusceptive [

	^ false
]

{ #category : #testing }
CMIDAIRSEIRExposed >> isSymptomatic [

	^ false
]

{ #category : #testing }
CMIDAIRSEIRExposed >> isTransmissible [

	^ true
]

{ #category : #accessing }
CMIDAIRSEIRExposed >> name [

	^ 'exposed'
]

{ #category : #accessing }
CMIDAIRSEIRExposed >> next [

	^ CMIDAIRSEIRIll newFrom: self
]

{ #category : #accessing }
CMIDAIRSEIRExposed >> tau [

	^ self modelParameterAt: #tau_exposed
]
