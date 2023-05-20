Class {
	#name : #CMIDAIRCitizen,
	#superclass : #CMAgentLocation,
	#instVars : [
		'diseaseDynamics'
	],
	#category : #'Cormas-Model-IDAIR'
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
CMIDAIRCitizen >> bePreSymptomaticMild [ 

	self diseaseDynamics: self diseaseDynamics bePreSymptomaticMild
]

{ #category : #accessing }
CMIDAIRCitizen >> beSusceptible [

	self diseaseDynamics: self diseaseDynamics beSusceptible
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

	^ CMIDAIRHealthy on: self
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