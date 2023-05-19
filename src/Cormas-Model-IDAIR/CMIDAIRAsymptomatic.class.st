Class {
	#name : #CMIDAIRAsymptomatic,
	#superclass : #CMIDAIRPositive,
	#category : #'Cormas-Model-IDAIR'
}

{ #category : #accessing }
CMIDAIRAsymptomatic >> color [

	^ Color yellow
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
	self duration >= self recoveryPeriod ifTrue: [ ^ self beNegative ].
	^ self
]

{ #category : #actions }
CMIDAIRAsymptomatic >> test [

	self random >= self pFalseNegative ifTrue: [ 
		^ self random <= self pHospitalized
			  ifTrue: [ self beHospitalized ]
			  ifFalse: [ self beHomeCared ] ].
	^ self
]
