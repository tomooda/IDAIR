Class {
	#name : #CMIDAIRRPGSusceptible,
	#superclass : #CMIDAIRRPGDiseaseDynamics,
	#category : #'Cormas-Model-IDAIR-Disease-RPG'
}

{ #category : #accessing }
CMIDAIRRPGSusceptible >> beta [

	^ 0.0
]

{ #category : #accessing }
CMIDAIRRPGSusceptible >> color [

	^ Color green
]

{ #category : #accessing }
CMIDAIRRPGSusceptible >> inCommunity [

	^ self
]

{ #category : #testing }
CMIDAIRRPGSusceptible >> isAsymptomatic [

	^ false
]

{ #category : #testing }
CMIDAIRRPGSusceptible >> isDead [

	^ false
]

{ #category : #testing }
CMIDAIRRPGSusceptible >> isHospitalized [

	^ false
]

{ #category : #testing }
CMIDAIRRPGSusceptible >> isICUed [

	^ false
]

{ #category : #testing }
CMIDAIRRPGSusceptible >> isInCommunity [

	^ true
]

{ #category : #testing }
CMIDAIRRPGSusceptible >> isInfected [

	^ false
]

{ #category : #testing }
CMIDAIRRPGSusceptible >> isQuarrantined [

	^ false
]

{ #category : #testing }
CMIDAIRRPGSusceptible >> isRecovered [

	^ false
]

{ #category : #testing }
CMIDAIRRPGSusceptible >> isSusceptible [

	^ true
]

{ #category : #testing }
CMIDAIRRPGSusceptible >> isSymptomatic [

	^ false
]

{ #category : #testing }
CMIDAIRRPGSusceptible >> isTransmissible [

	^ false
]

{ #category : #accessing }
CMIDAIRRPGSusceptible >> name [

	^ 'susceptible'
]

{ #category : #accessing }
CMIDAIRRPGSusceptible >> next [

	^ self
]

{ #category : #accessing }
CMIDAIRRPGSusceptible >> tau [

	^ Float infinity
]
