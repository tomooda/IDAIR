Class {
	#name : #CMIDAIROxfordHealthy,
	#superclass : #CMIDAIROxfordDiseaseDynamics,
	#category : #'Cormas-Model-IDAIR-Disease-Oxford'
}

{ #category : #transitioning }
CMIDAIROxfordHealthy >> beInfected [

	| p |
	p := self random.
	(p := p - self pAsymptomaticOdm) <= 0.0 ifTrue: [ 
		^ self beAsymptomatic ].
	(p := p - self pPreSymptomaticMildOdm) <= 0.0 ifTrue: [ 
		^ self bePreSymptomaticMild ].
	^ self bePreSymptomaticSevere
]

{ #category : #accessing }
CMIDAIROxfordHealthy >> color [

	^ self modelParameterAt: #healthyColor
]

{ #category : #actions }
CMIDAIROxfordHealthy >> contact [

	self random <= self pInfection ifTrue: [ ^ self beInfected ].
	^ self
]

{ #category : #actions }
CMIDAIROxfordHealthy >> contaminate: aCMIDAIRLocation [

	
]

{ #category : #testing }
CMIDAIROxfordHealthy >> isActive [

	^ true
]

{ #category : #testing }
CMIDAIROxfordHealthy >> isHealthy [

	^ true
]

{ #category : #testing }
CMIDAIROxfordHealthy >> isTransmissible [

	^ false
]

{ #category : #accessing }
CMIDAIROxfordHealthy >> name [

	^ 'healthy'
]

{ #category : #actions }
CMIDAIROxfordHealthy >> step [

	^ self
]

{ #category : #actions }
CMIDAIROxfordHealthy >> test [

	^ self
]
