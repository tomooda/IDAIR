Class {
	#name : #CMIDAIRVietnamDiseaseDynamics,
	#superclass : #CMIDAIRDiseaseDynamics,
	#instVars : [
		'duration'
	],
	#category : #'Cormas-Model-IDAIR-Disease-Vietnam'
}

{ #category : #testing }
CMIDAIRVietnamDiseaseDynamics class >> isAbstract [

	^ self = CMIDAIRVietnamDiseaseDynamics
]

{ #category : #'instance creation' }
CMIDAIRVietnamDiseaseDynamics class >> newFrom: anObject [

	^ (super newFrom: anObject)
		  duration: 0.0;
		  yourself
]

{ #category : #parameters }
CMIDAIRVietnamDiseaseDynamics >> bAa [

	^ self modelParameter
]

{ #category : #parameters }
CMIDAIRVietnamDiseaseDynamics >> bAc [

	^ self modelParameter
]

{ #category : #parameters }
CMIDAIRVietnamDiseaseDynamics >> bAd [

	^ self modelParameter
]

{ #category : #parameters }
CMIDAIRVietnamDiseaseDynamics >> bAh [

	^ self modelParameter
]

{ #category : #parameters }
CMIDAIRVietnamDiseaseDynamics >> bAm [

	^ self modelParameter
]

{ #category : #parameters }
CMIDAIRVietnamDiseaseDynamics >> bIc [

	^ self modelParameter
]

{ #category : #parameters }
CMIDAIRVietnamDiseaseDynamics >> bId [

	^ self modelParameter
]

{ #category : #parameters }
CMIDAIRVietnamDiseaseDynamics >> bIh [

	^ self modelParameter
]

{ #category : #parameters }
CMIDAIRVietnamDiseaseDynamics >> bIm [

	^ self modelParameter
]

{ #category : #parameters }
CMIDAIRVietnamDiseaseDynamics >> bIq [

	^ self modelParameter
]

{ #category : #transitioning }
CMIDAIRVietnamDiseaseDynamics >> beAsymptomatic [

	^ CMIDAIRVietnamDiseaseEa newFrom: self
]

{ #category : #transitioning }
CMIDAIRVietnamDiseaseDynamics >> beExposed [

	self random <= self pa ifTrue: [ 
		^ CMIDAIRVietnamDiseaseEa newFrom: self ].
	self random <= self ph ifFalse: [ 
		^ CMIDAIRVietnamDiseaseEm newFrom: self ].
	self random <= self pc ifFalse: [ 
		^ CMIDAIRVietnamDiseaseEh newFrom: self ].
	self random <= self pd ifFalse: [ 
		^ CMIDAIRVietnamDiseaseEc newFrom: self ].
	^ CMIDAIRVietnamDiseaseEd newFrom: self
]

{ #category : #accessing }
CMIDAIRVietnamDiseaseDynamics >> duration [

	^ duration ifNil: [ duration := 0.0 ]
]

{ #category : #accessing }
CMIDAIRVietnamDiseaseDynamics >> duration: aNumber [

	duration := aNumber
]

{ #category : #testing }
CMIDAIRVietnamDiseaseDynamics >> isAsymptomatic [

	^ false
]

{ #category : #testing }
CMIDAIRVietnamDiseaseDynamics >> isDead [

	^ false
]

{ #category : #testing }
CMIDAIRVietnamDiseaseDynamics >> isHospitalized [

	^ false
]

{ #category : #testing }
CMIDAIRVietnamDiseaseDynamics >> isICUed [

	^ false
]

{ #category : #testing }
CMIDAIRVietnamDiseaseDynamics >> isInCommunity [

	^ false
]

{ #category : #testing }
CMIDAIRVietnamDiseaseDynamics >> isInfected [

	^ false
]

{ #category : #testing }
CMIDAIRVietnamDiseaseDynamics >> isRecovered [

	^ false
]

{ #category : #testing }
CMIDAIRVietnamDiseaseDynamics >> isSusceptive [

	^ false
]

{ #category : #testing }
CMIDAIRVietnamDiseaseDynamics >> isSymptomatic [

	^ false
]

{ #category : #testing }
CMIDAIRVietnamDiseaseDynamics >> isTransmissible [

	^ false
]

{ #category : #accessing }
CMIDAIRVietnamDiseaseDynamics >> name [

	^ self class name
		  copyFrom: 'CMIDAIRVientamDisease' size + 1
		  to: self class name size
]

{ #category : #transitioning }
CMIDAIRVietnamDiseaseDynamics >> next [

	^ self subclassResponsibility
]

{ #category : #parameters }
CMIDAIRVietnamDiseaseDynamics >> pa [

	^ self modelParameter
]

{ #category : #parameters }
CMIDAIRVietnamDiseaseDynamics >> pc [

	^ self modelParameter
]

{ #category : #parameters }
CMIDAIRVietnamDiseaseDynamics >> pd [

	^ self modelParameter
]

{ #category : #parameters }
CMIDAIRVietnamDiseaseDynamics >> ph [

	^ self modelParameter
]

{ #category : #parameters }
CMIDAIRVietnamDiseaseDynamics >> pq [

	^ self modelParameter
]

{ #category : #accessing }
CMIDAIRVietnamDiseaseDynamics >> requiredDuration [

	^ self subclassResponsibility
]

{ #category : #actions }
CMIDAIRVietnamDiseaseDynamics >> step [

	self duration: self duration + 1.
	self duration > self requiredDuration ifTrue: [ ^ self next ]
]

{ #category : #parameters }
CMIDAIRVietnamDiseaseDynamics >> tAa [

	^ self modelParameter
]

{ #category : #parameters }
CMIDAIRVietnamDiseaseDynamics >> tAc [

	^ self modelParameter
]

{ #category : #parameters }
CMIDAIRVietnamDiseaseDynamics >> tAd [

	^ self modelParameter
]

{ #category : #parameters }
CMIDAIRVietnamDiseaseDynamics >> tAh [

	^ self modelParameter
]

{ #category : #parameters }
CMIDAIRVietnamDiseaseDynamics >> tAm [

	^ self modelParameter
]

{ #category : #parameters }
CMIDAIRVietnamDiseaseDynamics >> tCc [

	^ self modelParameter
]

{ #category : #parameters }
CMIDAIRVietnamDiseaseDynamics >> tCd [

	^ self modelParameter
]

{ #category : #parameters }
CMIDAIRVietnamDiseaseDynamics >> tEa [

	^ self modelParameter
]

{ #category : #parameters }
CMIDAIRVietnamDiseaseDynamics >> tEc [

	^ self modelParameter
]

{ #category : #parameters }
CMIDAIRVietnamDiseaseDynamics >> tEd [

	^ self modelParameter
]

{ #category : #parameters }
CMIDAIRVietnamDiseaseDynamics >> tEh [

	^ self modelParameter
]

{ #category : #parameters }
CMIDAIRVietnamDiseaseDynamics >> tEm [

	^ self modelParameter
]

{ #category : #parameters }
CMIDAIRVietnamDiseaseDynamics >> tHc [

	^ self modelParameter
]

{ #category : #parameters }
CMIDAIRVietnamDiseaseDynamics >> tHd [

	^ self modelParameter
]

{ #category : #parameters }
CMIDAIRVietnamDiseaseDynamics >> tHh [

	^ self modelParameter
]

{ #category : #parameters }
CMIDAIRVietnamDiseaseDynamics >> tIc [

	^ self modelParameter
]

{ #category : #parameters }
CMIDAIRVietnamDiseaseDynamics >> tId [

	^ self modelParameter
]

{ #category : #parameters }
CMIDAIRVietnamDiseaseDynamics >> tIh [

	^ self modelParameter
]

{ #category : #parameters }
CMIDAIRVietnamDiseaseDynamics >> tIm [

	^ self modelParameter
]

{ #category : #parameters }
CMIDAIRVietnamDiseaseDynamics >> tIq [

	^ self modelParameter
]

{ #category : #parameters }
CMIDAIRVietnamDiseaseDynamics >> tQ [

	^ self modelParameter
]

{ #category : #parameters }
CMIDAIRVietnamDiseaseDynamics >> tR [

	^ self modelParameter
]
