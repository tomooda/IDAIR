Class {
	#name : #CMIDAIRRPGIll,
	#superclass : #CMIDAIRRPGDiseaseDynamics,
	#instVars : [
		'hospitalized'
	],
	#category : #'Cormas-Model-IDAIR-Disease-RPG'
}

{ #category : #testing }
CMIDAIRRPGIll class >> isAbstract [

	^ self = CMIDAIRRPGIll
]

{ #category : #actions }
CMIDAIRRPGIll >> beHospitalized [

	hospitalized := true
]

{ #category : #actions }
CMIDAIRRPGIll >> beUnhospitalized [

	hospitalized := false
]

{ #category : #accessing }
CMIDAIRRPGIll >> inCommunity [

	^ self
]

{ #category : #initialization }
CMIDAIRRPGIll >> initialize [

	super initialize.
	hospitalized := false
]

{ #category : #testing }
CMIDAIRRPGIll >> isAsymptomatic [

	^ false
]

{ #category : #testing }
CMIDAIRRPGIll >> isDead [

	^ false
]

{ #category : #testing }
CMIDAIRRPGIll >> isHospitalized [

	^ hospitalized ifNil: [ hospitalized := false ]
]

{ #category : #testing }
CMIDAIRRPGIll >> isICUed [

	^ false
]

{ #category : #testing }
CMIDAIRRPGIll >> isInCommunity [

	^ self isHospitalized not
]

{ #category : #testing }
CMIDAIRRPGIll >> isInfected [

	^ true
]

{ #category : #testing }
CMIDAIRRPGIll >> isQuarrantined [

	^ false
]

{ #category : #testing }
CMIDAIRRPGIll >> isRecovered [

	^ false
]

{ #category : #testing }
CMIDAIRRPGIll >> isSusceptible [

	^ false
]

{ #category : #testing }
CMIDAIRRPGIll >> isSymptomatic [

	^ true
]

{ #category : #testing }
CMIDAIRRPGIll >> isTransmissible [

	^ true
]
