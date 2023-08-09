Class {
	#name : #CMIDAIRVietnamDiseaseId,
	#superclass : #CMIDAIRVietnamDiseaseI,
	#category : #'Cormas-Model-IDAIR-Disease-Vietnam'
}

{ #category : #accessing }
CMIDAIRVietnamDiseaseId >> beta [

	^ self bId
]

{ #category : #transitioning }
CMIDAIRVietnamDiseaseId >> next [

	^ CMIDAIRVietnamDiseaseHd newFrom: self
]

{ #category : #accessing }
CMIDAIRVietnamDiseaseId >> requiredDuration [

	^ self tId
]

{ #category : #accessing }
CMIDAIRVietnamDiseaseId >> tau [

	^ self tId
]
