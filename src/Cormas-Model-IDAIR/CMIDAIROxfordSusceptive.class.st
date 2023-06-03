Class {
	#name : #CMIDAIROxfordSusceptive,
	#superclass : #CMIDAIROxfordDiseaseDynamics,
	#category : #'Cormas-Model-IDAIR-Disease-Oxford'
}

{ #category : #transitioning }
CMIDAIROxfordSusceptive >> beExposed [

	| p |
	p := self random.
	(p := p - self pAsymptomaticOdm) <= 0.0 ifTrue: [ 
		^ self beAsymptomatic ].
	(p := p - self pPreSymptomaticMildOdm) <= 0.0 ifTrue: [ 
		^ self bePreSymptomaticMild ].
	^ self bePreSymptomaticSevere
]

{ #category : #accessing }
CMIDAIROxfordSusceptive >> beta [

	^ 0.0
]

{ #category : #accessing }
CMIDAIROxfordSusceptive >> color [

	^ self modelParameterAt: #healthyColor
]

{ #category : #accessing }
CMIDAIROxfordSusceptive >> estimatedTransmissibleDuration [

	^ 0.0
]

{ #category : #testing }
CMIDAIROxfordSusceptive >> isActive [

	^ true
]

{ #category : #testing }
CMIDAIROxfordSusceptive >> isSusceptive [

	^ true
]

{ #category : #testing }
CMIDAIROxfordSusceptive >> isTransmissible [

	^ false
]

{ #category : #accessing }
CMIDAIROxfordSusceptive >> name [

	^ 'healthy'
]

{ #category : #actions }
CMIDAIROxfordSusceptive >> step [

	^ self
]

{ #category : #accessing }
CMIDAIROxfordSusceptive >> tau [

	^ Float infinity
]
