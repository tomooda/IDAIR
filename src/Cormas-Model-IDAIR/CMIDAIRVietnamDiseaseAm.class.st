Class {
	#name : #CMIDAIRVietnamDiseaseAm,
	#superclass : #CMIDAIRVietnamDiseaseA,
	#category : #'Cormas-Model-IDAIR-Disease-Vietnam'
}

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
