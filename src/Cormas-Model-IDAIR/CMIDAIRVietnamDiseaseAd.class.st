Class {
	#name : #CMIDAIRVietnamDiseaseAd,
	#superclass : #CMIDAIRVietnamDiseaseA,
	#category : #'Cormas-Model-IDAIR-Disease-Vietnam'
}

{ #category : #accessing }
CMIDAIRVietnamDiseaseAd >> next [

	^ CMIDAIRVietnamDiseaseId newFrom: self
]

{ #category : #accessing }
CMIDAIRVietnamDiseaseAd >> requiredDuration [

	^ self tAd
]