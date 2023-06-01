Class {
	#name : #CMIDAIRVietnamDiseaseIh,
	#superclass : #CMIDAIRVietnamDiseaseI,
	#category : #'Cormas-Model-IDAIR-Disease-Vietnam'
}

{ #category : #accessing }
CMIDAIRVietnamDiseaseIh >> estimatedTransmissibleDuration [

	^ self tAh + self tIh
]

{ #category : #transitioning }
CMIDAIRVietnamDiseaseIh >> next [

	^ CMIDAIRVietnamDiseaseHh newFrom: self
]

{ #category : #accessing }
CMIDAIRVietnamDiseaseIh >> requiredDuration [

	^ self tIh
]
