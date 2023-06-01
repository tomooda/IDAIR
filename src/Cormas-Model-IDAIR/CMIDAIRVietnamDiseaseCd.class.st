Class {
	#name : #CMIDAIRVietnamDiseaseCd,
	#superclass : #CMIDAIRVietnamDiseaseC,
	#category : #'Cormas-Model-IDAIR-Disease-Vietnam'
}

{ #category : #accessing }
CMIDAIRVietnamDiseaseCd >> next [

	^ CMIDAIRVietnamDiseaseD newFrom: self
]
