Class {
	#name : #CMIDAIRVietnamDiseaseIh,
	#superclass : #CMIDAIRVietnamDiseaseI,
	#category : #'Cormas-Model-IDAIR-Disease-Vietnam'
}

{ #category : #accessing }
CMIDAIRVietnamDiseaseIh >> beta [

	^ self bIh
]

{ #category : #transitioning }
CMIDAIRVietnamDiseaseIh >> next [

	^ CMIDAIRVietnamDiseaseHh newFrom: self
]

{ #category : #accessing }
CMIDAIRVietnamDiseaseIh >> requiredDuration [

	^ self tIh
]

{ #category : #accessing }
CMIDAIRVietnamDiseaseIh >> tau [

	^ self tIh
]
