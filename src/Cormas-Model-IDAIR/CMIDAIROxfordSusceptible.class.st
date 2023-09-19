Class {
	#name : #CMIDAIROxfordSusceptible,
	#superclass : #CMIDAIROxfordDiseaseDynamics,
	#category : #'Cormas-Model-IDAIR-Disease-Oxford'
}

{ #category : #transitioning }
CMIDAIROxfordSusceptible >> beExposed [

	| p |
	p := self random.
	(p := p - self pAsymptomaticOdm) <= 0.0 ifTrue: [ 
		^ self beAsymptomatic ].
	(p := p - self pPreSymptomaticMildOdm) <= 0.0 ifTrue: [ 
		^ self bePreSymptomaticMild ].
	^ self bePreSymptomaticSevere
]

{ #category : #accessing }
CMIDAIROxfordSusceptible >> beta [

	^ 0.0
]

{ #category : #accessing }
CMIDAIROxfordSusceptible >> color [

	^ self modelParameterAt: #healthyColor
]

{ #category : #accessing }
CMIDAIROxfordSusceptible >> inCommunity [

	^ self
]

{ #category : #testing }
CMIDAIROxfordSusceptible >> isActive [

	^ true
]

{ #category : #testing }
CMIDAIROxfordSusceptible >> isInCommunity [

	^ true
]

{ #category : #testing }
CMIDAIROxfordSusceptible >> isSusceptible [

	^ true
]

{ #category : #testing }
CMIDAIROxfordSusceptible >> isTransmissible [

	^ false
]

{ #category : #accessing }
CMIDAIROxfordSusceptible >> name [

	^ 'healthy'
]

{ #category : #actions }
CMIDAIROxfordSusceptible >> step [

	^ self
]

{ #category : #accessing }
CMIDAIROxfordSusceptible >> tau [

	^ Float infinity
]
