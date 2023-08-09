Class {
	#name : #CMIDAIRVietnamDiseaseIq,
	#superclass : #CMIDAIRVietnamDiseaseI,
	#category : #'Cormas-Model-IDAIR-Disease-Vietnam'
}

{ #category : #accessing }
CMIDAIRVietnamDiseaseIq >> beta [

	^ self bIq
]

{ #category : #transitioning }
CMIDAIRVietnamDiseaseIq >> next [

	^ CMIDAIRVietnamDiseaseQ newFrom: self
]

{ #category : #accessing }
CMIDAIRVietnamDiseaseIq >> requiredDuration [

	^ self tIq
]

{ #category : #accessing }
CMIDAIRVietnamDiseaseIq >> tau [

	^ self tIq
]
