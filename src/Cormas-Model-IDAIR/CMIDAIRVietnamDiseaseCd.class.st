Class {
	#name : #CMIDAIRVietnamDiseaseCd,
	#superclass : #CMIDAIRVietnamDiseaseC,
	#category : #'Cormas-Model-IDAIR-Disease-Vietnam'
}

{ #category : #accessing }
CMIDAIRVietnamDiseaseCd >> estimatedTransmissibleDuration [

	^ 0.0
]

{ #category : #accessing }
CMIDAIRVietnamDiseaseCd >> next [

	^ CMIDAIRVietnamDiseaseD newFrom: self
]

{ #category : #accessing }
CMIDAIRVietnamDiseaseCd >> requiredDuration [

	^ self tCd
]
