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
		  at: 'susceptible' put: Color green;
		  at: 'exposed' put: Color yellow;
		  at: 'mild' put: (Color red mixed: 0.5 with: Color yellow);
		  at: 'severe' put: Color red;
		  at: 'recovering' put: (Color red mixed: 0.5 with: Color blue);
		  at: 'hospitalized' put: Color gray;
		  at: 'recovered' put: Color blue;
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

{ #category : #accessing }
CMIDAIRRPGDiseaseDynamics >> next [

	^ self subclassResponsibility
]

{ #category : #control }
CMIDAIRRPGDiseaseDynamics >> step [

	(duration := duration + self daysPerStep) >= self tau ifTrue: [ 
		^ self next ]
]
