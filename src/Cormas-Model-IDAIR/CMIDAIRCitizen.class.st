Class {
	#name : #CMIDAIRCitizen,
	#superclass : #CMAgentLocation,
	#instVars : [
		'diseaseDynamics'
	],
	#category : #'Cormas-Model-IDAIR-Core'
}

{ #category : #accessing }
CMIDAIRCitizen >> beAsymptomatic [

	self diseaseDynamics: self diseaseDynamics beAsymptomatic
]

{ #category : #accessing }
CMIDAIRCitizen >> beDead [

	self diseaseDynamics: self diseaseDynamics beDead
]

{ #category : #accessing }
CMIDAIRCitizen >> beExposed [

	self diseaseDynamics: self diseaseDynamics beExposed
]

{ #category : #accessing }
CMIDAIRCitizen >> beSusceptive [

	self diseaseDynamics: self diseaseDynamics beSusceptive
]

{ #category : #defaults }
CMIDAIRCitizen >> defaultDiseaseDynamicsClass [

	^ self cormasModel defaultDiseaseDynamicsClass
]

{ #category : #accessing }
CMIDAIRCitizen >> diseaseDynamics [

	^ diseaseDynamics ifNil: [ 
		  diseaseDynamics := self defaultDiseaseDynamicsClass on: self ]
]

{ #category : #accessing }
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

{ #category : #actions }
CMIDAIRCitizen >> test [

	self diseaseDynamics: self diseaseDynamics test
]
