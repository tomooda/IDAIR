Class {
	#name : #CMIDAIRVietnamDiseaseEc,
	#superclass : #CMIDAIRVietnamDiseaseE,
	#category : #'Cormas-Model-IDAIR-Disease-Vietnam'
}

{ #category : #transitioning }
CMIDAIRVietnamDiseaseEc >> next [

	^ CMIDAIRVietnamDiseaseAc newFrom: self
]

{ #category : #accessing }
CMIDAIRVietnamDiseaseEc >> requiredDuration [

	^ self tEc
]
