Class {
	#name : #CMIDAIRVietnamDiseaseC,
	#superclass : #CMIDAIRVietnamDiseaseDynamics,
	#category : #'Cormas-Model-IDAIR-Disease-Vietnam'
}

{ #category : #testing }
CMIDAIRVietnamDiseaseC class >> isAbstract [

	^ self = CMIDAIRVietnamDiseaseC
]

{ #category : #accessing }
CMIDAIRVietnamDiseaseC >> color [

	^ Color darkGray
]

{ #category : #testing }
CMIDAIRVietnamDiseaseC >> isICUed [

	^ true
]

{ #category : #testing }
CMIDAIRVietnamDiseaseC >> isInfected [

	^ true
]

{ #category : #testing }
CMIDAIRVietnamDiseaseC >> isSymptomatic [

	^ true
]
