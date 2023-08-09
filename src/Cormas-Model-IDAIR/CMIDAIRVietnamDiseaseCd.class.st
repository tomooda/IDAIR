Class {
	#name : #CMIDAIRVietnamDiseaseCd,
	#superclass : #CMIDAIRVietnamDiseaseC,
	#category : #'Cormas-Model-IDAIR-Disease-Vietnam'
}

{ #category : #accessing }
CMIDAIRVietnamDiseaseCd >> inCommunity [

	^ CMIDAIRVietnamDiseaseId newFrom: self
]

{ #category : #accessing }
CMIDAIRVietnamDiseaseCd >> next [

	^ CMIDAIRVietnamDiseaseD newFrom: self
]

{ #category : #accessing }
CMIDAIRVietnamDiseaseCd >> requiredDuration [

	^ self tCd
]

{ #category : #accessing }
CMIDAIRVietnamDiseaseCd >> tau [

	^ self tCd
]
