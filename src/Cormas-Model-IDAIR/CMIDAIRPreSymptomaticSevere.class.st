Class {
	#name : #CMIDAIRPreSymptomaticSevere,
	#superclass : #CMIDAIRPreSymptomatic,
	#category : #'Cormas-Model-IDAIR-Disease-Oxford'
}

{ #category : #accessing }
CMIDAIRPreSymptomaticSevere >> color [

	^ self modelParameterAt: #preSymptomaticSevereColor
]

{ #category : #accessing }
CMIDAIRPreSymptomaticSevere >> name [

	^ 'pre severe symptoms'
]

{ #category : #actions }
CMIDAIRPreSymptomaticSevere >> step [

	self duration: self duration + 1.
	self duration >= self tauSym ifTrue: [ ^ self beSymptomsSevere ].
	^ self
]
