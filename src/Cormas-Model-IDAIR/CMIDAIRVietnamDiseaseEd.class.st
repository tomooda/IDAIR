Class {
	#name : #CMIDAIRVietnamDiseaseEd,
	#superclass : #CMIDAIRVietnamDiseaseE,
	#category : #'Cormas-Model-IDAIR-Disease-Vietnam'
}

{ #category : #transitioning }
CMIDAIRVietnamDiseaseEd >> next [

	^ CMIDAIRVietnamDiseaseAd newFrom: self
]

{ #category : #accessing }
CMIDAIRVietnamDiseaseEd >> requiredDuration [

	^ self tEd
]