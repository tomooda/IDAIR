Class {
	#name : #CMIDAIRRPGDiseaseDynamics,
	#superclass : #CMIDAIRDiseaseDynamics,
	#instVars : [
		'duration'
	],
	#category : #'Cormas-Model-IDAIR-Disease-RPG'
}

{ #category : #accessing }
CMIDAIRRPGDiseaseDynamics class >> colors [

	^ OrderedDictionary new
		  at: 'exposed' put: Color red;
		  at: 'mild' put: Color red;
		  at: 'severe' put: Color red;
		  at: 'recovering' put: Color red;
		  at: 'hospitalized' put: Color red;
		  at: 'recovered' put: Color red;
		  at: 'dead' put: Color black;
		  yourself
]

{ #category : #testing }
CMIDAIRRPGDiseaseDynamics class >> isAbstract [

	^ self = CMIDAIRRPGDiseaseDynamics
]

{ #category : #actions }
CMIDAIRRPGDiseaseDynamics >> beAsymptomatic [

	^ CMIDAIRRPGExposed newFrom: self
]

{ #category : #actions }
CMIDAIRRPGDiseaseDynamics >> beDead [

	^ CMIDAIRRPGDead newFrom: self
]

{ #category : #actions }
CMIDAIRRPGDiseaseDynamics >> beExposed [

	^ CMIDAIRRPGExposed newFrom: self
]

{ #category : #actions }
CMIDAIRRPGDiseaseDynamics >> beHospitalized [

	^ self
]

{ #category : #actions }
CMIDAIRRPGDiseaseDynamics >> beMildSymptom [

	^ CMIDAIRRPGMildSymptom newFrom: self
]

{ #category : #actions }
CMIDAIRRPGDiseaseDynamics >> beSevereSymptom [

	^ CMIDAIRRPGSevereSymptom newFrom: self
]

{ #category : #actions }
CMIDAIRRPGDiseaseDynamics >> beSusceptible [

	^ CMIDAIRRPGSusceptible newFrom: self
]

{ #category : #accessing }
CMIDAIRRPGDiseaseDynamics >> duration [

	^ duration
]

{ #category : #accessing }
CMIDAIRRPGDiseaseDynamics >> duration: aNumber [

	^ duration := aNumber
]

{ #category : #initialization }
CMIDAIRRPGDiseaseDynamics >> initialize [

	super initialize.
	duration := 0.0
]

{ #category : #testing }
CMIDAIRRPGDiseaseDynamics >> isMildSymptom [

	^ false
]

{ #category : #testing }
CMIDAIRRPGDiseaseDynamics >> isSevereSymptom [

	^ false
]

{ #category : #accessing }
CMIDAIRRPGDiseaseDynamics >> next [

	^ self subclassResponsibility
]

{ #category : #actions }
CMIDAIRRPGDiseaseDynamics >> randomDuration [

	duration := self random * self tau
]

{ #category : #control }
CMIDAIRRPGDiseaseDynamics >> step [

	(duration := duration + self daysPerStep) >= self tau ifTrue: [ 
		^ self next ]
]
