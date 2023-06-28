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

{ #category : #accessing }
CMIDAIRDiseaseModel >> estimatedTransmissibleDuration [

	| t n |
	t := 0.
	n := 0.
	self cormasModel theCitizens do: [ :citizen | 
		(citizen isTransmissible and: [ citizen isHospitalized not ]) 
			ifTrue: [ 
				t := t + citizen estimatedTransmissibleDuration.
				n := n + 1 ] ].
	^ n > 0
		  ifTrue: [ t asFloat / n asFloat ]
		  ifFalse: [ 0.0 ]
]

{ #category : #accessing }
CMIDAIRDiseaseModel >> initializers [

	^ { 
		  ('Susceptive' -> [ :citizen | citizen beSusceptive ]).
		  ('Exposed' -> [ :citizen | citizen beExposed ]).
		  ('Asymptomatic' -> [ :citizen | citizen beAsymptomatic ]).
		  ('Dead' -> [ :citizen | citizen beDead ]) }
]

{ #category : #control }
CMIDAIRDiseaseModel >> step: anInteger [

	self cormasModel theCitizens do: [ :citizen | 
		citizen diseaseDynamics: citizen diseaseDynamics step ]
]
