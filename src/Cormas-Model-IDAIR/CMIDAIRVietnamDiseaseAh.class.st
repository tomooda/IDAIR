Class {
	#name : #CMIDAIRVietnamDiseaseAh,
	#superclass : #CMIDAIRVietnamDiseaseA,
	#category : #'Cormas-Model-IDAIR-Disease-Vietnam'
}

{ #category : #accessing }
CMIDAIRVietnamDiseaseAh >> estimatedTransmissibleDuration [

	^ self tAh + self tIh
]

{ #category : #transitioning }
CMIDAIRVietnamDiseaseAh >> next [

	^ CMIDAIRVietnamDiseaseIh newFrom: self
]

{ #category : #accessing }
CMIDAIRVietnamDiseaseAh >> requiredDuration [

	^ self tAh
]
