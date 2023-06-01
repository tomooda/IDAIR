Class {
	#name : #CMIDAIRVietnamDiseaseAa,
	#superclass : #CMIDAIRVietnamDiseaseA,
	#category : #'Cormas-Model-IDAIR-Disease-Vietnam'
}

{ #category : #transitioning }
CMIDAIRVietnamDiseaseAa >> next [

	^ CMIDAIRVietnamDiseaseR newFrom: self
]
