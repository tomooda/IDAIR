Class {
	#name : #CMIDAIRVietnamDiseaseIq,
	#superclass : #CMIDAIRVietnamDiseaseI,
	#category : #'Cormas-Model-IDAIR-Disease-Vietnam'
}

{ #category : #accessing }
CMIDAIRVietnamDiseaseIq >> estimatedTransmissibleDuration [

	^ self tAm + self tIq
]

{ #category : #transitioning }
CMIDAIRVietnamDiseaseIq >> next [

	^ CMIDAIRVietnamDiseaseQ newFrom: self
]

{ #category : #accessing }
CMIDAIRVietnamDiseaseIq >> requiredDuration [

	^ self tIq
]
