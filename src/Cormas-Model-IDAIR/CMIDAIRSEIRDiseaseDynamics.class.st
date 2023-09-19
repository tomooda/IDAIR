Class {
	#name : #CMIDAIRSEIRDiseaseDynamics,
	#superclass : #CMIDAIRDiseaseDynamics,
	#instVars : [
		'duration'
	],
	#category : #'Cormas-Model-IDAIR-Disease-SEIR'
}

{ #category : #accessing }
CMIDAIRSEIRDiseaseDynamics class >> colors [

	^ OrderedDictionary new
		  at: 'susceptible' put: Color green;
		  at: 'exposed' put: Color yellow;
		  at: 'ill' put: Color red;
		  at: 'hospitalized' put: Color gray;
		  at: 'recovered' put: Color blue;
		  at: 'dead' put: Color black;
		  yourself
]

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

	^ self
]

{ #category : #actions }
CMIDAIRSEIRDiseaseDynamics >> beSusceptible [

	^ CMIDAIRSEIRSusceptible newFrom: self
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
