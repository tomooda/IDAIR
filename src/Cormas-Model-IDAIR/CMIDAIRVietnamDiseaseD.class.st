Class {
	#name : #CMIDAIRVietnamDiseaseD,
	#superclass : #CMIDAIRVietnamDiseaseDynamics,
	#category : #'Cormas-Model-IDAIR-Disease-Vietnam'
}

{ #category : #accessing }
CMIDAIRVietnamDiseaseD >> color [

	^ Color black
]

{ #category : #testing }
CMIDAIRVietnamDiseaseD >> isDead [

	^ true
]

{ #category : #transitioning }
CMIDAIRVietnamDiseaseD >> next [

	^ self
]

{ #category : #accessing }
CMIDAIRVietnamDiseaseD >> requiredDuration [

	^ Float infinity
]
