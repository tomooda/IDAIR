Class {
	#name : #CMIDAIRVietnamDiseaseAa,
	#superclass : #CMIDAIRVietnamDiseaseA,
	#category : #'Cormas-Model-IDAIR-Disease-Vietnam'
}

{ #category : #accessing }
CMIDAIRVietnamDiseaseAa >> beta [

	^ self bAa
]

{ #category : #transitioning }
CMIDAIRVietnamDiseaseAa >> next [

	^ CMIDAIRVietnamDiseaseR newFrom: self
]

{ #category : #accessing }
CMIDAIRVietnamDiseaseAa >> requiredDuration [

	^ self tAa
]

{ #category : #accessing }
CMIDAIRVietnamDiseaseAa >> tau [

	^ self tAa
]
