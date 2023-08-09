Class {
	#name : #CMIDAIRSEIRSusceptive,
	#superclass : #CMIDAIRSEIRDiseaseDynamics,
	#category : #'Cormas-Model-IDAIR-Disease-SEIR'
}

{ #category : #accessing }
CMIDAIRSEIRSusceptive >> beta [

	^ 0.0
]

{ #category : #accessing }
CMIDAIRSEIRSusceptive >> color [

	^ Color green alpha: 0.1
]

{ #category : #accessing }
CMIDAIRSEIRSusceptive >> inCommunity [

	^ self
]

{ #category : #testing }
CMIDAIRSEIRSusceptive >> isAsymptomatic [

	^ false
]

{ #category : #testing }
CMIDAIRSEIRSusceptive >> isDead [

	^ false
]

{ #category : #testing }
CMIDAIRSEIRSusceptive >> isHospitalized [

	^ false
]

{ #category : #testing }
CMIDAIRSEIRSusceptive >> isICUed [

	^ false
]

{ #category : #testing }
CMIDAIRSEIRSusceptive >> isInCommunity [

	^ true
]

{ #category : #testing }
CMIDAIRSEIRSusceptive >> isInfected [

	^ false
]

{ #category : #testing }
CMIDAIRSEIRSusceptive >> isQuarrantined [

	^ false
]

{ #category : #testing }
CMIDAIRSEIRSusceptive >> isRecovered [

	^ false
]

{ #category : #testing }
CMIDAIRSEIRSusceptive >> isSusceptive [

	^ true
]

{ #category : #testing }
CMIDAIRSEIRSusceptive >> isSymptomatic [

	^ false
]

{ #category : #testing }
CMIDAIRSEIRSusceptive >> isTransmissible [

	^ false
]

{ #category : #accessing }
CMIDAIRSEIRSusceptive >> name [

	^ 'susceptive'
]

{ #category : #accessing }
CMIDAIRSEIRSusceptive >> next [

	^ self
]

{ #category : #accessing }
CMIDAIRSEIRSusceptive >> tau [

	^ Float infinity
]
