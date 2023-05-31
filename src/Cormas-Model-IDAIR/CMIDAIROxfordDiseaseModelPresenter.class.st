Class {
	#name : #CMIDAIROxfordDiseaseModelPresenter,
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
		'pInfection',
		'healthyColor',
		'asymptomaticColor',
		'preSymptomaticMildColor',
		'preSymptomaticSevereColor',
		'hospitalizedColor',
		'hospitalizedRecoveringColor',
		'symptomsSevereColor',
		'deadColor',
		'icuedColor',
		'symptomsMildColor'
	],
	#category : #'Cormas-Model-IDAIR-Disease-Oxford'
}

{ #category : #specs }
CMIDAIROxfordDiseaseModelPresenter class >> defaultSpec [

	^ SpBoxLayout newVertical
		  add: (SpBoxLayout newHorizontal
				   vAlignCenter;
				   add: 'Healthy' expand: false;
				   add: #healthyColor width: 24;
				   add: '→ Susceptible pInfection=' expand: false;
				   add: #pInfection expand: false;
				   yourself)
		  expand: false;
		  add: (SpBoxLayout newHorizontal
				   vAlignCenter;
				   add: '        → Asymptomatic' expand: false;
				   add: #asymptomaticColor width: 24;
				   add: 'pAsym=' expand: false;
				   add: #pAsymptomaticOdm expand: false;
				   yourself)
		  expand: false;
		  add: (SpBoxLayout newHorizontal
				   vAlignCenter;
				   add: '                → Recovered p=1, tauARec=' expand: false;
				   add: #tauARec expand: false;
				   yourself)
		  expand: false;
		  add: (SpBoxLayout newHorizontal
				   vAlignCenter;
				   add: '        → Pre-symptomatic (mild)' expand: false;
				   add: #preSymptomaticMildColor width: 24;
				   add: 'pMild=' expand: false;
				   add: #pPreSymptomaticMildOdm expand: false;
				   yourself)
		  expand: false;
		  add: (SpBoxLayout newHorizontal
				   vAlignCenter;
				   add: '                → Mild symptoms' expand: false;
				   add: #symptomsMildColor width: 24;
				   add: 'p=1, tauSym=' expand: false;
				   add: #tauSym expand: false;
				   yourself)
		  expand: false;
		  add: (SpBoxLayout newHorizontal
				   vAlignCenter;
				   add: '                        → Recovered p=1, tauRec='
				   expand: false;
				   add: #tauRec expand: false;
				   yourself)
		  expand: false;
		  add: (SpBoxLayout newHorizontal
				   vAlignCenter;
				   add: '        → Pre-symptomatic (severe)' expand: false;
				   add: #preSymptomaticSevereColor width: 24;
				   add: 'p=1-pAsym-pMild' expand: false;
				   yourself)
		  expand: false;
		  add: (SpBoxLayout newHorizontal
				   vAlignCenter;
				   add: '                → Severe symptoms' expand: false;
				   add: #symptomsSevereColor width: 24;
				   add: 'tauSym' expand: false;
				   yourself)
		  expand: false;
		  add: (SpBoxLayout newHorizontal
				   vAlignCenter;
				   add: '                        → Hospitalized' expand: false;
				   add: #hospitalizedColor width: 24;
				   add: 'pHosp=' expand: false;
				   add: #pHosp expand: false;
				   add: ', tauHosp=' expand: false;
				   add: #tauHosp expand: false;
				   yourself)
		  expand: false;
		  add: (SpBoxLayout newHorizontal
				   vAlignCenter;
				   add: '                                → ICU' expand: false;
				   add: #icuedColor width: 24;
				   add: 'pCrit=' expand: false;
				   add: #pCrit expand: false;
				   add: ' * pICU=' expand: false;
				   add: #pICU expand: false;
				   add: ', tauCrit=' expand: false;
				   add: #tauCrit expand: false;
				   yourself)
		  expand: false;
		  add: (SpBoxLayout newHorizontal
				   vAlignCenter;
				   add: '                                        → Death'
				   expand: false;
				   add: #deadColor width: 24;
				   add: 'pDeath=' expand: false;
				   add: #pDeath expand: false;
				   add: ', tauDeath=' expand: false;
				   add: #tauDeath expand: false;
				   yourself)
		  expand: false;
		  add: (SpBoxLayout newHorizontal
				   vAlignCenter;
				   add:
					   '                                        → Hospitalized recovering'
				   expand: false;
				   add: #hospitalizedRecoveringColor width: 24;
				   add: 'p=1-pDeath, tauCritSurv=' expand: false;
				   add: #tauCritSurv expand: false;
				   yourself)
		  expand: false;
		  add: (SpBoxLayout newHorizontal
				   vAlignCenter;
				   add:
					   '                                                → Recovered p=1, tauHospRec='
				   expand: false;
				   add: #tauHospRec expand: false;
				   yourself)
		  expand: false;
		  add: (SpBoxLayout newHorizontal
				   vAlignCenter;
				   add:
					   '                                → Death p=pCrit*(1-pICU), tauCrit'
				   expand: false;
				   yourself)
		  expand: false;
		  add: (SpBoxLayout newHorizontal
				   vAlignCenter;
				   add:
					   '                                → Recovered p=1-pCrit, tauRec'
				   expand: false;
				   yourself)
		  expand: false;
		  yourself
]

{ #category : #accessing }
CMIDAIROxfordDiseaseModelPresenter >> iconFor: aColor [

	| e form |
	e := 8 @ 8.
	form := Form extent: e depth: 32.
	form getCanvas
		fillColor: Color transparent;
		fillOval: (0 @ 0 extent: e)
		color: aColor
		borderWidth: 1
		borderColor: Color black;
		flush.
	^ form
]

{ #category : #initialization }
CMIDAIROxfordDiseaseModelPresenter >> initializePresenters [

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
		              yourself.
	healthyColor := self newColorDropList whenSelectedItemChangedDo: [ 
		                :color | 
		                self model ifNotNil: [ :m | m healthyColor: color ] ].
	asymptomaticColor := self newColorDropList 
		                     whenSelectedItemChangedDo: [ :color | 
		                     self model ifNotNil: [ :m | 
			                     m asymptomaticColor: color ] ].
	preSymptomaticMildColor := self newColorDropList 
		                           whenSelectedItemChangedDo: [ :color | 
			                           self model ifNotNil: [ :m | 
				                           m preSymptomaticMildColor: color ] ].
	preSymptomaticSevereColor := self newColorDropList 
		                             whenSelectedItemChangedDo: [ :color | 
			                             self model ifNotNil: [ :m | 
				                             m preSymptomaticSevereColor: color ] ].
	hospitalizedColor := self newColorDropList 
		                     whenSelectedItemChangedDo: [ :color | 
		                     self model ifNotNil: [ :m | 
			                     m hospitalizedColor: color ] ].
	hospitalizedRecoveringColor := self newColorDropList 
		                               whenSelectedItemChangedDo: [ :color | 
			                               self model ifNotNil: [ :m | 
				                               m hospitalizedRecoveringColor:
					                               color ] ].
	symptomsSevereColor := self newColorDropList 
		                       whenSelectedItemChangedDo: [ :color | 
		                       self model ifNotNil: [ :m | 
			                       m symptomsSevereColor: color ] ].
	deadColor := self newColorDropList whenSelectedItemChangedDo: [ 
		             :color | 
		             self model ifNotNil: [ :m | m deadColor: color ] ].
	icuedColor := self newColorDropList whenSelectedItemChangedDo: [ 
		              :color | 
		              self model ifNotNil: [ :m | m icuedColor: color ] ].
	symptomsMildColor := self newColorDropList 
		                     whenSelectedItemChangedDo: [ :color | 
		                     self model ifNotNil: [ :m | 
			                     m symptomsMildColor: color ] ]
]

{ #category : #initialization }
CMIDAIROxfordDiseaseModelPresenter >> initializeWindow: aSpWindowPresenter [

	super initializeWindow: aSpWindowPresenter.
	aSpWindowPresenter initialExtent: 600 @ 400
]

{ #category : #updating }
CMIDAIROxfordDiseaseModelPresenter >> modelChanged [

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
		pInfection number: m pInfection.
		healthyColor selectItem: m healthyColor.
		asymptomaticColor selectItem: m asymptomaticColor.
		preSymptomaticMildColor selectItem: m preSymptomaticMildColor.
		preSymptomaticSevereColor selectItem: m preSymptomaticSevereColor.
		hospitalizedColor selectItem: m hospitalizedColor.
		hospitalizedRecoveringColor selectItem:
			m hospitalizedRecoveringColor.
		symptomsSevereColor selectItem: m symptomsSevereColor.
		deadColor selectItem: m deadColor.
		icuedColor selectItem: m icuedColor.
		symptomsMildColor selectItem: m symptomsMildColor ]
]

{ #category : #'instance creation' }
CMIDAIROxfordDiseaseModelPresenter >> newColorDropList [

	^ self newDropList
		  display: [ :color | ' ' ];
		  iconBlock: [ :color | self iconFor: color ];
		  items: { 
				  Color black.
				  Color darkGray.
				  Color gray.
				  Color lightGray.
				  Color white.
				  Color green muchDarker.
				  Color green darker.
				  Color green.
				  Color green lighter.
				  Color green muchLighter.
				  Color blue muchDarker.
				  Color blue darker.
				  Color blue.
				  Color blue lighter.
				  Color blue muchLighter.
				  Color yellow muchDarker.
				  Color yellow darker.
				  Color yellow.
				  Color yellow lighter.
				  Color yellow muchLighter.
				  Color red muchDarker.
				  Color red darker.
				  Color red.
				  Color red lighter.
				  Color red muchLighter.
				  Color magenta muchDarker.
				  Color magenta darker.
				  Color magenta.
				  Color magenta lighter.
				  Color magenta muchLighter };
		  selectIndex: 1;
		  yourself
]

{ #category : #accessing }
CMIDAIROxfordDiseaseModelPresenter >> title [
	^ 'Disease model parameters'
]
