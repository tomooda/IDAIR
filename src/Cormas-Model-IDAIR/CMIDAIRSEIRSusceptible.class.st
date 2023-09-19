Class {
	#name : #CMIDAIRSEIRSusceptible,
	#superclass : #CMIDAIRSEIRDiseaseDynamics,
	#category : #'Cormas-Model-IDAIR-Disease-SEIR'
}

{ #category : #accessing }
CMIDAIRSEIRSusceptible >> beta [

	^ 0.0
]

{ #category : #accessing }
CMIDAIRSEIRSusceptible >> color [

	^ Color green
]

{ #category : #accessing }
CMIDAIRSEIRSusceptible >> inCommunity [

	^ self
]

{ #category : #testing }
CMIDAIRSEIRSusceptible >> isAsymptomatic [

	^ false
]

{ #category : #testing }
CMIDAIRSEIRSusceptible >> isDead [

	^ false
]

{ #category : #testing }
CMIDAIRSEIRSusceptible >> isHospitalized [

	^ false
]

{ #category : #testing }
CMIDAIRSEIRSusceptible >> isICUed [

	^ false
]

{ #category : #testing }
CMIDAIRSEIRSusceptible >> isInCommunity [

	^ true
]

{ #category : #testing }
CMIDAIRSEIRSusceptible >> isInfected [

	^ false
]

{ #category : #testing }
CMIDAIRSEIRSusceptible >> isQuarrantined [

	^ false
]

{ #category : #testing }
CMIDAIRSEIRSusceptible >> isRecovered [

	^ false
]

{ #category : #testing }
CMIDAIRSEIRSusceptible >> isSusceptible [

	^ true
]

{ #category : #testing }
CMIDAIRSEIRSusceptible >> isSymptomatic [

	^ false
]

{ #category : #testing }
CMIDAIRSEIRSusceptible >> isTransmissible [

	^ false
]

{ #category : #accessing }
CMIDAIRSEIRSusceptible >> name [

	^ 'susceptible'
]

{ #category : #accessing }
CMIDAIRSEIRSusceptible >> next [

	^ self
]

{ #category : #accessing }
CMIDAIRSEIRSusceptible >> tau [

	^ Float infinity
]
