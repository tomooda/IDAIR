Class {
	#name : #CMIDAIROxfordSymptomsSevere,
	#superclass : #CMIDAIROxfordSymptomatic,
	#instVars : [
		'toBeHospitalized'
	],
	#category : #'Cormas-Model-IDAIR-Disease-Oxford'
}

{ #category : #accessing }
CMIDAIROxfordSymptomsSevere >> color [

	^ self modelParameterAt: #symptomsSevereColor
]

{ #category : #accessing }
CMIDAIROxfordSymptomsSevere >> estimatedTransmissibleDuration [

	^ self tauSym + (1 - self pHosp * self tauRec)
]

{ #category : #testing }
CMIDAIROxfordSymptomsSevere >> isActive [

	^ false
]

{ #category : #testing }
CMIDAIROxfordSymptomsSevere >> isSevereSymptom [

	^ true
]

{ #category : #testing }
CMIDAIROxfordSymptomsSevere >> isTransmissible [

	^ true
]

{ #category : #accessing }
CMIDAIROxfordSymptomsSevere >> name [

	^ 'severe symptom'
]

{ #category : #parameters }
CMIDAIROxfordSymptomsSevere >> pContaminate [

	^ 0.9
]

{ #category : #actions }
CMIDAIROxfordSymptomsSevere >> step [

	self duration: self duration + 1.
	self toBeHospitalized
		ifTrue: [ 
		self duration >= self tauHosp ifTrue: [ ^ self beHospitalized ] ]
		ifFalse: [ 
		self duration >= self tauRec ifTrue: [ ^ self beRecovered ] ].
	^ self
]

{ #category : #actions }
CMIDAIROxfordSymptomsSevere >> test [

	^ self
]

{ #category : #accessing }
CMIDAIROxfordSymptomsSevere >> toBeHospitalized [

	^ toBeHospitalized ifNil: [ 
		  toBeHospitalized := self random <= self pHosp ]
]
