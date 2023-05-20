Class {
	#name : #CMIDAIRPreMildSymptomatic,
	#superclass : #CMIDAIRPreSymptomatic,
	#category : #'Cormas-Model-IDAIR'
}

{ #category : #accessing }
CMIDAIRPreMildSymptomatic >> color [

	^ Color yellow
]

{ #category : #actions }
CMIDAIRPreMildSymptomatic >> step [

	self duration: self duration + 1.
	self duration >= self recoveryPeriod ifTrue: [ ^ self beHealthy ].
	self duration >= self preSymptomaticPeriod ifTrue: [ 
		^ self beMildSymptoms ].
	^ self
]
