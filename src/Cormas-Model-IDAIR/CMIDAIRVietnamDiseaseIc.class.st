Class {
	#name : #CMIDAIRVietnamDiseaseIc,
	#superclass : #CMIDAIRVietnamDiseaseI,
	#category : #'Cormas-Model-IDAIR-Disease-Vietnam'
}

{ #category : #accessing }
CMIDAIRVietnamDiseaseIc >> beta [

	^ self bIc
]

{ #category : #transitioning }
CMIDAIRVietnamDiseaseIc >> next [

	^ CMIDAIRVietnamDiseaseHc newFrom: self
]

{ #category : #accessing }
CMIDAIRVietnamDiseaseIc >> requiredDuration [

	^ self tIc
]

{ #category : #accessing }
CMIDAIRVietnamDiseaseIc >> tau [

	^ self tIc
]
