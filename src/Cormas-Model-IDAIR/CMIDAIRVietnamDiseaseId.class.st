Class {
	#name : #CMIDAIRVietnamDiseaseId,
	#superclass : #CMIDAIRVietnamDiseaseI,
	#category : #'Cormas-Model-IDAIR-Disease-Vietnam'
}

{ #category : #accessing }
CMIDAIRVietnamDiseaseId >> estimatedTransmissibleDuration [

	^ self tAd + self tId
]

{ #category : #transitioning }
CMIDAIRVietnamDiseaseId >> next [

	^ CMIDAIRVietnamDiseaseHd newFrom: self
]

{ #category : #accessing }
CMIDAIRVietnamDiseaseId >> requiredDuration [

	^ self tId
]
