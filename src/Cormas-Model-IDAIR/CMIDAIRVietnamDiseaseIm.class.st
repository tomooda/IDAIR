Class {
	#name : #CMIDAIRVietnamDiseaseIm,
	#superclass : #CMIDAIRVietnamDiseaseI,
	#category : #'Cormas-Model-IDAIR-Disease-Vietnam'
}

{ #category : #accessing }
CMIDAIRVietnamDiseaseIm >> beta [

	^ self bIm
]

{ #category : #transitioning }
CMIDAIRVietnamDiseaseIm >> next [

	^ CMIDAIRVietnamDiseaseR newFrom: self
]

{ #category : #accessing }
CMIDAIRVietnamDiseaseIm >> requiredDuration [

	^ self tIm
]

{ #category : #accessing }
CMIDAIRVietnamDiseaseIm >> tau [

	^ self tIm
]
