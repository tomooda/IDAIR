Class {
	#name : #CMIDAIROxfordSymptomsMild,
	#superclass : #CMIDAIROxfordSymptomatic,
	#category : #'Cormas-Model-IDAIR-Disease-Oxford'
}

{ #category : #accessing }
CMIDAIROxfordSymptomsMild >> beta [

	^ self betaSymptomaticMild
]

{ #category : #accessing }
CMIDAIROxfordSymptomsMild >> color [

	^ self modelParameterAt: #symptomsMildColor
]

{ #category : #accessing }
CMIDAIROxfordSymptomsMild >> estimatedTransmissibleDuration [

	^ self tauSym + self tauRec
]

{ #category : #testing }
CMIDAIROxfordSymptomsMild >> isActive [

	^ false
]

{ #category : #testing }
CMIDAIROxfordSymptomsMild >> isInCommunity [

	^ true
]

{ #category : #testing }
CMIDAIROxfordSymptomsMild >> isMildSymptom [

	^ true
]

{ #category : #testing }
CMIDAIROxfordSymptomsMild >> isTransmissible [

	^ true
]

{ #category : #accessing }
CMIDAIROxfordSymptomsMild >> name [

	^ 'mild symptom'
]

{ #category : #parameters }
CMIDAIROxfordSymptomsMild >> pContaminate [

	^ 0.9
]

{ #category : #actions }
CMIDAIROxfordSymptomsMild >> step [

	self duration: self duration + 1.
	self duration >= self tauRec ifTrue: [ ^ self beRecovered ].
	^ self
]

{ #category : #accessing }
CMIDAIROxfordSymptomsMild >> tau [

	^ self tauRec
]
