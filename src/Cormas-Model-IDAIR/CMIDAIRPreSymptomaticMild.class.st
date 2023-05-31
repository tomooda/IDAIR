Class {
	#name : #CMIDAIRPreSymptomaticMild,
	#superclass : #CMIDAIRPreSymptomatic,
	#category : #'Cormas-Model-IDAIR-Disease-Oxford'
}

{ #category : #accessing }
CMIDAIRPreSymptomaticMild >> color [

	^ self modelParameterAt: #preSymptomaticMildColor
]

{ #category : #accessing }
CMIDAIRPreSymptomaticMild >> name [

	^ 'pre mild symptoms'
]

{ #category : #actions }
CMIDAIRPreSymptomaticMild >> step [

	self duration: self duration + 1.
	self duration >= self tauSym ifTrue: [ ^ self beSymptomsMild ].
	^ self
]
