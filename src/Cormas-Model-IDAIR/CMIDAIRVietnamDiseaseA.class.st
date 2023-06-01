Class {
	#name : #CMIDAIRVietnamDiseaseA,
	#superclass : #CMIDAIRVietnamDiseaseDynamics,
	#category : #'Cormas-Model-IDAIR-Disease-Vietnam'
}

{ #category : #testing }
CMIDAIRVietnamDiseaseA class >> isAbstract [

	^ self = CMIDAIRVietnamDiseaseA
]

{ #category : #accessing }
CMIDAIRVietnamDiseaseA >> color [

	^ Color yellow
]

{ #category : #testing }
CMIDAIRVietnamDiseaseA >> isAsymptomatic [

	^ true
]

{ #category : #testing }
CMIDAIRVietnamDiseaseA >> isInfected [

	^ true
]

{ #category : #testing }
CMIDAIRVietnamDiseaseA >> isTransmissible [

	^ true
]
