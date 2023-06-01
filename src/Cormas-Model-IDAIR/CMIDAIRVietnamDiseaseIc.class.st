Class {
	#name : #CMIDAIRVietnamDiseaseIc,
	#superclass : #CMIDAIRVietnamDiseaseI,
	#category : #'Cormas-Model-IDAIR-Disease-Vietnam'
}

{ #category : #transitioning }
CMIDAIRVietnamDiseaseIc >> next [

	^ CMIDAIRVietnamDiseaseHc newFrom: self
]

{ #category : #accessing }
CMIDAIRVietnamDiseaseIc >> requiredDuration [

	^ self tIc
]
