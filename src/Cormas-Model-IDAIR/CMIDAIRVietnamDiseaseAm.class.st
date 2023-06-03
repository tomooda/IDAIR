Class {
	#name : #CMIDAIRVietnamDiseaseAm,
	#superclass : #CMIDAIRVietnamDiseaseA,
	#category : #'Cormas-Model-IDAIR-Disease-Vietnam'
}

{ #category : #accessing }
CMIDAIRVietnamDiseaseAm >> beta [

	^ self bAm
]

{ #category : #accessing }
CMIDAIRVietnamDiseaseAm >> estimatedTransmissibleDuration [

	^ self tAm + (1.0 - self pq * self tIm + (self pq * self tIq))
]

{ #category : #transitioning }
CMIDAIRVietnamDiseaseAm >> next [

	^ self random <= self pq
		  ifTrue: [ CMIDAIRVietnamDiseaseIq newFrom: self ]
		  ifFalse: [ CMIDAIRVietnamDiseaseIm newFrom: self ]
]

{ #category : #accessing }
CMIDAIRVietnamDiseaseAm >> requiredDuration [

	^ self tAm
]

{ #category : #accessing }
CMIDAIRVietnamDiseaseAm >> tau [

	^ self tAm
]
