Class {
	#name : #CMIDAIRVietnamDiseaseAh,
	#superclass : #CMIDAIRVietnamDiseaseA,
	#category : #'Cormas-Model-IDAIR-Disease-Vietnam'
}

{ #category : #accessing }
CMIDAIRVietnamDiseaseAh >> beta [

	^ self bAh
]

{ #category : #transitioning }
CMIDAIRVietnamDiseaseAh >> next [

	^ CMIDAIRVietnamDiseaseIh newFrom: self
]

{ #category : #accessing }
CMIDAIRVietnamDiseaseAh >> requiredDuration [

	^ self tAh
]

{ #category : #accessing }
CMIDAIRVietnamDiseaseAh >> tau [

	^ self tAh
]
