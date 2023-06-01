Class {
	#name : #CMIDAIRVietnamDiseaseAm,
	#superclass : #CMIDAIRVietnamDiseaseA,
	#category : #'Cormas-Model-IDAIR-Disease-Vietnam'
}

{ #category : #accessing }
CMIDAIRVietnamDiseaseAm >> next [

	^ self random <= self pq
		  ifTrue: [ CMIDAIRVietnamDiseaseIq newFrom: self ]
		  ifFalse: [ CMIDAIRVietnamDiseaseIm newFrom: self ]
]
