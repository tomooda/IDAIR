Class {
	#name : #CMIDAIROxfordPreSymptomaticSevere,
	#superclass : #CMIDAIROxfordPreSymptomatic,
	#category : #'Cormas-Model-IDAIR-Disease-Oxford'
}

{ #category : #accessing }
CMIDAIROxfordPreSymptomaticSevere >> beta [

	^ self betaPreSymptomaticSevere
]

{ #category : #accessing }
CMIDAIROxfordPreSymptomaticSevere >> color [

	^ self modelParameterAt: #preSymptomaticSevereColor
]

{ #category : #accessing }
CMIDAIROxfordPreSymptomaticSevere >> estimatedTransmissibleDuration [

	^ self tauSym + (1 - self pHosp * self tauRec)
]

{ #category : #accessing }
CMIDAIROxfordPreSymptomaticSevere >> name [

	^ 'pre severe symptoms'
]

{ #category : #actions }
CMIDAIROxfordPreSymptomaticSevere >> step [

	self duration: self duration + self daysPerStep.
	self duration >= self tauSym ifTrue: [ ^ self beSymptomsSevere ].
	^ self
]
