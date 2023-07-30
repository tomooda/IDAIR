Class {
	#name : #CMIDAIRVietnamDiseaseI,
	#superclass : #CMIDAIRVietnamDiseaseDynamics,
	#category : #'Cormas-Model-IDAIR-Disease-Vietnam'
}

{ #category : #testing }
CMIDAIRVietnamDiseaseI class >> isAbstract [

	^ self = CMIDAIRVietnamDiseaseI
]

{ #category : #accessing }
CMIDAIRVietnamDiseaseI >> color [

	^ Color red
]

{ #category : #accessing }
CMIDAIRVietnamDiseaseI >> inCommunity [

	^ self
]

{ #category : #testing }
CMIDAIRVietnamDiseaseI >> isInCommunity [

	^ true
]

{ #category : #testing }
CMIDAIRVietnamDiseaseI >> isInfected [

	^ true
]

{ #category : #testing }
CMIDAIRVietnamDiseaseI >> isSymptomatic [

	^ true
]

{ #category : #testing }
CMIDAIRVietnamDiseaseI >> isTransmissible [

	^ true
]
