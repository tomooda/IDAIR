Class {
	#name : #CMIDAIRSEIRRecovered,
	#superclass : #CMIDAIRSEIRDiseaseDynamics,
	#category : #'Cormas-Model-IDAIR-Disease-SEIR'
}

{ #category : #accessing }
CMIDAIRSEIRRecovered >> beta [

	^ 0.0
]

{ #category : #accessing }
CMIDAIRSEIRRecovered >> color [

	^ Color blue alpha: 0.1
]

{ #category : #accessing }
CMIDAIRSEIRRecovered >> inCommunity [

	^ self
]

{ #category : #testing }
CMIDAIRSEIRRecovered >> isAsymptomatic [

	^ false
]

{ #category : #testing }
CMIDAIRSEIRRecovered >> isDead [

	^ false
]

{ #category : #testing }
CMIDAIRSEIRRecovered >> isHospitalized [

	^ false
]

{ #category : #testing }
CMIDAIRSEIRRecovered >> isICUed [

	^ false
]

{ #category : #testing }
CMIDAIRSEIRRecovered >> isInCommunity [

	^ true
]

{ #category : #testing }
CMIDAIRSEIRRecovered >> isInfected [

	^ false
]

{ #category : #testing }
CMIDAIRSEIRRecovered >> isQuarrantined [

	^ false
]

{ #category : #testing }
CMIDAIRSEIRRecovered >> isRecovered [

	^ true
]

{ #category : #testing }
CMIDAIRSEIRRecovered >> isSusceptive [

	^ false
]

{ #category : #testing }
CMIDAIRSEIRRecovered >> isSymptomatic [

	^ false
]

{ #category : #testing }
CMIDAIRSEIRRecovered >> isTransmissible [

	^ false
]

{ #category : #accessing }
CMIDAIRSEIRRecovered >> name [

	^ 'recovered'
]

{ #category : #accessing }
CMIDAIRSEIRRecovered >> next [

	^ CMIDAIRSEIRSusceptive newFrom: self
]

{ #category : #accessing }
CMIDAIRSEIRRecovered >> tau [

	^ self modelParameterAt: #tau_recovered
]