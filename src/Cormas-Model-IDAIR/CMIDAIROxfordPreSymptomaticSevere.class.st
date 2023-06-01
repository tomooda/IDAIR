Class {
	#name : #CMIDAIROxfordPreSymptomaticSevere,
	#superclass : #CMIDAIROxfordPreSymptomatic,
	#category : #'Cormas-Model-IDAIR-Disease-Oxford'
}

{ #category : #accessing }
CMIDAIROxfordPreSymptomaticSevere >> color [

	^ self modelParameterAt: #preSymptomaticSevereColor
]

{ #category : #accessing }
CMIDAIROxfordPreSymptomaticSevere >> name [

	^ 'pre severe symptoms'
]

{ #category : #actions }
CMIDAIROxfordPreSymptomaticSevere >> step [

	self duration: self duration + 1.
	self duration >= self tauSym ifTrue: [ ^ self beSymptomsSevere ].
	^ self
]