Class {
	#name : #CMIDAIRVietnamDiseaseHd,
	#superclass : #CMIDAIRVietnamDiseaseH,
	#category : #'Cormas-Model-IDAIR-Disease-Vietnam'
}

{ #category : #accessing }
CMIDAIRVietnamDiseaseHd >> next [

	^ CMIDAIRVietnamDiseaseCd newFrom: self
]

{ #category : #accessing }
CMIDAIRVietnamDiseaseHd >> requiredDuration [

	^ self tHd
]
