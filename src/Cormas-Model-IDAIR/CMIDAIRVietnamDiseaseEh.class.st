Class {
	#name : #CMIDAIRVietnamDiseaseEh,
	#superclass : #CMIDAIRVietnamDiseaseE,
	#category : #'Cormas-Model-IDAIR-Disease-Vietnam'
}

{ #category : #transitioning }
CMIDAIRVietnamDiseaseEh >> next [

	^ CMIDAIRVietnamDiseaseAh newFrom: self
]

{ #category : #accessing }
CMIDAIRVietnamDiseaseEh >> requiredDuration [

	^ self tEh
]
