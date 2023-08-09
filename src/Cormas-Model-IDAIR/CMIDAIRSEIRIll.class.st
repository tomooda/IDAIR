Class {
	#name : #CMIDAIRSEIRIll,
	#superclass : #CMIDAIRSEIRDiseaseDynamics,
	#category : #'Cormas-Model-IDAIR-Disease-SEIR'
}

{ #category : #accessing }
CMIDAIRSEIRIll >> beta [

	^ self modelParameterAt: #beta_ill
]

{ #category : #accessing }
CMIDAIRSEIRIll >> color [

	^ Color red alpha: 0.8
]

{ #category : #accessing }
CMIDAIRSEIRIll >> inCommunity [

	^ self
]

{ #category : #testing }
CMIDAIRSEIRIll >> isAsymptomatic [

	^ false
]

{ #category : #testing }
CMIDAIRSEIRIll >> isDead [

	^ false
]

{ #category : #testing }
CMIDAIRSEIRIll >> isHospitalized [

	^ false
]

{ #category : #testing }
CMIDAIRSEIRIll >> isICUed [

	^ false
]

{ #category : #testing }
CMIDAIRSEIRIll >> isInCommunity [

	^ true
]

{ #category : #testing }
CMIDAIRSEIRIll >> isInfected [

	^ true
]

{ #category : #testing }
CMIDAIRSEIRIll >> isQuarrantined [

	^ false
]

{ #category : #testing }
CMIDAIRSEIRIll >> isRecovered [

	^ false
]

{ #category : #testing }
CMIDAIRSEIRIll >> isSusceptive [

	^ false
]

{ #category : #testing }
CMIDAIRSEIRIll >> isSymptomatic [

	^ true
]

{ #category : #testing }
CMIDAIRSEIRIll >> isTransmissible [

	^ true
]

{ #category : #accessing }
CMIDAIRSEIRIll >> name [

	^ 'ill'
]

{ #category : #accessing }
CMIDAIRSEIRIll >> next [

	^ CMIDAIRSEIRRecovered newFrom: self
]

{ #category : #accessing }
CMIDAIRSEIRIll >> tau [

	^ self modelParameterAt: #tau_ill
]
