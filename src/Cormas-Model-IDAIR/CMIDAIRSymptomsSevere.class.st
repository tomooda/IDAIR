Class {
	#name : #CMIDAIRSymptomsSevere,
	#superclass : #CMIDAIRSymptomatic,
	#instVars : [
		'toBeHospitalized'
	],
	#category : #'Cormas-Model-IDAIR-Disease'
}

{ #category : #accessing }
CMIDAIRSymptomsSevere >> color [

	^ self modelParameterAt: #symptomsSevereColor
]

{ #category : #actions }
CMIDAIRSymptomsSevere >> contaminate: aCMIDAIRLocation [

	self random <= self pContaminate ifTrue: [ 
		aCMIDAIRLocation isContaminated: true ]
]

{ #category : #testing }
CMIDAIRSymptomsSevere >> isActive [

	^ false
]

{ #category : #testing }
CMIDAIRSymptomsSevere >> isTransmissible [

	^ true
]

{ #category : #accessing }
CMIDAIRSymptomsSevere >> name [

	^ 'severe symptom'
]

{ #category : #parameters }
CMIDAIRSymptomsSevere >> pContaminate [

	^ 0.9
]

{ #category : #actions }
CMIDAIRSymptomsSevere >> step [

	self duration: self duration + 1.
	self toBeHospitalized
		ifTrue: [ 
		self duration >= self tauHosp ifTrue: [ ^ self beHospitalized ] ]
		ifFalse: [ 
		self duration >= self tauRec ifTrue: [ ^ self beHealthy ] ].
	^ self
]

{ #category : #actions }
CMIDAIRSymptomsSevere >> test [

	^ self
]

{ #category : #accessing }
CMIDAIRSymptomsSevere >> toBeHospitalized [

	^ toBeHospitalized ifNil: [ 
		  toBeHospitalized := self random <= self pHosp ]
]
