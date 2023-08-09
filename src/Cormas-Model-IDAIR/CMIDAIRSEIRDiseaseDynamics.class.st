Class {
	#name : #CMIDAIRSEIRDiseaseDynamics,
	#superclass : #CMIDAIRDiseaseDynamics,
	#instVars : [
		'duration'
	],
	#category : #'Cormas-Model-IDAIR-Disease-SEIR'
}

{ #category : #testing }
CMIDAIRSEIRDiseaseDynamics class >> isAbstract [

	^ self = CMIDAIRSEIRDiseaseDynamics
]

{ #category : #actions }
CMIDAIRSEIRDiseaseDynamics >> beAsymptomatic [

	^ CMIDAIRSEIRExposed newFrom: self
]

{ #category : #actions }
CMIDAIRSEIRDiseaseDynamics >> beDead [

	^ CMIDAIRSEIRDead newFrom: self
]

{ #category : #actions }
CMIDAIRSEIRDiseaseDynamics >> beExposed [

	^ CMIDAIRSEIRExposed newFrom: self
]

{ #category : #actions }
CMIDAIRSEIRDiseaseDynamics >> beHospitalized [

	^ CMIDAIRSEIRHospitalized newFrom: self
]

{ #category : #actions }
CMIDAIRSEIRDiseaseDynamics >> beSusceptive [

	^ CMIDAIRSEIRSusceptive newFrom: self
]

{ #category : #accessing }
CMIDAIRSEIRDiseaseDynamics >> duration [

	^ duration
]

{ #category : #accessing }
CMIDAIRSEIRDiseaseDynamics >> duration: aNumber [

	^ duration := aNumber
]

{ #category : #initialization }
CMIDAIRSEIRDiseaseDynamics >> initialize [

	super initialize.
	duration := 0.0
]

{ #category : #accessing }
CMIDAIRSEIRDiseaseDynamics >> next [

	^ self subclassResponsibility
]

{ #category : #control }
CMIDAIRSEIRDiseaseDynamics >> step [

	(duration := duration + self daysPerStep) >= self tau ifTrue: [ 
		^ self next ]
]
