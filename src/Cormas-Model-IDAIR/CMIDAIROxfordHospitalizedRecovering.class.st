Class {
	#name : #CMIDAIROxfordHospitalizedRecovering,
	#superclass : #CMIDAIROxfordSymptomatic,
	#category : #'Cormas-Model-IDAIR-Disease-Oxford'
}

{ #category : #accessing }
CMIDAIROxfordHospitalizedRecovering >> color [

	^ self modelParameterAt: #hospitalizedRecoveringColor
]

{ #category : #testing }
CMIDAIROxfordHospitalizedRecovering >> isActive [

	^ false
]

{ #category : #testing }
CMIDAIROxfordHospitalizedRecovering >> isHospitalized [

	^ true
]

{ #category : #testing }
CMIDAIROxfordHospitalizedRecovering >> isHospitalizedRecovering [

	^ true
]

{ #category : #testing }
CMIDAIROxfordHospitalizedRecovering >> isSevereSymptom [

	^ true
]

{ #category : #testing }
CMIDAIROxfordHospitalizedRecovering >> isTransmissible [

	^ true
]

{ #category : #accessing }
CMIDAIROxfordHospitalizedRecovering >> name [

	^ 'Hospitalized(Recovering)'
]

{ #category : #actions }
CMIDAIROxfordHospitalizedRecovering >> step [

	self duration: self duration + 1.
	self duration >= self tauHospRec ifTrue: [ ^ self beRecovered ].
	^ self
]
