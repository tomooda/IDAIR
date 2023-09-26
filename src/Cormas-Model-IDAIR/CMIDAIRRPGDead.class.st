Class {
	#name : #CMIDAIRRPGDead,
	#superclass : #CMIDAIRRPGDiseaseDynamics,
	#category : #'Cormas-Model-IDAIR-Disease-RPG'
}

{ #category : #'instance creation' }
CMIDAIRRPGDead class >> newFrom: aCMIDAIRSEIRDiseaseDynamics [

	aCMIDAIRSEIRDiseaseDynamics citizen cormasModel
		submodelAt: #disease
		do: [ :diseaseModel | diseaseModel incrementNewDead ].
	^ super newFrom: aCMIDAIRSEIRDiseaseDynamics
]

{ #category : #accessing }
CMIDAIRRPGDead >> beta [

	^ 0.0
]

{ #category : #accessing }
CMIDAIRRPGDead >> color [

	^ Color black
]

{ #category : #accessing }
CMIDAIRRPGDead >> inCommunity [

	^ self
]

{ #category : #testing }
CMIDAIRRPGDead >> isAsymptomatic [

	^ false
]

{ #category : #testing }
CMIDAIRRPGDead >> isDead [

	^ true
]

{ #category : #testing }
CMIDAIRRPGDead >> isHospitalized [

	^ false
]

{ #category : #testing }
CMIDAIRRPGDead >> isICUed [

	^ false
]

{ #category : #testing }
CMIDAIRRPGDead >> isInCommunity [

	^ false
]

{ #category : #testing }
CMIDAIRRPGDead >> isInfected [

	^ false
]

{ #category : #testing }
CMIDAIRRPGDead >> isQuarrantined [

	^ false
]

{ #category : #testing }
CMIDAIRRPGDead >> isRecovered [

	^ false
]

{ #category : #testing }
CMIDAIRRPGDead >> isSusceptible [

	^ false
]

{ #category : #testing }
CMIDAIRRPGDead >> isSymptomatic [

	^ false
]

{ #category : #testing }
CMIDAIRRPGDead >> isTransmissible [

	^ false
]

{ #category : #accessing }
CMIDAIRRPGDead >> name [

	^ 'dead'
]

{ #category : #accessing }
CMIDAIRRPGDead >> next [

	^ self
]

{ #category : #accessing }
CMIDAIRRPGDead >> tau [

	^ Float infinity
]
