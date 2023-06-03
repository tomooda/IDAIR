Class {
	#name : #CMIDAIRVietnamDiseaseAc,
	#superclass : #CMIDAIRVietnamDiseaseA,
	#category : #'Cormas-Model-IDAIR-Disease-Vietnam'
}

{ #category : #accessing }
CMIDAIRVietnamDiseaseAc >> beta [

	^ self bAc
]

{ #category : #accessing }
CMIDAIRVietnamDiseaseAc >> estimatedTransmissibleDuration [

	^ self tAc + self tIc
]

{ #category : #transitioning }
CMIDAIRVietnamDiseaseAc >> next [

	^ CMIDAIRVietnamDiseaseIc newFrom: self
]

{ #category : #accessing }
CMIDAIRVietnamDiseaseAc >> requiredDuration [

	^ self tAc
]

{ #category : #accessing }
CMIDAIRVietnamDiseaseAc >> tau [

	^ self tAc
]
