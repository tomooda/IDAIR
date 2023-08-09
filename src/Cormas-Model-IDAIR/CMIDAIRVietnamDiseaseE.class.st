Class {
	#name : #CMIDAIRVietnamDiseaseE,
	#superclass : #CMIDAIRVietnamDiseaseDynamics,
	#category : #'Cormas-Model-IDAIR-Disease-Vietnam'
}

{ #category : #testing }
CMIDAIRVietnamDiseaseE class >> isAbstract [

	^ self = CMIDAIRVietnamDiseaseE
]

{ #category : #accessing }
CMIDAIRVietnamDiseaseE >> beta [

	^ 0.0
]

{ #category : #accessing }
CMIDAIRVietnamDiseaseE >> color [

	^ Color blue
]

{ #category : #accessing }
CMIDAIRVietnamDiseaseE >> inCommunity [

	^ self
]

{ #category : #testing }
CMIDAIRVietnamDiseaseE >> isInCommunity [

	^ true
]
