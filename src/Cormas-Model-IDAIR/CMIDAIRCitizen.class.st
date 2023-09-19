Class {
	#name : #CMIDAIRCitizen,
	#superclass : #CMIDAIRAgent,
	#instVars : [
		'diseaseDynamics',
		'contactProfile',
		'resourceDynamics',
		'home'
	],
	#category : #'Cormas-Model-IDAIR-Core'
}

{ #category : #events }
CMIDAIRCitizen >> ICUedAction [

	self resourceDynamics citizenICUed
]

{ #category : #'transitioning-disease' }
CMIDAIRCitizen >> beAsymptomatic [

	self diseaseDynamics: self diseaseDynamics beAsymptomatic
]

{ #category : #'transitioning-disease' }
CMIDAIRCitizen >> beDead [

	self diseaseDynamics: self diseaseDynamics beDead.
	self event: #dead
]

{ #category : #'transitioning-disease' }
CMIDAIRCitizen >> beExposed [

	self diseaseDynamics: self diseaseDynamics beExposed
]

{ #category : #'transitioning-disease' }
CMIDAIRCitizen >> beHospitalized [

	self diseaseDynamics: self diseaseDynamics beHospitalized
]

{ #category : #'transitioning-disease' }
CMIDAIRCitizen >> beMildSymptom [

	self diseaseDynamics: self diseaseDynamics beMildSymptom
]

{ #category : #'transitioning-disease' }
CMIDAIRCitizen >> beSevereSymptom [

	self diseaseDynamics: self diseaseDynamics beSevereSymptom
]

{ #category : #'transitioning-disease' }
CMIDAIRCitizen >> beSusceptible [

	self diseaseDynamics: self diseaseDynamics beSusceptible
]

{ #category : #'accessing-disease' }
CMIDAIRCitizen >> beta [

	| disease |
	disease := self diseaseDynamics.
	self resourceDynamics hasIsolation ifFalse: [ 
		disease := disease inCommunity ].
	^ disease beta
]

{ #category : #'accessing-contact' }
CMIDAIRCitizen >> contactProfile [

	^ contactProfile ifNil: [ 
		  contactProfile := self defaultContactProfileClass on: self ]
]

{ #category : #'accessing-contact' }
CMIDAIRCitizen >> contactProfile: aCMIDAIRContactProfile [

	contactProfile == aCMIDAIRContactProfile ifFalse: [ 
		contactProfile := aCMIDAIRContactProfile.
		self changed ]
]

{ #category : #events }
CMIDAIRCitizen >> deadAction [

	self resourceDynamics citizenDead
]

{ #category : #'accessing-contact' }
CMIDAIRCitizen >> defaultContactProfileClass [

	^ self cormasModel defaultContactProfileClass
]

{ #category : #'accessing-disease' }
CMIDAIRCitizen >> defaultDiseaseDynamicsClass [

	^ self cormasModel defaultDiseaseDynamicsClass
]

{ #category : #'accessing-resource' }
CMIDAIRCitizen >> defaultResourceDynamicsClass [

	^ self cormasModel defaultCitizenResourceDynamicsClass
]

{ #category : #'accessing-disease' }
CMIDAIRCitizen >> diseaseDynamics [

	^ diseaseDynamics ifNil: [ 
		  diseaseDynamics := self defaultDiseaseDynamicsClass on: self ]
]

{ #category : #'accessing-disease' }
CMIDAIRCitizen >> diseaseDynamics: aCMIDAIRDiseaseDynamics [

	diseaseDynamics == aCMIDAIRDiseaseDynamics ifFalse: [ 
		| oldDiseaseDynamics |
		oldDiseaseDynamics := diseaseDynamics.
		diseaseDynamics := aCMIDAIRDiseaseDynamics.
		self triggerEvent: oldDiseaseDynamics.
		self dead: diseaseDynamics isDead.
		self changed ]
]

{ #category : #pov }
CMIDAIRCitizen >> diseasePov [

	<pov>
	^ self diseaseDynamics color
]

{ #category : #events }
CMIDAIRCitizen >> event: aSymbol [

	aSymbol = #hospitalized ifTrue: [ ^ self hospitalizedAction ].
	aSymbol = #ICUed ifTrue: [ ^ self ICUedAction ].
	aSymbol = #quarrantined ifTrue: [ ^ self quarrantinedAction ].
	aSymbol = #released ifTrue: [ ^ self releasedAction ].
	aSymbol = #dead ifTrue: [ ^ self deadAction ]
]

{ #category : #accessing }
CMIDAIRCitizen >> home [

	^ home
]

{ #category : #accessing }
CMIDAIRCitizen >> home: aCMIDAIRLocation [

	home := aCMIDAIRLocation
]

{ #category : #events }
CMIDAIRCitizen >> hospitalizedAction [

	self resourceDynamics citizenHospitalized
]

{ #category : #testing }
CMIDAIRCitizen >> isAsymptomatic [

	^ self diseaseDynamics isAsymptomatic
]

{ #category : #testing }
CMIDAIRCitizen >> isDead [

	^ self diseaseDynamics isDead
]

{ #category : #testing }
CMIDAIRCitizen >> isHospitalized [

	^ self diseaseDynamics isHospitalized and: [ 
		  self resourceDynamics hasIsolation ]
]

{ #category : #testing }
CMIDAIRCitizen >> isICUed [

	^ self diseaseDynamics isICUed and: [ self resourceDynamics hasICU ]
]

{ #category : #testing }
CMIDAIRCitizen >> isInCommunity [

	^ self diseaseDynamics isInCommunity
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
CMIDAIRCitizen >> isSusceptible [

	^ self diseaseDynamics isSusceptible
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

	<pov>
	^ self diseasePov
]

{ #category : #events }
CMIDAIRCitizen >> quarrantinedAction [

	self resourceDynamics citizenQuarrantined
]

{ #category : #events }
CMIDAIRCitizen >> releasedAction [

	self resourceDynamics citizenReleased.
	self patch: self home
]

{ #category : #'accessing-resource' }
CMIDAIRCitizen >> resourceDynamics [

	^ resourceDynamics ifNil: [ 
		  resourceDynamics := self defaultResourceDynamicsClass on: self ]
]

{ #category : #'accessing-resource' }
CMIDAIRCitizen >> resourceDynamics: aCMIDAIRCitizenResourceDynamics [

	resourceDynamics := aCMIDAIRCitizenResourceDynamics
]

{ #category : #accessing }
CMIDAIRCitizen >> sizeOfPOV [

	^ 10
]

{ #category : #control }
CMIDAIRCitizen >> step [

	self diseaseDynamics: self diseaseDynamics step
]

{ #category : #'accessing-disease' }
CMIDAIRCitizen >> tau [

	| disease |
	disease := self diseaseDynamics.
	self resourceDynamics hasIsolation ifFalse: [ 
		disease := disease inCommunity ].
	^ disease tau
]

{ #category : #events }
CMIDAIRCitizen >> triggerEvent: aCMIDAIRDiseaseDynamics [

	| oldDiseaseDynamics |
	oldDiseaseDynamics := aCMIDAIRDiseaseDynamics.
	(diseaseDynamics isHospitalized and: [ 
		 oldDiseaseDynamics isHospitalized not ]) ifTrue: [ 
		^ self event: #hospitalized ].
	(diseaseDynamics isICUed and: [ oldDiseaseDynamics isICUed not ]) 
		ifTrue: [ ^ self event: #ICUed ].
	(diseaseDynamics isQuarrantined and: [ 
		 oldDiseaseDynamics isQuarrantined not ]) ifTrue: [ 
		^ self event: #quarrantined ].
	(diseaseDynamics isHospitalized not and: [ 
		 oldDiseaseDynamics isHospitalized ]) ifTrue: [ 
		^ self event: #released ].
	diseaseDynamics isDead ifTrue: [ ^ self event: #dead ]
]
