Class {
	#name : #CMIDAIRSEIRDiseaseModelPresenter,
	#superclass : #SpPresenterWithModel,
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

{ #category : #specs }
CMIDAIRSEIRDiseaseModelPresenter class >> defaultSpec [

	^ SpBoxLayout newVertical
		  add: 'Susceptive' asPresenter expand: false;
		  add: (SpBoxLayout newHorizontal
				   add: 'Exposed' asPresenter width: 100;
				   add: 'duration ' expand: false;
				   add: #tau_exposed width: 100;
				   add: '  spread ' expand: false;
				   add: #beta_exposed width: 100;
				   yourself)
		  expand: false;
		  add: (SpBoxLayout newHorizontal
				   add: 'Ill' asPresenter width: 100;
				   add: 'duration ' expand: false;
				   add: #tau_exposed width: 100;
				   add: '  spread ' expand: false;
				   add: #beta_ill width: 100;
				   yourself)
		  expand: false;
		  add: (SpBoxLayout newHorizontal
				   add: 'Recovered' asPresenter width: 100;
				   add: 'duration ' expand: false;
				   add: #tau_recovered width: 100;
				   yourself)
		  expand: false;
		  add: '' asPresenter expand: false;
		  add: (SpBoxLayout newHorizontal
				   add: 'Hospitalized' asPresenter width: 100;
				   add: 'duration ' expand: false;
				   add: #tau_hospitalized width: 100;
				   yourself)
		  expand: false;
		  yourself
]

{ #category : #initialization }
CMIDAIRSEIRDiseaseModelPresenter >> initializePresenters [

	super initializePresenters.
	beta_exposed := self newNumberInput
		                beFloat;
		                whenNumberChangedDo: [ :value | 
			                self model ifNotNil: [ :m | m beta_exposed: value ] ];
		                yourself.
	beta_ill := self newNumberInput
		            beFloat;
		            whenNumberChangedDo: [ :value | 
			            self model ifNotNil: [ :m | m beta_ill: value ] ];
		            yourself.
	tau_exposed := self newNumberInput
		               beFloat;
		               whenNumberChangedDo: [ :value | 
			               self model ifNotNil: [ :m | m tau_exposed: value ] ];
		               yourself.
	tau_ill := self newNumberInput
		           beFloat;
		           whenNumberChangedDo: [ :value | 
			           self model ifNotNil: [ :m | m tau_ill: value ] ];
		           yourself.
	tau_hospitalized := self newNumberInput
		                    beFloat;
		                    whenNumberChangedDo: [ :value | 
			                    self model ifNotNil: [ :m | 
					                    m tau_hospitalized: value ] ];
		                    yourself.
	tau_recovered := self newNumberInput
		                 beFloat;
		                 whenNumberChangedDo: [ :value | 
			                 self model ifNotNil: [ :m | 
					                 m tau_recovered: value ] ];
		                 yourself
]

{ #category : #initialization }
CMIDAIRSEIRDiseaseModelPresenter >> modelChanged [

	super modelChanged.
	self model ifNotNil: [ :m | 
		beta_exposed number: m beta_exposed.
		beta_ill number: m beta_ill.
		tau_exposed number: m tau_exposed.
		tau_ill number: m tau_ill.
		tau_hospitalized number: m tau_hospitalized.
		tau_recovered number: m tau_recovered ]
]
