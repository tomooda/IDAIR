Class {
	#name : #CMIDAIRCitizen,
	#superclass : #CMAgentLocation,
	#instVars : [
		'diseaseDynamics'
	],
	#category : #'Cormas-Model-IDAIR-Core'
}

{ #category : #'transitioning-disease' }
CMIDAIRCitizen >> beAsymptomatic [

	self diseaseDynamics: self diseaseDynamics beAsymptomatic
]

{ #category : #'transitioning-disease' }
CMIDAIRCitizen >> beDead [

	self diseaseDynamics: self diseaseDynamics beDead
]

{ #category : #'transitioning-disease' }
CMIDAIRCitizen >> beExposed [

	self diseaseDynamics: self diseaseDynamics beExposed
]

{ #category : #'transitioning-disease' }
CMIDAIRCitizen >> beSusceptive [

	self diseaseDynamics: self diseaseDynamics beSusceptive
]

{ #category : #defaults }
CMIDAIRCitizen >> defaultDiseaseDynamicsClass [

	^ self cormasModel defaultDiseaseDynamicsClass
]

{ #category : #'accessing-disease' }
CMIDAIRCitizen >> diseaseDynamics [

	^ diseaseDynamics ifNil: [ 
		  diseaseDynamics := self defaultDiseaseDynamicsClass on: self ]
]

{ #category : #'accessing-disease' }
CMIDAIRCitizen >> diseaseDynamics: aCMIDAIRDiseaseDynamics [

	diseaseDynamics == aCMIDAIRDiseaseDynamics ifFalse: [ 
		diseaseDynamics := aCMIDAIRDiseaseDynamics.
		self dead: diseaseDynamics isDead.
		self changed ]
]

{ #category : #pov }
CMIDAIRCitizen >> diseasePov [

	<pov>
	^ self diseaseDynamics color
]

{ #category : #'accessing-disease' }
CMIDAIRCitizen >> estimatedTransmissibleDuration [

	^ self diseaseDynamics estimatedTransmissibleDuration
]

{ #category : #testing }
CMIDAIRCitizen >> isAsymptomatic [

	^ self diseaseDynamics isAsymptomatic
]

{ #category : #testing }
CMIDAIRCitizen >> isHospitalized [

	^ self diseaseDynamics isHospitalized
]

{ #category : #testing }
CMIDAIRCitizen >> isICUed [

	^ self diseaseDynamics isICUed
]

{ #category : #testing }
CMIDAIRCitizen >> isInfected [

	^ self diseaseDynamics isInfected
]

{ #category : #testing }
CMIDAIRCitizen >> isRecovered [

	^ self diseaseDynamics isRecovered
]

{ #category : #testing }
CMIDAIRCitizen >> isSusceptive [

	^ self diseaseDynamics isSusceptive
]

{ #category : #testing }
CMIDAIRCitizen >> isSymptomatic [

	^ self diseaseDynamics isAsymptomatic
]

{ #category : #testing }
CMIDAIRCitizen >> isTransmissible [

	^ self diseaseDynamics isTransmissible
]

{ #category : #pov }
CMIDAIRCitizen >> pov [

	^ self diseasePov
]

{ #category : #accessing }
CMIDAIRCitizen >> sizeOfPOV [

	^ 10
]

{ #category : #control }
CMIDAIRCitizen >> step [

	self diseaseDynamics: self diseaseDynamics step
]
