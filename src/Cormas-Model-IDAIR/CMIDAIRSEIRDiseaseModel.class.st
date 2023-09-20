Class {
	#name : #CMIDAIRSEIRDiseaseModel,
	#superclass : #CMIDAIRDiseaseModel,
	#instVars : [
		'beta_exposed',
		'beta_mild',
		'beta_severe',
		'beta_recovering',
		'tau_exposed',
		'tau_mild',
		'tau_severe',
		'tau_recovering',
		'tau_recovered',
		'p_severe',
		'p_dead',
		'numberOfNewMild',
		'numberOfNewSevere',
		'numberOfNewRecovering',
		'numberOfNewRecovered',
		'numberOfNewDead'
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
CMIDAIRSEIRDiseaseModel >> beta_mild [

	^ beta_mild
]

{ #category : #accessing }
CMIDAIRSEIRDiseaseModel >> beta_mild: aNumber [

	beta_mild := aNumber
]

{ #category : #accessing }
CMIDAIRSEIRDiseaseModel >> beta_recovering [

	^ beta_recovering
]

{ #category : #accessing }
CMIDAIRSEIRDiseaseModel >> beta_recovering: aNumber [

	beta_recovering := aNumber
]

{ #category : #accessing }
CMIDAIRSEIRDiseaseModel >> beta_severe [

	^ beta_severe
]

{ #category : #accessing }
CMIDAIRSEIRDiseaseModel >> beta_severe: aNumber [

	beta_severe := aNumber
]

{ #category : #defaults }
CMIDAIRSEIRDiseaseModel >> defaultDiseaseDynamicsClass [

	^ CMIDAIRSEIRSusceptible
]

{ #category : #accessing }
CMIDAIRSEIRDiseaseModel >> incrementNewDead [

	numberOfNewDead := numberOfNewDead + 1
]

{ #category : #counting }
CMIDAIRSEIRDiseaseModel >> incrementNewMild [

	numberOfNewMild := numberOfNewMild + 1
]

{ #category : #counting }
CMIDAIRSEIRDiseaseModel >> incrementNewRecovered [

	numberOfNewRecovered := numberOfNewRecovered + 1
]

{ #category : #counting }
CMIDAIRSEIRDiseaseModel >> incrementNewRecovering [

	numberOfNewRecovering := numberOfNewRecovering + 1
]

{ #category : #counting }
CMIDAIRSEIRDiseaseModel >> incrementNewSevere [

	numberOfNewSevere := numberOfNewSevere + 1
]

{ #category : #initialization }
CMIDAIRSEIRDiseaseModel >> initialize [

	super initialize.
	beta_exposed := 0.5.
	beta_mild := 1.0.
	beta_severe := 2.0.
	beta_recovering := 0.2.
	tau_exposed := 3.0.
	tau_mild := 10.0.
	tau_severe := 20.0.
	tau_recovering := 5.0.
	tau_recovered := 100.0.
	p_severe := 0.01.
	p_dead := 0.01.
	self initializeRound
]

{ #category : #initialization }
CMIDAIRSEIRDiseaseModel >> initializeRound [

	super initializeRound.
	numberOfNewMild := 0.
	numberOfNewSevere := 0.
	numberOfNewRecovering := 0.
	numberOfNewRecovered := 0.
	numberOfNewDead := 0
]

{ #category : #accessing }
CMIDAIRSEIRDiseaseModel >> numberOfNewMild [

	^ numberOfNewMild
]

{ #category : #accessing }
CMIDAIRSEIRDiseaseModel >> numberOfNewRecovered [

	^ numberOfNewRecovered
]

{ #category : #accessing }
CMIDAIRSEIRDiseaseModel >> numberOfNewRecovering [

	^ numberOfNewRecovering
]

{ #category : #accessing }
CMIDAIRSEIRDiseaseModel >> numberOfNewSevere [

	^ numberOfNewSevere
]

{ #category : #accessing }
CMIDAIRSEIRDiseaseModel >> p_dead [

	^ p_dead
]

{ #category : #accessing }
CMIDAIRSEIRDiseaseModel >> p_dead: aNumber [

	^ p_dead := aNumber
]

{ #category : #accessing }
CMIDAIRSEIRDiseaseModel >> p_severe [

	^ p_severe
]

{ #category : #accessing }
CMIDAIRSEIRDiseaseModel >> p_severe: aNumber [

	p_severe := aNumber
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
CMIDAIRSEIRDiseaseModel >> tau_mild [

	^ tau_mild
]

{ #category : #accessing }
CMIDAIRSEIRDiseaseModel >> tau_mild: aNumber [

	tau_mild := aNumber
]

{ #category : #accessing }
CMIDAIRSEIRDiseaseModel >> tau_recovered [

	^ tau_recovered
]

{ #category : #accessing }
CMIDAIRSEIRDiseaseModel >> tau_recovered: aNumber [

	tau_recovered := aNumber
]

{ #category : #accessing }
CMIDAIRSEIRDiseaseModel >> tau_recovering [

	^ tau_recovering
]

{ #category : #accessing }
CMIDAIRSEIRDiseaseModel >> tau_recovering: aNumber [

	tau_recovering := aNumber
]

{ #category : #accessing }
CMIDAIRSEIRDiseaseModel >> tau_severe [

	^ tau_severe
]

{ #category : #accessing }
CMIDAIRSEIRDiseaseModel >> tau_severe: aNumber [

	tau_severe := aNumber
]
