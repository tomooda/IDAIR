Class {
	#name : #CMIDAIRSEIRDiseaseModel,
	#superclass : #CMIDAIRDiseaseModel,
	#instVars : [
		'beta_exposed',
		'beta_ill',
		'tau_exposed',
		'tau_ill',
		'tau_hospitalized',
		'tau_recovered'
	],
	#category : #'Cormas-Model-IDAIR-Disease-SEIR'
}

{ #category : #accessing }
CMIDAIRSEIRDiseaseModel class >> submodelName [
	^ 'SEIR'
]

{ #category : #converting }
CMIDAIRSEIRDiseaseModel >> asPresenter [

	^ CMIDAIRSEIRDiseaseModelPresenter on: self
]

{ #category : #accessing }
CMIDAIRSEIRDiseaseModel >> beta_exposed [

	^ beta_exposed
]

{ #category : #accessing }
CMIDAIRSEIRDiseaseModel >> beta_exposed: aNumber [

	beta_exposed := aNumber
]

{ #category : #accessing }
CMIDAIRSEIRDiseaseModel >> beta_ill [

	^ beta_ill
]

{ #category : #accessing }
CMIDAIRSEIRDiseaseModel >> beta_ill: aNumber [

	beta_ill := aNumber
]

{ #category : #defaults }
CMIDAIRSEIRDiseaseModel >> defaultDiseaseDynamicsClass [

	^ CMIDAIRSEIRSusceptive
]

{ #category : #initialization }
CMIDAIRSEIRDiseaseModel >> initialize [

	super initialize.
	beta_exposed := 0.5.
	beta_ill := 1.5.
	tau_exposed := 6.0.
	tau_ill := 10.0.
	tau_hospitalized := 15.0.
	tau_recovered := 100.0
]

{ #category : #accessing }
CMIDAIRSEIRDiseaseModel >> tau_exposed [

	^ tau_exposed
]

{ #category : #accessing }
CMIDAIRSEIRDiseaseModel >> tau_exposed: aNumber [

	tau_exposed := aNumber
]

{ #category : #accessing }
CMIDAIRSEIRDiseaseModel >> tau_hospitalized [

	^ tau_hospitalized
]

{ #category : #accessing }
CMIDAIRSEIRDiseaseModel >> tau_hospitalized: aNumber [

	tau_hospitalized := aNumber
]

{ #category : #accessing }
CMIDAIRSEIRDiseaseModel >> tau_ill [

	^ tau_ill
]

{ #category : #accessing }
CMIDAIRSEIRDiseaseModel >> tau_ill: aNumber [

	tau_ill := aNumber
]

{ #category : #accessing }
CMIDAIRSEIRDiseaseModel >> tau_recovered [

	^ tau_recovered
]

{ #category : #accessing }
CMIDAIRSEIRDiseaseModel >> tau_recovered: aNumber [

	tau_recovered := aNumber
]
