Class {
	#name : #CMIDAIRIncubative,
	#superclass : #CMIDAIRPositive,
	#category : #'Cormas-Model-IDAIR'
}

{ #category : #accessing }
CMIDAIRIncubative >> color [

	^ Color blue
]

{ #category : #actions }
CMIDAIRIncubative >> contaminate: aCMIDAIRLocation [

	
]

{ #category : #parameters }
CMIDAIRIncubative >> incubationPeriod [

	^ 3
]

{ #category : #testing }
CMIDAIRIncubative >> isActive [

	^ true
]

{ #category : #testing }
CMIDAIRIncubative >> isTransmissible [

	^ false
]

{ #category : #actions }
CMIDAIRIncubative >> step [

	self duration: self duration + 1.
	self duration >= self recoveryPeriod ifTrue: [ ^ self beNegative ].
	self duration >= self incubationPeriod ifTrue: [ 
		^ self random <= self pSymptomatic
			  ifTrue: [ 
				  self random <= self pHospitalized
					  ifTrue: [ self beHospitalized ]
					  ifFalse: [ self beHomeCared ] ]
			  ifFalse: [ self beAsymptomatic ] ].
	^ self
]

{ #category : #actions }
CMIDAIRIncubative >> test [

	^ self
]
