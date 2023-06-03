Class {
	#name : #CMIDAIRVietnamDiseaseEm,
	#superclass : #CMIDAIRVietnamDiseaseE,
	#category : #'Cormas-Model-IDAIR-Disease-Vietnam'
}

{ #category : #transitioning }
CMIDAIRVietnamDiseaseEm >> next [

	^ CMIDAIRVietnamDiseaseAm newFrom: self
]

{ #category : #accessing }
CMIDAIRVietnamDiseaseEm >> requiredDuration [

	^ self tEm
]

{ #category : #accessing }
CMIDAIRVietnamDiseaseEm >> tau [

	^ self tEm
]
