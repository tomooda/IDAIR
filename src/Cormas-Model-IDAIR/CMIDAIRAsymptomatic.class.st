Class {
	#name : #CMIDAIRAsymptomatic,
	#superclass : #CMIDAIRInfected,
	#category : #'Cormas-Model-IDAIR-Disease-Oxford'
}

{ #category : #accessing }
CMIDAIRAsymptomatic >> color [

	^ self modelParameterAt: #asymptomaticColor
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
CMIDAIRAsymptomatic >> isAsymptomatic [

	^ true
]

{ #category : #testing }
CMIDAIRAsymptomatic >> isTransmissible [

	^ true
]

{ #category : #accessing }
CMIDAIRAsymptomatic >> name [

	^ 'asymptomatic'
]

{ #category : #actions }
CMIDAIRAsymptomatic >> step [

	self duration: self duration + 1.
	self duration >= self tauARec ifTrue: [ ^ self beHealthy ].
	^ self
]

{ #category : #actions }
CMIDAIRAsymptomatic >> test [

	^ self
]
