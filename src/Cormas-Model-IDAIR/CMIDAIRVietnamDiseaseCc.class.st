Class {
	#name : #CMIDAIRVietnamDiseaseCc,
	#superclass : #CMIDAIRVietnamDiseaseC,
	#category : #'Cormas-Model-IDAIR-Disease-Vietnam'
}

{ #category : #accessing }
CMIDAIRVietnamDiseaseCc >> estimatedTransmissibleDuration [

	^ 0.0
]

{ #category : #accessing }
CMIDAIRVietnamDiseaseCc >> inCommunity [

	^ CMIDAIRVietnamDiseaseIc newFrom: self
]

{ #category : #transitioning }
CMIDAIRVietnamDiseaseCc >> next [

	^ CMIDAIRVietnamDiseaseR newFrom: self
]

{ #category : #accessing }
CMIDAIRVietnamDiseaseCc >> requiredDuration [

	^ self tCc
]

{ #category : #accessing }
CMIDAIRVietnamDiseaseCc >> tau [

	^ self tCc
]
