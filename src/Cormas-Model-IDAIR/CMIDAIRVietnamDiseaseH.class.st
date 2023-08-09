Class {
	#name : #CMIDAIRVietnamDiseaseH,
	#superclass : #CMIDAIRVietnamDiseaseDynamics,
	#category : #'Cormas-Model-IDAIR-Disease-Vietnam'
}

{ #category : #testing }
CMIDAIRVietnamDiseaseH class >> isAbstract [

	^ self = CMIDAIRVietnamDiseaseH
]

{ #category : #accessing }
CMIDAIRVietnamDiseaseH >> beta [

	^ 0.0
]

{ #category : #accessing }
CMIDAIRVietnamDiseaseH >> color [

	^ Color gray
]

{ #category : #testing }
CMIDAIRVietnamDiseaseH >> isHospitalized [

	^ true
]

{ #category : #testing }
CMIDAIRVietnamDiseaseH >> isInfected [

	^ true
]

{ #category : #testing }
CMIDAIRVietnamDiseaseH >> isSymptomatic [

	^ true
]
