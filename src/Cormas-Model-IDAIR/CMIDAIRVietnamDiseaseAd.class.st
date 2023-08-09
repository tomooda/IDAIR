Class {
	#name : #CMIDAIRVietnamDiseaseAd,
	#superclass : #CMIDAIRVietnamDiseaseA,
	#category : #'Cormas-Model-IDAIR-Disease-Vietnam'
}

{ #category : #accessing }
CMIDAIRVietnamDiseaseAd >> beta [

	^ self bAd
]

{ #category : #transitioning }
CMIDAIRVietnamDiseaseAd >> next [

	^ CMIDAIRVietnamDiseaseId newFrom: self
]

{ #category : #accessing }
CMIDAIRVietnamDiseaseAd >> requiredDuration [

	^ self tAd
]

{ #category : #accessing }
CMIDAIRVietnamDiseaseAd >> tau [

	^ self tAd
]
