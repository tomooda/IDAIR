Class {
	#name : #CMIDAIRHospitalizedRecovering,
	#superclass : #CMIDAIRSymptomatic,
	#category : #'Cormas-Model-IDAIR-Disease'
}

{ #category : #accessing }
CMIDAIRHospitalizedRecovering >> color [

	^ self modelParameterAt: #hospitalizedRecoveringColor
]

{ #category : #actions }
CMIDAIRHospitalizedRecovering >> contaminate: aCMIDAIRLocation [

	
]

{ #category : #testing }
CMIDAIRHospitalizedRecovering >> isActive [

	^ false
]

{ #category : #testing }
CMIDAIRHospitalizedRecovering >> isHospitalizedRecovering [

	^ true
]

{ #category : #testing }
CMIDAIRHospitalizedRecovering >> isSevereSymptom [

	^ true
]

{ #category : #testing }
CMIDAIRHospitalizedRecovering >> isTransmissible [

	^ true
]

{ #category : #accessing }
CMIDAIRHospitalizedRecovering >> name [

	^ 'Hospitalized(Recovering)'
]

{ #category : #actions }
CMIDAIRHospitalizedRecovering >> step [

	self duration: self duration + 1.
	self duration >= self tauHospRec ifTrue: [ ^ self beHealthy ].
	^ self
]
