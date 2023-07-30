Class {
	#name : #CMIDAIRVietnamDiseaseHd,
	#superclass : #CMIDAIRVietnamDiseaseH,
	#category : #'Cormas-Model-IDAIR-Disease-Vietnam'
}

{ #category : #accessing }
CMIDAIRVietnamDiseaseHd >> inCommunity [

	^ CMIDAIRVietnamDiseaseId newFrom: self
]

{ #category : #transitioning }
CMIDAIRVietnamDiseaseHd >> next [

	^ CMIDAIRVietnamDiseaseCd newFrom: self
]

{ #category : #accessing }
CMIDAIRVietnamDiseaseHd >> requiredDuration [

	^ self tHd
]

{ #category : #accessing }
CMIDAIRVietnamDiseaseHd >> tau [

	^ self tHd
]
