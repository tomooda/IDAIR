Class {
	#name : #CMIDAIRVietnamDiseaseEm,
	#superclass : #CMIDAIRVietnamDiseaseE,
	#category : #'Cormas-Model-IDAIR-Disease-Vietnam'
}

{ #category : #transitioning }
CMIDAIRVietnamDiseaseEm >> next [

	^ CMIDAIRVietnamDiseaseAm newFrom: self
]
