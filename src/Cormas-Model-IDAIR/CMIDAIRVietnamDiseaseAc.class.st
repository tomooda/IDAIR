Class {
	#name : #CMIDAIRVietnamDiseaseAc,
	#superclass : #CMIDAIRVietnamDiseaseA,
	#category : #'Cormas-Model-IDAIR-Disease-Vietnam'
}

{ #category : #accessing }
CMIDAIRVietnamDiseaseAc >> next [

	^ CMIDAIRVietnamDiseaseIc newFrom: self
]

{ #category : #accessing }
CMIDAIRVietnamDiseaseAc >> requiredDuration [

	^ self tAc
]
