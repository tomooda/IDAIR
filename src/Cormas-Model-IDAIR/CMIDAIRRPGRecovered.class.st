Class {
	#name : #CMIDAIRRPGRecovered,
	#superclass : #CMIDAIRRPGDiseaseDynamics,
	#category : #'Cormas-Model-IDAIR-Disease-RPG'
}

{ #category : #'instance creation' }
CMIDAIRRPGRecovered class >> newFrom: aCMIDAIRSEIRDiseaseDynamics [

	aCMIDAIRSEIRDiseaseDynamics citizen cormasModel
		submodelAt: #disease
		do: [ :diseaseModel | diseaseModel incrementNewRecovered ].
	^ super newFrom: aCMIDAIRSEIRDiseaseDynamics
]

{ #category : #accessing }
CMIDAIRRPGRecovered >> beta [

	^ 0.0
]

{ #category : #accessing }
CMIDAIRRPGRecovered >> color [

	^ Color blue
]

{ #category : #accessing }
CMIDAIRRPGRecovered >> inCommunity [

	^ self
]

{ #category : #testing }
CMIDAIRRPGRecovered >> isAsymptomatic [

	^ false
]

{ #category : #testing }
CMIDAIRRPGRecovered >> isDead [

	^ false
]

{ #category : #testing }
CMIDAIRRPGRecovered >> isHospitalized [

	^ false
]

{ #category : #testing }
CMIDAIRRPGRecovered >> isICUed [

	^ false
]

{ #category : #testing }
CMIDAIRRPGRecovered >> isInCommunity [

	^ true
]

{ #category : #testing }
CMIDAIRRPGRecovered >> isInfected [

	^ false
]

{ #category : #testing }
CMIDAIRRPGRecovered >> isQuarrantined [

	^ false
]

{ #category : #testing }
CMIDAIRRPGRecovered >> isRecovered [

	^ true
]

{ #category : #testing }
CMIDAIRRPGRecovered >> isSusceptible [

	^ false
]

{ #category : #testing }
CMIDAIRRPGRecovered >> isSymptomatic [

	^ false
]

{ #category : #testing }
CMIDAIRRPGRecovered >> isTransmissible [

	^ false
]

{ #category : #accessing }
CMIDAIRRPGRecovered >> name [

	^ 'recovered'
]

{ #category : #accessing }
CMIDAIRRPGRecovered >> next [

	^ CMIDAIRRPGSusceptible newFrom: self
]

{ #category : #accessing }
CMIDAIRRPGRecovered >> tau [

	^ self modelParameterAt: #tau_recovered
]
