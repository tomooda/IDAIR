Class {
	#name : #CMIDAIRVietnamDiseaseHc,
	#superclass : #CMIDAIRVietnamDiseaseH,
	#category : #'Cormas-Model-IDAIR-Disease-Vietnam'
}

{ #category : #transitioning }
CMIDAIRVietnamDiseaseHc >> next [

	^ CMIDAIRVietnamDiseaseCc newFrom: self
]

{ #category : #accessing }
CMIDAIRVietnamDiseaseHc >> requiredDuration [

	^ self tHc
]
