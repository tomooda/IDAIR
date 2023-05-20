Class {
	#name : #CMIDAIRPreSevereSymptomatic,
	#superclass : #CMIDAIRPreSymptomatic,
	#category : #'Cormas-Model-IDAIR'
}

{ #category : #accessing }
CMIDAIRPreSevereSymptomatic >> color [

	^ Color red
]

{ #category : #stepping }
CMIDAIRPreSevereSymptomatic >> step [

	self duration: self duration + 1.
	self duration >= self recoveryPeriod ifTrue: [ ^ self beHealthy ].
	self duration >= self preSymptomaticPeriod ifTrue: [ 
		^ self beSevereSymptoms ].
	^ self
]
