Class {
	#name : #CMIDAIRSEIRIll,
	#superclass : #CMIDAIRSEIRDiseaseDynamics,
	#instVars : [
		'hospitalized'
	],
	#category : #'Cormas-Model-IDAIR-Disease-SEIR'
}

{ #category : #testing }
CMIDAIRSEIRIll class >> isAbstract [

	^ self = CMIDAIRSEIRIll
]

{ #category : #actions }
CMIDAIRSEIRIll >> beHospitalized [

	hospitalized := true
]

{ #category : #actions }
CMIDAIRSEIRIll >> beUnhospitalized [

	hospitalized := false
]

{ #category : #accessing }
CMIDAIRSEIRIll >> inCommunity [

	^ self
]

{ #category : #initialization }
CMIDAIRSEIRIll >> initialize [

	super initialize.
	hospitalized := false
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

	^ hospitalized ifNil: [ hospitalized := false ]
]

{ #category : #testing }
CMIDAIRSEIRIll >> isICUed [

	^ false
]

{ #category : #testing }
CMIDAIRSEIRIll >> isInCommunity [

	^ self isHospitalized not
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
CMIDAIRSEIRIll >> isSusceptible [

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
