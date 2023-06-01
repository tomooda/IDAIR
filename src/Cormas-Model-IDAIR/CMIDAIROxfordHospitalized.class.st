Class {
	#name : #CMIDAIROxfordHospitalized,
	#superclass : #CMIDAIROxfordSymptomatic,
	#instVars : [
		'toBeICUed',
		'toBeCritical'
	],
	#category : #'Cormas-Model-IDAIR-Disease-Oxford'
}

{ #category : #accessing }
CMIDAIROxfordHospitalized >> color [

	^ self modelParameterAt: #hospitalizedColor
]

{ #category : #testing }
CMIDAIROxfordHospitalized >> isActive [

	^ false
]

{ #category : #testing }
CMIDAIROxfordHospitalized >> isHospitalized [

	^ true
]

{ #category : #testing }
CMIDAIROxfordHospitalized >> isSevereSymptom [

	^ true
]

{ #category : #testing }
CMIDAIROxfordHospitalized >> isTransmissible [

	^ true
]

{ #category : #accessing }
CMIDAIROxfordHospitalized >> name [

	^ 'hospitalized'
]

{ #category : #actions }
CMIDAIROxfordHospitalized >> step [

	self duration: self duration + 1.
	self toBeCritical
		ifTrue: [ 
			self duration >= self tauCrit ifTrue: [ 
				self toBeICUed
					ifTrue: [ ^ self beICUed ]
					ifFalse: [ ^ self beDead ] ] ]
		ifFalse: [ 
		self duration >= self tauHospRec ifTrue: [ ^ self beSusceptive ] ].
	^ self
]

{ #category : #testing }
CMIDAIROxfordHospitalized >> toBeCritical [

	^ toBeCritical ifNil: [ 
		  toBeCritical := self random < self pCrit ]
]

{ #category : #testing }
CMIDAIROxfordHospitalized >> toBeICUed [

	^ toBeICUed ifNil: [ 
		  toBeICUed := self random < self pICU ]
]
