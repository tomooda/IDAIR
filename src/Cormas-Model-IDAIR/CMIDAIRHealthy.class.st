Class {
	#name : #CMIDAIRHealthy,
	#superclass : #CMIDAIRDiseaseDynamics,
	#category : #'Cormas-Model-IDAIR'
}

{ #category : #transitioning }
CMIDAIRHealthy >> beSusceptible [

	| p |
	p := self random.
	(p := p - self pAsymptomaticOdm) <= 0.0 ifTrue: [ 
		^ self beAsymptomatic ].
	(p := p - self pPreSymptomaticMildOdm) <= 0.0 ifTrue: [ 
		^ self bePreSymptomaticMild ].
	^ self bePreSymptomaticSevere
]

{ #category : #accessing }
CMIDAIRHealthy >> color [

	^ Color green muchLighter
]

{ #category : #actions }
CMIDAIRHealthy >> contact [

	self random <= self pInfection ifTrue: [ ^ self beSusceptible ].
	^ self
]

{ #category : #actions }
CMIDAIRHealthy >> contaminate: aCMIDAIRLocation [

	
]

{ #category : #testing }
CMIDAIRHealthy >> isActive [

	^ true
]

{ #category : #testing }
CMIDAIRHealthy >> isTransmissible [

	^ false
]

{ #category : #accessing }
CMIDAIRHealthy >> name [

	^ 'healthy'
]

{ #category : #actions }
CMIDAIRHealthy >> step [

	^ self
]

{ #category : #actions }
CMIDAIRHealthy >> test [

	^ self
]