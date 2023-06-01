Class {
	#name : #CMIDAIRVietnamDiseaseIq,
	#superclass : #CMIDAIRVietnamDiseaseI,
	#category : #'Cormas-Model-IDAIR-Disease-Vietnam'
}

{ #category : #transitioning }
CMIDAIRVietnamDiseaseIq >> next [

	^ CMIDAIRVietnamDiseaseQ newFrom: self
]

{ #category : #accessing }
CMIDAIRVietnamDiseaseIq >> requiredDuration [

	^ self tIq
]
