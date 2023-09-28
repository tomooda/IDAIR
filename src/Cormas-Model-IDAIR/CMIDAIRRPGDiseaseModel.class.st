Class {
	#name : #CMIDAIRRPGDiseaseModel,
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
		'numberOfNewWorsened',
		'numberOfNewRecovering',
		'numberOfNewRecovered',
		'numberOfNewDead'
	],
	#category : #'Cormas-Model-IDAIR-Disease-RPG'
}

{ #category : #accessing }
CMIDAIRRPGDiseaseModel class >> submodelName [
	^ 'RPG'
]

{ #category : #converting }
CMIDAIRRPGDiseaseModel >> asPresenter [

	^ CMIDAIRRPGDiseaseModelPresenter on: self
]

{ #category : #accessing }
CMIDAIRRPGDiseaseModel >> beta_exposed [

	^ beta_exposed
]

{ #category : #accessing }
CMIDAIRRPGDiseaseModel >> beta_exposed: aNumber [

	beta_exposed := aNumber
]

{ #category : #accessing }
CMIDAIRRPGDiseaseModel >> beta_mild [

	^ beta_mild
]

{ #category : #accessing }
CMIDAIRRPGDiseaseModel >> beta_mild: aNumber [

	beta_mild := aNumber
]

{ #category : #accessing }
CMIDAIRRPGDiseaseModel >> beta_recovering [

	^ beta_recovering
]

{ #category : #accessing }
CMIDAIRRPGDiseaseModel >> beta_recovering: aNumber [

	beta_recovering := aNumber
]

{ #category : #accessing }
CMIDAIRRPGDiseaseModel >> beta_severe [

	^ beta_severe
]

{ #category : #accessing }
CMIDAIRRPGDiseaseModel >> beta_severe: aNumber [

	beta_severe := aNumber
]

{ #category : #defaults }
CMIDAIRRPGDiseaseModel >> defaultDiseaseDynamicsClass [

	^ CMIDAIRRPGSusceptible
]

{ #category : #accessing }
CMIDAIRRPGDiseaseModel >> incrementNewDead [

	numberOfNewDead := numberOfNewDead + 1
]

{ #category : #counting }
CMIDAIRRPGDiseaseModel >> incrementNewMild [

	numberOfNewMild := numberOfNewMild + 1
]

{ #category : #counting }
CMIDAIRRPGDiseaseModel >> incrementNewRecovered [

	numberOfNewRecovered := numberOfNewRecovered + 1
]

{ #category : #counting }
CMIDAIRRPGDiseaseModel >> incrementNewRecovering [

	numberOfNewRecovering := numberOfNewRecovering + 1
]

{ #category : #counting }
CMIDAIRRPGDiseaseModel >> incrementNewSevere [

	numberOfNewSevere := numberOfNewSevere + 1
]

{ #category : #counting }
CMIDAIRRPGDiseaseModel >> incrementNewWorsened [

	numberOfNewWorsened := numberOfNewWorsened + 1
]

{ #category : #initialization }
CMIDAIRRPGDiseaseModel >> initialize [

	super initialize.
	beta_exposed := 0.5.
	beta_mild := 1.0.
	beta_severe := 2.0.
	beta_recovering := 0.2.
	tau_exposed := 3.0.
	tau_mild := 10.0.
	tau_severe := 20.0.
	tau_recovering := 5.0.
	tau_recovered := 9999.0.
	p_severe := 0.01.
	p_dead := 0.01.
	self initializeRound
]

{ #category : #initialization }
CMIDAIRRPGDiseaseModel >> initializeRound [

	super initializeRound.
	numberOfNewMild := 0.
	numberOfNewSevere := 0.
	numberOfNewWorsened := 0.
	numberOfNewRecovering := 0.
	numberOfNewRecovered := 0.
	numberOfNewDead := 0
]

{ #category : #accessing }
CMIDAIRRPGDiseaseModel >> numberOfNewDead [

	^ numberOfNewDead
]

{ #category : #accessing }
CMIDAIRRPGDiseaseModel >> numberOfNewMild [

	^ numberOfNewMild
]

{ #category : #accessing }
CMIDAIRRPGDiseaseModel >> numberOfNewRecovered [

	^ numberOfNewRecovered
]

{ #category : #accessing }
CMIDAIRRPGDiseaseModel >> numberOfNewRecovering [

	^ numberOfNewRecovering
]

{ #category : #accessing }
CMIDAIRRPGDiseaseModel >> numberOfNewSevere [

	^ numberOfNewSevere
]

{ #category : #accessing }
CMIDAIRRPGDiseaseModel >> numberOfNewWorsened [

	^ numberOfNewWorsened
]

{ #category : #accessing }
CMIDAIRRPGDiseaseModel >> p_dead [

	^ p_dead
]

{ #category : #accessing }
CMIDAIRRPGDiseaseModel >> p_dead: aNumber [

	^ p_dead := aNumber
]

{ #category : #accessing }
CMIDAIRRPGDiseaseModel >> p_severe [

	^ p_severe
]

{ #category : #accessing }
CMIDAIRRPGDiseaseModel >> p_severe: aNumber [

	p_severe := aNumber
]

{ #category : #accessing }
CMIDAIRRPGDiseaseModel >> tau_exposed [

	^ tau_exposed
]

{ #category : #accessing }
CMIDAIRRPGDiseaseModel >> tau_exposed: aNumber [

	tau_exposed := aNumber
]

{ #category : #accessing }
CMIDAIRRPGDiseaseModel >> tau_mild [

	^ tau_mild
]

{ #category : #accessing }
CMIDAIRRPGDiseaseModel >> tau_mild: aNumber [

	tau_mild := aNumber
]

{ #category : #accessing }
CMIDAIRRPGDiseaseModel >> tau_recovered [

	^ tau_recovered
]

{ #category : #accessing }
CMIDAIRRPGDiseaseModel >> tau_recovered: aNumber [

	tau_recovered := aNumber
]

{ #category : #accessing }
CMIDAIRRPGDiseaseModel >> tau_recovering [

	^ tau_recovering
]

{ #category : #accessing }
CMIDAIRRPGDiseaseModel >> tau_recovering: aNumber [

	tau_recovering := aNumber
]

{ #category : #accessing }
CMIDAIRRPGDiseaseModel >> tau_severe [

	^ tau_severe
]

{ #category : #accessing }
CMIDAIRRPGDiseaseModel >> tau_severe: aNumber [

	tau_severe := aNumber
]
