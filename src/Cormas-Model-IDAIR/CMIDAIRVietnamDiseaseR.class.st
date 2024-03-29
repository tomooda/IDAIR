Class {
	#name : #CMIDAIRVietnamDiseaseR,
	#superclass : #CMIDAIRVietnamDiseaseDynamics,
	#category : #'Cormas-Model-IDAIR-Disease-Vietnam'
}

{ #category : #accessing }
CMIDAIRVietnamDiseaseR >> beta [

	^ 0.0
]

{ #category : #accessing }
CMIDAIRVietnamDiseaseR >> color [

	^ Color cyan
]

{ #category : #accessing }
CMIDAIRVietnamDiseaseR >> inCommunity [

	^ self
]

{ #category : #testing }
CMIDAIRVietnamDiseaseR >> isInCommunity [

	^ true
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

{ #category : #accessing }
CMIDAIRVietnamDiseaseR >> tau [

	^ self tR
]
