Class {
	#name : #CMIDAIRVietnamDiseaseQ,
	#superclass : #CMIDAIRVietnamDiseaseDynamics,
	#category : #'Cormas-Model-IDAIR-Disease-Vietnam'
}

{ #category : #accessing }
CMIDAIRVietnamDiseaseQ >> color [

	^ Color gray
]

{ #category : #testing }
CMIDAIRVietnamDiseaseQ >> isInfected [

	^ true
]

{ #category : #testing }
CMIDAIRVietnamDiseaseQ >> isSymptomatic [

	^ true
]

{ #category : #transitioning }
CMIDAIRVietnamDiseaseQ >> next [

	^ CMIDAIRVietnamDiseaseR newFrom: self
]

{ #category : #accessing }
CMIDAIRVietnamDiseaseQ >> requiredDuration [

	^ self tQ
]