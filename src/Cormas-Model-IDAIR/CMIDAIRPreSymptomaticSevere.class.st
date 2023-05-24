Class {
	#name : #CMIDAIRPreSymptomaticSevere,
	#superclass : #CMIDAIRPreSymptomatic,
	#category : #'Cormas-Model-IDAIR-Disease'
}

{ #category : #accessing }
CMIDAIRPreSymptomaticSevere >> color [

	^ Color red muchLighter
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
