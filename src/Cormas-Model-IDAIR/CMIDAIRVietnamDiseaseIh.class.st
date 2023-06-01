Class {
	#name : #CMIDAIRVietnamDiseaseIh,
	#superclass : #CMIDAIRVietnamDiseaseI,
	#category : #'Cormas-Model-IDAIR-Disease-Vietnam'
}

{ #category : #accessing }
CMIDAIRVietnamDiseaseIh >> next [

	^ CMIDAIRVietnamDiseaseHh newFrom: self
]
