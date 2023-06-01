Class {
	#name : #CMIDAIRVietnamDiseaseIq,
	#superclass : #CMIDAIRVietnamDiseaseI,
	#category : #'Cormas-Model-IDAIR-Disease-Vietnam'
}

{ #category : #accessing }
CMIDAIRVietnamDiseaseIq >> next [

	^ CMIDAIRVietnamDiseaseQ newFrom: self
]
