Class {
	#name : #CMIDAIRVietnamDiseaseCc,
	#superclass : #CMIDAIRVietnamDiseaseC,
	#category : #'Cormas-Model-IDAIR-Disease-Vietnam'
}

{ #category : #accessing }
CMIDAIRVietnamDiseaseCc >> estimatedTransmissibleDuration [

	^ 0.0
]

{ #category : #transitioning }
CMIDAIRVietnamDiseaseCc >> next [

	^ CMIDAIRVietnamDiseaseR newFrom: self
]

{ #category : #accessing }
CMIDAIRVietnamDiseaseCc >> requiredDuration [

	^ self tCc
]
