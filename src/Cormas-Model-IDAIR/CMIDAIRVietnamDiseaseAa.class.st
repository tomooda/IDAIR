Class {
	#name : #CMIDAIRVietnamDiseaseAa,
	#superclass : #CMIDAIRVietnamDiseaseA,
	#category : #'Cormas-Model-IDAIR-Disease-Vietnam'
}

{ #category : #accessing }
CMIDAIRVietnamDiseaseAa >> estimatedTransmissibleDuration [

	^ self tAa
]

{ #category : #transitioning }
CMIDAIRVietnamDiseaseAa >> next [

	^ CMIDAIRVietnamDiseaseR newFrom: self
]

{ #category : #accessing }
CMIDAIRVietnamDiseaseAa >> requiredDuration [

	^ self tAa
]
