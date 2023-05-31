Class {
	#name : #CMIDAIROxfordICUed,
	#superclass : #CMIDAIROxfordSymptomatic,
	#instVars : [
		'toBeDead'
	],
	#category : #'Cormas-Model-IDAIR-Disease-Oxford'
}

{ #category : #accessing }
CMIDAIROxfordICUed >> color [

	^ self modelParameterAt: #icuedColor
]

{ #category : #testing }
CMIDAIROxfordICUed >> isActive [

	^ false
]

{ #category : #testing }
CMIDAIROxfordICUed >> isHospitalized [

	^ true
]

{ #category : #testing }
CMIDAIROxfordICUed >> isICUed [

	^ true
]

{ #category : #testing }
CMIDAIROxfordICUed >> isSevereSymptom [

	^ true
]

{ #category : #testing }
CMIDAIROxfordICUed >> isTransmissible [

	^ true
]

{ #category : #accessing }
CMIDAIROxfordICUed >> name [

	^ 'ICUed'
]

{ #category : #actions }
CMIDAIROxfordICUed >> step [

	self duration: self duration + 1.
	self toBeDead
		ifTrue: [ self duration >= self tauDeath ifTrue: [ ^ self beDead ] ]
		ifFalse: [ 
			self duration >= self tauCritSurv ifTrue: [ 
				^ self beHospitalizedRecovering ] ].
	^ self
]

{ #category : #testing }
CMIDAIROxfordICUed >> toBeDead [

	^ toBeDead ifNil: [ 
		  toBeDead := self random <= self pDeath ]
]
