Class {
	#name : #CMIDAIRDiseaseModelPresenter,
	#superclass : #SpPresenterWithModel,
	#instVars : [
		'pAsymptomaticOdm',
		'pPreSymptomaticMildOdm',
		'pHosp',
		'pCrit',
		'pDeath',
		'pICU',
		'tauARec',
		'tauSym',
		'tauRec',
		'tauHosp',
		'tauCrit',
		'tauCritSurv',
		'tauHospRec',
		'tauDeath',
		'pInfection'
	],
	#category : #'Cormas-Model-IDAIR-Disease'
}

{ #category : #specs }
CMIDAIRDiseaseModelPresenter class >> defaultSpec [

	^ SpBoxLayout newVertical
		  add: (SpBoxLayout newHorizontal
				   add: 'Healthy → Susceptible pInfection=' expand: false;
				   add: #pInfection expand: false;
				   yourself)
		  expand: false;
		  add: (SpBoxLayout newHorizontal
				   add: '        → Asymptomatic pAsym=' expand: false;
				   add: #pAsymptomaticOdm expand: false;
				   yourself)
		  expand: false;
		  add: (SpBoxLayout newHorizontal
				   add: '                → Recovered p=1, tauARec=' expand: false;
				   add: #tauARec expand: false;
				   yourself)
		  expand: false;
		  add: (SpBoxLayout newHorizontal
				   add: '        → Pre-symptomatic (mild) pMild=' expand: false;
				   add: #pPreSymptomaticMildOdm expand: false;
				   yourself)
		  expand: false;
		  add: (SpBoxLayout newHorizontal
				   add: '                → Mild symptoms p=1, tauSym=' expand: false;
				   add: #tauSym expand: false;
				   yourself)
		  expand: false;
		  add: (SpBoxLayout newHorizontal
				   add: '                        → Recovered p=1, tauRec=' expand: false;
				   add: #tauRec expand: false;
				   yourself)
		  expand: false;
		  add: (SpBoxLayout newHorizontal
				   add: '        → Pre-symptomatic (severe) p=1-pAsym-pMild'
				   expand: false;
				   yourself)
		  expand: false;
		  add: (SpBoxLayout newHorizontal
				   add: '                → Severe symptoms tauSym' expand: false;
				   yourself)
		  expand: false;
		  add: (SpBoxLayout newHorizontal
				   add: '                        → Hospitalized pHosp=' expand: false;
				   add: #pHosp expand: false;
				   add: ', tauHosp=' expand: false;
				   add: #tauHosp expand: false;
				   yourself)
		  expand: false;
		  add: (SpBoxLayout newHorizontal
				   add: '                                → ICU pCrit=' expand: false;
				   add: #pCrit expand: false;
				   add: ' * pICU=' expand: false;
				   add: #pICU expand: false;
				   add: ', tauCrit=' expand: false;
				   add: #tauCrit expand: false;
				   yourself)
		  expand: false;
		  add: (SpBoxLayout newHorizontal
				   add: '                                        → Death pDeath=' expand: false;
				   add: #pDeath expand: false;
				   add: ', tauDeath=' expand: false;
				   add: #tauDeath expand: false;
				   yourself)
		  expand: false;
		  add: (SpBoxLayout newHorizontal
				   add:
					   '                                        → Hospitalized recovering p=1-pDeath, tauCritSurv='
				   expand: false;
				   add: #tauCritSurv expand: false;
				   yourself)
		  expand: false;
		  add: (SpBoxLayout newHorizontal
				   add: '                                                → Recovered p=1, tauHospRec='
				   expand: false;
				   add: #tauHospRec expand: false;
				   yourself)
		  expand: false;
		  add: (SpBoxLayout newHorizontal
				   add: '                                → Death p=pCrit*(1-pICU), tauCrit'
				   expand: false;
				   yourself)
		  expand: false;
		  add: (SpBoxLayout newHorizontal
				   add: '                                → Recovered p=1-pCrit, tauRec' expand: false;
				   yourself)
		  expand: false;
		  yourself
]

{ #category : #initialization }
CMIDAIRDiseaseModelPresenter >> initializePresenters [

	super initializePresenters.
	pAsymptomaticOdm := self newNumberInput
		                    beFloat;
		                    whenNumberChangedDo: [ :value | 
			                    self model ifNotNil: [ :m | 
					                    m pAsymptomaticOdm: value ] ];
		                    yourself.
	pPreSymptomaticMildOdm := self newNumberInput
		                          beFloat;
		                          whenNumberChangedDo: [ :value | 
			                          self model ifNotNil: [ :m | 
					                          m pPreSymptomaticMildOdm: value ] ];
		                          yourself.
	pHosp := self newNumberInput
		         beFloat;
		         whenNumberChangedDo: [ :value | 
			         self model ifNotNil: [ :m | m pHosp: value ] ];
		         yourself.
	pCrit := self newNumberInput
		         beFloat;
		         whenNumberChangedDo: [ :value | 
			         self model ifNotNil: [ :m | m pCrit: value ] ];
		         yourself.
	pDeath := self newNumberInput
		          beFloat;
		          whenNumberChangedDo: [ :value | 
			          self model ifNotNil: [ :m | m pDeath: value ] ];
		          yourself.
	pICU := self newNumberInput
		        beFloat;
		        whenNumberChangedDo: [ :value | 
			        self model ifNotNil: [ :m | m pICU: value ] ];
		        yourself.
	tauARec := self newNumberInput
		           beFloat;
		           whenNumberChangedDo: [ :value | 
			           self model ifNotNil: [ :m | m tauARec: value ] ];
		           yourself.
	tauSym := self newNumberInput
		          beFloat;
		          whenNumberChangedDo: [ :value | 
			          self model ifNotNil: [ :m | m tauSym: value ] ];
		          yourself.
	tauRec := self newNumberInput
		          beFloat;
		          whenNumberChangedDo: [ :value | 
			          self model ifNotNil: [ :m | m tauRec: value ] ];
		          yourself.
	tauHosp := self newNumberInput
		           beFloat;
		           whenNumberChangedDo: [ :value | 
			           self model ifNotNil: [ :m | m tauHosp: value ] ];
		           yourself.
	tauCrit := self newNumberInput
		           beFloat;
		           whenNumberChangedDo: [ :value | 
			           self model ifNotNil: [ :m | m tauCrit: value ] ];
		           yourself.
	tauCritSurv := self newNumberInput
		               beFloat;
		               whenNumberChangedDo: [ :value | 
			               self model ifNotNil: [ :m | m tauCritSurv: value ] ];
		               yourself.
	tauHospRec := self newNumberInput
		              beFloat;
		              whenNumberChangedDo: [ :value | 
			              self model ifNotNil: [ :m | m tauHospRec: value ] ];
		              yourself.
	tauDeath := self newNumberInput
		            beFloat;
		            whenNumberChangedDo: [ :value | 
			            self model ifNotNil: [ :m | m tauDeath: value ] ];
		            yourself.
	pInfection := self newNumberInput
		              beFloat;
		              whenNumberChangedDo: [ :value | 
			              self model ifNotNil: [ :m | m pInfection: value ] ];
		              yourself
]

{ #category : #initialization }
CMIDAIRDiseaseModelPresenter >> initializeWindow: aSpWindowPresenter [

	super initializeWindow: aSpWindowPresenter.
	aSpWindowPresenter initialExtent: 600 @ 400
]

{ #category : #updating }
CMIDAIRDiseaseModelPresenter >> modelChanged [

	super modelChanged.
	self model ifNotNil: [ :m | 
		pAsymptomaticOdm number: m pAsymptomaticOdm.
		pPreSymptomaticMildOdm number: m pPreSymptomaticMildOdm.
		pHosp number: m pHosp.
		pCrit number: m pCrit.
		pDeath number: m pDeath.
		pICU number: m pICU.
		tauARec number: m tauARec.
		tauSym number: m tauSym.
		tauRec number: m tauRec.
		tauHosp number: m tauHosp.
		tauCrit number: m tauCrit.
		tauCritSurv number: m tauCritSurv.
		tauHospRec number: m tauHospRec.
		tauDeath number: m tauDeath.
		pInfection number: m pInfection ]
]

{ #category : #accessing }
CMIDAIRDiseaseModelPresenter >> title [
	^ 'Disease model parameters'
]
