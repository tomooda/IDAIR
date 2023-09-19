Class {
	#name : #CMIDAIRSEIRDiseaseModelPresenter,
	#superclass : #SpPresenterWithModel,
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
		'p_dead'
	],
	#category : #'Cormas-Model-IDAIR-Disease-SEIR'
}

{ #category : #specs }
CMIDAIRSEIRDiseaseModelPresenter class >> defaultSpec [

	^ SpBoxLayout newVertical
		  add: 'Susceptible' asPresenter expand: false;
		  add: (SpBoxLayout newHorizontal
				   add: 'Exposed' asPresenter width: 100;
				   add: 'duration ' expand: false;
				   add: #tau_exposed width: 100;
				   add: '  spread ' expand: false;
				   add: #beta_exposed width: 100;
				   yourself)
		  expand: false;
		  add: (SpBoxLayout newHorizontal
				   add: 'Mild symptoms' asPresenter width: 100;
				   add: 'duration ' expand: false;
				   add: #tau_mild width: 100;
				   add: '  spread ' expand: false;
				   add: #beta_mild width: 100;
				   add: '  p_worsen / day ' expand: false;
				   add: #p_severe width: 100;
				   yourself)
		  expand: false;
		  add: (SpBoxLayout newHorizontal
				   add: 'Severe symptoms' asPresenter width: 100;
				   add: 'duration ' expand: false;
				   add: #tau_severe width: 100;
				   add: '  spread ' expand: false;
				   add: #beta_severe width: 100;
				   add: '  p_dead / day ' expand: false;
				   add: #p_dead width: 100;
				   yourself)
		  expand: false;
		  add: (SpBoxLayout newHorizontal
				   add: 'Recovering' asPresenter width: 100;
				   add: 'duration ' expand: false;
				   add: #tau_recovering width: 100;
				   add: '  spread ' expand: false;
				   add: #beta_recovering width: 100;
				   yourself)
		  expand: false;
		  add: (SpBoxLayout newHorizontal
				   add: 'Recovered' asPresenter width: 100;
				   add: 'duration ' expand: false;
				   add: #tau_recovered width: 100;
				   yourself)
		  expand: false;
		  add: '' asPresenter expand: false;
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
	beta_mild := self newNumberInput
		             beFloat;
		             whenNumberChangedDo: [ :value | 
			             self model ifNotNil: [ :m | m beta_mild: value ] ];
		             yourself.
	beta_severe := self newNumberInput
		               beFloat;
		               whenNumberChangedDo: [ :value | 
			               self model ifNotNil: [ :m | m beta_severe: value ] ];
		               yourself.
	beta_recovering := self newNumberInput
		                   beFloat;
		                   whenNumberChangedDo: [ :value | 
			                   self model ifNotNil: [ :m | 
					                   m beta_recovering: value ] ];
		                   yourself.
	tau_exposed := self newNumberInput
		               beFloat;
		               whenNumberChangedDo: [ :value | 
			               self model ifNotNil: [ :m | m tau_exposed: value ] ];
		               yourself.
	tau_mild := self newNumberInput
		            beFloat;
		            whenNumberChangedDo: [ :value | 
			            self model ifNotNil: [ :m | m tau_mild: value ] ];
		            yourself.
	tau_severe := self newNumberInput
		              beFloat;
		              whenNumberChangedDo: [ :value | 
			              self model ifNotNil: [ :m | m tau_severe: value ] ];
		              yourself.
	tau_recovering := self newNumberInput
		                  beFloat;
		                  whenNumberChangedDo: [ :value | 
			                  self model ifNotNil: [ :m | 
					                  m tau_recovering value ] ];
		                  yourself.
	tau_recovered := self newNumberInput
		                 beFloat;
		                 whenNumberChangedDo: [ :value | 
			                 self model ifNotNil: [ :m | 
					                 m tau_recovered: value ] ];
		                 yourself.
	p_severe := self newNumberInput
		            beFloat;
		            whenNumberChangedDo: [ :value | 
			            self model ifNotNil: [ :m | m p_severe value ] ];
		            yourself.
	p_dead := self newNumberInput
		          beFloat;
		          whenNumberChangedDo: [ :value | 
			          self model ifNotNil: [ :m | m p_dead value ] ];
		          yourself
]

{ #category : #initialization }
CMIDAIRSEIRDiseaseModelPresenter >> modelChanged [

	super modelChanged.
	self model ifNotNil: [ :m | 
		beta_exposed number: m beta_exposed.
		beta_mild number: m beta_mild.
		beta_severe number: m beta_severe.
		beta_recovering number: m beta_recovering.
		tau_exposed number: m tau_exposed.
		tau_recovering number: m tau_recovering.
		tau_mild number: m tau_mild.
		tau_severe number: m tau_severe.
		tau_recovered number: m tau_recovered.
		p_severe number: m p_severe.
		p_dead number: m p_dead ]
]
