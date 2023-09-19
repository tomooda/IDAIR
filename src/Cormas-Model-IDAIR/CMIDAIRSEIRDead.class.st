Class {
	#name : #CMIDAIRSEIRDead,
	#superclass : #CMIDAIRSEIRDiseaseDynamics,
	#category : #'Cormas-Model-IDAIR-Disease-SEIR'
}

{ #category : #accessing }
CMIDAIRSEIRDead >> beta [

	^ 0.0
]

{ #category : #accessing }
CMIDAIRSEIRDead >> color [

	^ Color black
]

{ #category : #accessing }
CMIDAIRSEIRDead >> inCommunity [

	^ self
]

{ #category : #testing }
CMIDAIRSEIRDead >> isAsymptomatic [

	^ false
]

{ #category : #testing }
CMIDAIRSEIRDead >> isDead [

	^ true
]

{ #category : #testing }
CMIDAIRSEIRDead >> isHospitalized [

	^ false
]

{ #category : #testing }
CMIDAIRSEIRDead >> isICUed [

	^ false
]

{ #category : #testing }
CMIDAIRSEIRDead >> isInCommunity [

	^ false
]

{ #category : #testing }
CMIDAIRSEIRDead >> isInfected [

	^ false
]

{ #category : #testing }
CMIDAIRSEIRDead >> isQuarrantined [

	^ false
]

{ #category : #testing }
CMIDAIRSEIRDead >> isRecovered [

	^ false
]

{ #category : #testing }
CMIDAIRSEIRDead >> isSusceptible [

	^ false
]

{ #category : #testing }
CMIDAIRSEIRDead >> isSymptomatic [

	^ false
]

{ #category : #testing }
CMIDAIRSEIRDead >> isTransmissible [

	^ false
]

{ #category : #accessing }
CMIDAIRSEIRDead >> name [

	^ 'dead'
]

{ #category : #accessing }
CMIDAIRSEIRDead >> next [

	^ self
]

{ #category : #accessing }
CMIDAIRSEIRDead >> tau [

	^ Float infinity
]
