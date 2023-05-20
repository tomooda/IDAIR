Class {
	#name : #CMIDAIRHospitalized,
	#superclass : #CMIDAIRSymptomatic,
	#instVars : [
		'toBeICUed',
		'toBeCritical'
	],
	#category : #'Cormas-Model-IDAIR'
}

{ #category : #accessing }
CMIDAIRHospitalized >> color [

	^ Color gray
]

{ #category : #actions }
CMIDAIRHospitalized >> contaminate: aCMIDAIRLocation [

	
]

{ #category : #testing }
CMIDAIRHospitalized >> isActive [

	^ false
]

{ #category : #testing }
CMIDAIRHospitalized >> isIsolated [

	^ true
]

{ #category : #testing }
CMIDAIRHospitalized >> isTransmissible [

	^ true
]

{ #category : #accessing }
CMIDAIRHospitalized >> name [

	^ 'hospitalized'
]

{ #category : #actions }
CMIDAIRHospitalized >> step [

	self duration: self duration + 1.
	self toBeCritical
		ifTrue: [ 
			self duration >= self tauCrit ifTrue: [ 
				self toBeICUed
					ifTrue: [ ^ self beICUed ]
					ifFalse: [ ^ self beDead ] ] ]
		ifFalse: [ 
		self duration >= self tauHospRec ifTrue: [ ^ self beHealthy ] ].
	^ self
]

{ #category : #testing }
CMIDAIRHospitalized >> toBeCritical [

	^ toBeCritical ifNil: [ 
		  toBeCritical := self random < self pCrit ]
]

{ #category : #testing }
CMIDAIRHospitalized >> toBeICUed [

	^ toBeICUed ifNil: [ 
		  toBeICUed := self random < self pICU ]
]
