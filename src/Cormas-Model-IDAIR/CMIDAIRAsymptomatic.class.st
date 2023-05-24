Class {
	#name : #CMIDAIRAsymptomatic,
	#superclass : #CMIDAIRSusceptible,
	#category : #'Cormas-Model-IDAIR-Disease'
}

{ #category : #accessing }
CMIDAIRAsymptomatic >> color [

	^ Color blue muchLighter
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
