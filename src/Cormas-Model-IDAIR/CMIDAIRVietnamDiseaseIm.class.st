Class {
	#name : #CMIDAIRVietnamDiseaseIm,
	#superclass : #CMIDAIRVietnamDiseaseI,
	#category : #'Cormas-Model-IDAIR-Disease-Vietnam'
}

{ #category : #accessing }
CMIDAIRVietnamDiseaseIm >> next [

	^ CMIDAIRVietnamDiseaseR newFrom: self
]
