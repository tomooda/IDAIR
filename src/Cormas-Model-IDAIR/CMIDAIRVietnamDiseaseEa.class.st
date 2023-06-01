Class {
	#name : #CMIDAIRVietnamDiseaseEa,
	#superclass : #CMIDAIRVietnamDiseaseE,
	#category : #'Cormas-Model-IDAIR-Disease-Vietnam'
}

{ #category : #transitioning }
CMIDAIRVietnamDiseaseEa >> next [

	^ CMIDAIRVietnamDiseaseAa newFrom: self
]
