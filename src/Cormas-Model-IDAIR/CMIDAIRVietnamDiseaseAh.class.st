Class {
	#name : #CMIDAIRVietnamDiseaseAh,
	#superclass : #CMIDAIRVietnamDiseaseA,
	#category : #'Cormas-Model-IDAIR-Disease-Vietnam'
}

{ #category : #accessing }
CMIDAIRVietnamDiseaseAh >> next [

	^ CMIDAIRVietnamDiseaseIh newFrom: self
]

{ #category : #accessing }
CMIDAIRVietnamDiseaseAh >> requiredDuration [

	^ self tAh
]