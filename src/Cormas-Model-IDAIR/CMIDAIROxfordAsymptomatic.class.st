Class {
	#name : #CMIDAIROxfordAsymptomatic,
	#superclass : #CMIDAIROxfordInfected,
	#category : #'Cormas-Model-IDAIR-Disease-Oxford'
}

{ #category : #accessing }
CMIDAIROxfordAsymptomatic >> color [

	^ self modelParameterAt: #asymptomaticColor
]

{ #category : #actions }
CMIDAIROxfordAsymptomatic >> contaminate: aCMIDAIRLocation [

	aCMIDAIRLocation isContaminated: true
]

{ #category : #testing }
CMIDAIROxfordAsymptomatic >> isActive [

	^ true
]

{ #category : #testing }
CMIDAIROxfordAsymptomatic >> isAsymptomatic [

	^ true
]

{ #category : #testing }
CMIDAIROxfordAsymptomatic >> isTransmissible [

	^ true
]

{ #category : #accessing }
CMIDAIROxfordAsymptomatic >> name [

	^ 'asymptomatic'
]

{ #category : #actions }
CMIDAIROxfordAsymptomatic >> step [

	self duration: self duration + 1.
	self duration >= self tauARec ifTrue: [ ^ self beHealthy ].
	^ self
]

{ #category : #actions }
CMIDAIROxfordAsymptomatic >> test [

	^ self
]
