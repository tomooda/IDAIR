Class {
	#name : #CMIDAIRVietnamDiseaseId,
	#superclass : #CMIDAIRVietnamDiseaseI,
	#category : #'Cormas-Model-IDAIR-Disease-Vietnam'
}

{ #category : #accessing }
CMIDAIRVietnamDiseaseId >> next [

	^ CMIDAIRVietnamDiseaseHd newFrom: self
]
