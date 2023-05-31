Class {
	#name : #CMIDAIROxfordPreSymptomaticMild,
	#superclass : #CMIDAIROxfordPreSymptomatic,
	#category : #'Cormas-Model-IDAIR-Disease-Oxford'
}

{ #category : #accessing }
CMIDAIROxfordPreSymptomaticMild >> color [

	^ self modelParameterAt: #preSymptomaticMildColor
]

{ #category : #accessing }
CMIDAIROxfordPreSymptomaticMild >> name [

	^ 'pre mild symptoms'
]

{ #category : #actions }
CMIDAIROxfordPreSymptomaticMild >> step [

	self duration: self duration + 1.
	self duration >= self tauSym ifTrue: [ ^ self beSymptomsMild ].
	^ self
]
