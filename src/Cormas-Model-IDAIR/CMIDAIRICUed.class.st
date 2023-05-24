Class {
	#name : #CMIDAIRICUed,
	#superclass : #CMIDAIRSymptomatic,
	#instVars : [
		'toBeDead'
	],
	#category : #'Cormas-Model-IDAIR-Disease'
}

{ #category : #accessing }
CMIDAIRICUed >> color [

	^ Color black
]

{ #category : #actions }
CMIDAIRICUed >> contaminate: aCMIDAIRLocation [

	
]

{ #category : #testing }
CMIDAIRICUed >> isActive [

	^ false
]

{ #category : #testing }
CMIDAIRICUed >> isIsolated [

	^ true
]

{ #category : #testing }
CMIDAIRICUed >> isTransmissible [

	^ true
]

{ #category : #accessing }
CMIDAIRICUed >> name [

	^ 'ICUed'
]

{ #category : #actions }
CMIDAIRICUed >> step [

	self duration: self duration + 1.
	self toBeDead
		ifTrue: [ self duration >= self tauDeath ifTrue: [ ^ self beDead ] ]
		ifFalse: [ 
			self duration >= self tauCritSurv ifTrue: [ 
				^ self beHospitalizedRecovering ] ].
	^ self
]

{ #category : #testing }
CMIDAIRICUed >> toBeDead [

	^ toBeDead ifNil: [ 
		  toBeDead := self random <= self pDeath ]
]
