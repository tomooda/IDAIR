Class {
	#name : #CMIDAIRVietnamDiseaseR,
	#superclass : #CMIDAIRVietnamDiseaseDynamics,
	#category : #'Cormas-Model-IDAIR-Disease-Vietnam'
}

{ #category : #accessing }
CMIDAIRVietnamDiseaseR >> color [

	^ Color cyan
]

{ #category : #testing }
CMIDAIRVietnamDiseaseR >> isRecovered [

	^ true
]

{ #category : #transitioning }
CMIDAIRVietnamDiseaseR >> next [

	^ CMIDAIRVietnamDiseaseS newFrom: self
]

{ #category : #accessing }
CMIDAIRVietnamDiseaseR >> requiredDuration [

	^ self tR
]