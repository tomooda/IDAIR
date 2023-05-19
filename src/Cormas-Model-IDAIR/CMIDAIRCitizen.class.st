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
CMIDAIRCitizen >> beHomeCared [

	self diseaseDynamics: self diseaseDynamics beHomeCared
]

{ #category : #accessing }
CMIDAIRCitizen >> beHospitalized [

	self diseaseDynamics: self diseaseDynamics beHospitalized
]

{ #category : #accessing }
CMIDAIRCitizen >> beICUed [

	self diseaseDynamics: self diseaseDynamics beICUed
]

{ #category : #accessing }
CMIDAIRCitizen >> beIncubative [

	self diseaseDynamics: self diseaseDynamics beIncubative
]

{ #category : #accessing }
CMIDAIRCitizen >> beNegative [

	self diseaseDynamics: self diseaseDynamics beNegative
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

	^ CMIDAIRNegative new
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
