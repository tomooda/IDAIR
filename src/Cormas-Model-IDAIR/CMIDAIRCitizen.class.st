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
CMIDAIRCitizen >> beHealthy [

	self diseaseDynamics: self diseaseDynamics beHealthy
]

{ #category : #accessing }
CMIDAIRCitizen >> beHospitalized [

	self diseaseDynamics: self diseaseDynamics beHospitalized
]

{ #category : #accessing }
CMIDAIRCitizen >> beInfected [

	self diseaseDynamics: self diseaseDynamics beInfected
]

{ #category : #accessing }
CMIDAIRCitizen >> bePreSymptomaticMild [ 

	self diseaseDynamics: self diseaseDynamics bePreSymptomaticMild
]

{ #category : #actions }
CMIDAIRCitizen >> contact [

	patch ifNotNil: [ 
		patch isContaminated ifTrue: [ 
			self diseaseDynamics: self diseaseDynamics contact ] ]
]

{ #category : #actions }
CMIDAIRCitizen >> contaminate [

	patch ifNotNil: [ self diseaseDynamics contaminate: patch ]
]

{ #category : #defaults }
CMIDAIRCitizen >> defaultDiseaseDynamics [

	^ CMIDAIROxfordHealthy on: self
]

{ #category : #accessing }
CMIDAIRCitizen >> diseaseDynamics [

	^ diseaseDynamics ifNil: [ diseaseDynamics := self defaultDiseaseDynamics ]
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
CMIDAIRCitizen >> isHealthy [

	^ self diseaseDynamics isHealthy
]

{ #category : #testing }
CMIDAIRCitizen >> isInfected [

	^ self diseaseDynamics isInfected
]

{ #category : #testing }
CMIDAIRCitizen >> isIsolated [

	^ self diseaseDynamics isIsolated
]

{ #category : #actions }
CMIDAIRCitizen >> move [

	self randomWalkConstrainedBy: [ :locaton | true ]
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

	self diseaseDynamics: self diseaseDynamics step.
	self diseaseDynamics isActive ifTrue: [ self move ]
]

{ #category : #actions }
CMIDAIRCitizen >> test [

	self diseaseDynamics: self diseaseDynamics test
]
