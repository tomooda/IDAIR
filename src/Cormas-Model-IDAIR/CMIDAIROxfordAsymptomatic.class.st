Class {
	#name : #CMIDAIROxfordAsymptomatic,
	#superclass : #CMIDAIROxfordInfected,
	#category : #'Cormas-Model-IDAIR-Disease-Oxford'
}

{ #category : #accessing }
CMIDAIROxfordAsymptomatic >> beta [

	^ self betaAsymptomatic
]

{ #category : #accessing }
CMIDAIROxfordAsymptomatic >> color [

	^ self modelParameterAt: #asymptomaticColor
]

{ #category : #accessing }
CMIDAIROxfordAsymptomatic >> inCommunity [

	^ self
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
CMIDAIROxfordAsymptomatic >> isInCommunity [

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

	self duration: self duration + self daysPerStep.
	self duration >= self tauARec ifTrue: [ ^ self beRecovered ].
	^ self
]

{ #category : #accessing }
CMIDAIROxfordAsymptomatic >> tau [

	^ self tauARec
]
