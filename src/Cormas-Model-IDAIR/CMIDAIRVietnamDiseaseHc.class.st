Class {
	#name : #CMIDAIRVietnamDiseaseHc,
	#superclass : #CMIDAIRVietnamDiseaseH,
	#category : #'Cormas-Model-IDAIR-Disease-Vietnam'
}

{ #category : #accessing }
CMIDAIRVietnamDiseaseHc >> inCommunity [

	^ CMIDAIRVietnamDiseaseIc newFrom: self
]

{ #category : #transitioning }
CMIDAIRVietnamDiseaseHc >> next [

	^ CMIDAIRVietnamDiseaseCc newFrom: self
]

{ #category : #accessing }
CMIDAIRVietnamDiseaseHc >> requiredDuration [

	^ self tHc
]

{ #category : #accessing }
CMIDAIRVietnamDiseaseHc >> tau [

	^ self tHc
]
