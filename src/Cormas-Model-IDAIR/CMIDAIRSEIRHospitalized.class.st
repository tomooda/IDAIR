Class {
	#name : #CMIDAIRSEIRHospitalized,
	#superclass : #CMIDAIRSEIRDiseaseDynamics,
	#category : #'Cormas-Model-IDAIR-Disease-SEIR'
}

{ #category : #accessing }
CMIDAIRSEIRHospitalized >> beta [

	^ 0.0
]

{ #category : #accessing }
CMIDAIRSEIRHospitalized >> color [

	^ Color gray
]

{ #category : #accessing }
CMIDAIRSEIRHospitalized >> inCommunity [

	^ CMIDAIRSEIRIll newFrom: self
]

{ #category : #testing }
CMIDAIRSEIRHospitalized >> isAsymptomatic [

	^ false
]

{ #category : #testing }
CMIDAIRSEIRHospitalized >> isDead [

	^ false
]

{ #category : #testing }
CMIDAIRSEIRHospitalized >> isHospitalized [

	^ true
]

{ #category : #testing }
CMIDAIRSEIRHospitalized >> isICUed [

	^ false
]

{ #category : #testing }
CMIDAIRSEIRHospitalized >> isInCommunity [

	^ false
]

{ #category : #testing }
CMIDAIRSEIRHospitalized >> isInfected [

	^ true
]

{ #category : #testing }
CMIDAIRSEIRHospitalized >> isQuarrantined [

	^ false
]

{ #category : #testing }
CMIDAIRSEIRHospitalized >> isRecovered [

	^ false
]

{ #category : #testing }
CMIDAIRSEIRHospitalized >> isSusceptible [

	^ false
]

{ #category : #testing }
CMIDAIRSEIRHospitalized >> isSymptomatic [

	^ true
]

{ #category : #testing }
CMIDAIRSEIRHospitalized >> isTransmissible [

	^ true
]

{ #category : #accessing }
CMIDAIRSEIRHospitalized >> name [

	^ 'hospitalized'
]

{ #category : #accessing }
CMIDAIRSEIRHospitalized >> next [

	^ CMIDAIRSEIRRecovered newFrom: self
]

{ #category : #accessing }
CMIDAIRSEIRHospitalized >> tau [

	^ self modelParameterAt: #tau_hospitalized
]
