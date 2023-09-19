Class {
	#name : #CMIDAIRDiseaseModel,
	#superclass : #CMIDAIRSubmodel,
	#category : #'Cormas-Model-IDAIR-Disease'
}

{ #category : #testing }
CMIDAIRDiseaseModel class >> isAbstract [

	^ self = CMIDAIRDiseaseModel
]

{ #category : #accessing }
CMIDAIRDiseaseModel class >> order [

	^ 0.1
]

{ #category : #accessing }
CMIDAIRDiseaseModel class >> submodelCategoryName [

	^ #disease
]

{ #category : #defaults }
CMIDAIRDiseaseModel >> defaultDiseaseDynamicsClass [

	^ self subclassResponsibility
]

{ #category : #initialization }
CMIDAIRDiseaseModel >> init [

	
]

{ #category : #accessing }
CMIDAIRDiseaseModel >> initializers [

	^ { 
		  ('Susceptible' -> [ :citizen | citizen beSusceptible ]).
		  ('Exposed' -> [ :citizen | citizen beExposed ]).
		  ('Mild' -> [ :citizen | citizen beMildSymptom ]).
		  ('Severe' -> [ :citizen | citizen beSevereSymptom ]).
		  ('Recovered' -> [ :citizen | citizen beRecovered ]).
		  ('Dead' -> [ :citizen | citizen beDead ]) }
]

{ #category : #control }
CMIDAIRDiseaseModel >> step: anInteger [

	self cormasModel theCitizens do: [ :citizen | 
		citizen diseaseDynamics: citizen diseaseDynamics step ]
]
