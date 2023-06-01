Class {
	#name : #CMIDAIRDiseaseModel,
	#superclass : #CMIDAIRSubmodel,
	#category : #'Cormas-Model-IDAIR-Disease-Oxford'
}

{ #category : #testing }
CMIDAIRDiseaseModel class >> isAbstract [

	^ self = CMIDAIRDiseaseModel
]

{ #category : #defaults }
CMIDAIRDiseaseModel >> defaultDiseaseDynamicsClass [

	^ self subclassResponsibility
]

{ #category : #accessing }
CMIDAIRDiseaseModel >> name [

	^ #disease
]

{ #category : #control }
CMIDAIRDiseaseModel >> step: anInteger [

	self cormasModel theCitizens do: [ :citizen | 
		citizen diseaseDynamics: citizen diseaseDynamics step ]
]