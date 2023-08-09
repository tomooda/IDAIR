Class {
	#name : #CMIDAIRVietnamDiseaseQ,
	#superclass : #CMIDAIRVietnamDiseaseDynamics,
	#category : #'Cormas-Model-IDAIR-Disease-Vietnam'
}

{ #category : #accessing }
CMIDAIRVietnamDiseaseQ >> beta [

	^ 0.0
]

{ #category : #accessing }
CMIDAIRVietnamDiseaseQ >> color [

	^ Color gray
]

{ #category : #accessing }
CMIDAIRVietnamDiseaseQ >> inCommunity [

	^ CMIDAIRVietnamDiseaseIm newFrom: self
]

{ #category : #testing }
CMIDAIRVietnamDiseaseQ >> isInfected [

	^ true
]

{ #category : #testing }
CMIDAIRVietnamDiseaseQ >> isQuarrantined [

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

{ #category : #accessing }
CMIDAIRVietnamDiseaseQ >> tau [

	^ self tQ
]
