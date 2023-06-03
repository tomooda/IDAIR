Class {
	#name : #CMIDAIRVietnamDiseaseD,
	#superclass : #CMIDAIRVietnamDiseaseDynamics,
	#category : #'Cormas-Model-IDAIR-Disease-Vietnam'
}

{ #category : #accessing }
CMIDAIRVietnamDiseaseD >> beta [

	^ 0.0
]

{ #category : #accessing }
CMIDAIRVietnamDiseaseD >> color [

	^ Color black
]

{ #category : #accessing }
CMIDAIRVietnamDiseaseD >> estimatedTransmissibleDuration [

	^ 0.0
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

{ #category : #accessing }
CMIDAIRVietnamDiseaseD >> tau [

	^ Float infinity
]
