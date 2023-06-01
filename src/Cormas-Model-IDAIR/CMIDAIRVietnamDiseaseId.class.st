Class {
	#name : #CMIDAIRVietnamDiseaseId,
	#superclass : #CMIDAIRVietnamDiseaseI,
	#category : #'Cormas-Model-IDAIR-Disease-Vietnam'
}

{ #category : #transitioning }
CMIDAIRVietnamDiseaseId >> next [

	^ CMIDAIRVietnamDiseaseHd newFrom: self
]

{ #category : #accessing }
CMIDAIRVietnamDiseaseId >> requiredDuration [

	^ self tId
]
