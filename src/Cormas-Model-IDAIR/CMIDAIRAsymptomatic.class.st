Class {
	#name : #CMIDAIRAsymptomatic,
	#superclass : #CMIDAIRSusceptible,
	#category : #'Cormas-Model-IDAIR'
}

{ #category : #accessing }
CMIDAIRAsymptomatic >> color [

	^ Color blue
]

{ #category : #actions }
CMIDAIRAsymptomatic >> contaminate: aCMIDAIRLocation [

	aCMIDAIRLocation isContaminated: true
]

{ #category : #testing }
CMIDAIRAsymptomatic >> isActive [

	^ true
]

{ #category : #testing }
CMIDAIRAsymptomatic >> isTransmissible [

	^ true
]

{ #category : #actions }
CMIDAIRAsymptomatic >> step [
	self duration: self duration + 1.
	self duration >= self recoveryPeriod ifTrue: [ ^ self beHealthy ].
	^ self
]

{ #category : #actions }
CMIDAIRAsymptomatic >> test [

	^ self
]
