Class {
	#name : #CMIDAIRDiseaseModel,
	#superclass : #CMIDAIRSubmodel,
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
		'pFalseNegative',
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
	#category : #'Cormas-Model-IDAIR-Disease'
}

{ #category : #'instance creation' }
CMIDAIRDiseaseModel class >> on: aCMIDAIRModel [

	^ self new
		  cormasModel: aCMIDAIRModel;
		  yourself
]

{ #category : #converting }
CMIDAIRDiseaseModel >> asPresenter [

	^ CMIDAIRDiseaseModelPresenter on: self
]

{ #category : #'accessing-colors' }
CMIDAIRDiseaseModel >> asymptomaticColor [

	^ asymptomaticColor
]

{ #category : #'accessing-colors' }
CMIDAIRDiseaseModel >> asymptomaticColor: aColor [

	asymptomaticColor := aColor
]

{ #category : #accessing }
CMIDAIRDiseaseModel >> deadColor [

	^ deadColor
]

{ #category : #accessing }
CMIDAIRDiseaseModel >> deadColor: aColor [

	deadColor := aColor
]

{ #category : #'accessing-colors' }
CMIDAIRDiseaseModel >> healthyColor [

	^ healthyColor
]

{ #category : #'accessing-colors' }
CMIDAIRDiseaseModel >> healthyColor: aColor [

	healthyColor := aColor
]

{ #category : #'accessing-colors' }
CMIDAIRDiseaseModel >> hospitalizedColor [

	^ hospitalizedColor
]

{ #category : #'accessing-colors' }
CMIDAIRDiseaseModel >> hospitalizedColor: aColor [

	hospitalizedColor := aColor
]

{ #category : #'accessing-colors' }
CMIDAIRDiseaseModel >> hospitalizedRecoveringColor [

	^ hospitalizedRecoveringColor
]

{ #category : #'accessing-colors' }
CMIDAIRDiseaseModel >> hospitalizedRecoveringColor: aColor [

	hospitalizedRecoveringColor := aColor
]

{ #category : #'accessing-colors' }
CMIDAIRDiseaseModel >> icuedColor [

	^ icuedColor
]

{ #category : #'accessing-colors' }
CMIDAIRDiseaseModel >> icuedColor: anObject [

	icuedColor := anObject
]

{ #category : #initialization }
CMIDAIRDiseaseModel >> initialize [

	super initialize.
	pAsymptomaticOdm := 0.5.
	pPreSymptomaticMildOdm := 0.3.
	pHosp := 0.1.
	pCrit := 0.05.
	pDeath := 0.5.
	pICU := 0.1.
	tauARec := 15.0.
	tauSym := 6.0.
	tauRec := 12.0.
	tauHosp := 5.0.
	tauCrit := 4.25.
	tauCritSurv := 6.0.
	tauHospRec := 3.25.
	tauDeath := 3.0.
	pInfection := 0.3.
	pFalseNegative := 0.0	.
	deadColor := Color black.
	healthyColor :=  Color green muchLighter.
	asymptomaticColor := Color blue muchLighter.
	preSymptomaticMildColor := Color yellow lighter.
	preSymptomaticSevereColor := Color red muchLighter.
	hospitalizedColor := Color gray.
	hospitalizedRecoveringColor := Color gray.	
	icuedColor := Color black.
	symptomsMildColor := Color yellow darker.
	symptomsSevereColor := Color red darker
	
	
]

{ #category : #accessing }
CMIDAIRDiseaseModel >> name [

	^ #disease
]

{ #category : #'accessing-parameters' }
CMIDAIRDiseaseModel >> pAsymptomaticOdm [

	^ pAsymptomaticOdm
]

{ #category : #'accessing-parameters' }
CMIDAIRDiseaseModel >> pAsymptomaticOdm: aNumber [

	pAsymptomaticOdm := aNumber
]

{ #category : #'accessing-parameters' }
CMIDAIRDiseaseModel >> pCrit [

	^ pCrit
]

{ #category : #'accessing-parameters' }
CMIDAIRDiseaseModel >> pCrit: aNumber [

	pCrit := aNumber
]

{ #category : #'accessing-parameters' }
CMIDAIRDiseaseModel >> pDeath [

	^ pDeath
]

{ #category : #'accessing-parameters' }
CMIDAIRDiseaseModel >> pDeath: aNumber [

	pDeath := aNumber
]

{ #category : #'accessing-parameters' }
CMIDAIRDiseaseModel >> pFalseNegative [

	^ pFalseNegative
]

{ #category : #'accessing-parameters' }
CMIDAIRDiseaseModel >> pFalseNegative: aNumber [

	pFalseNegative := aNumber
]

{ #category : #'accessing-parameters' }
CMIDAIRDiseaseModel >> pHosp [

	^ pHosp
]

{ #category : #'accessing-parameters' }
CMIDAIRDiseaseModel >> pHosp: aNumber [

	pHosp := aNumber
]

{ #category : #'accessing-parameters' }
CMIDAIRDiseaseModel >> pICU [

	^ pICU
]

{ #category : #'accessing-parameters' }
CMIDAIRDiseaseModel >> pICU: aNumber [

	pICU := aNumber
]

{ #category : #'accessing-parameters' }
CMIDAIRDiseaseModel >> pInfection [

	^ pInfection
]

{ #category : #'accessing-parameters' }
CMIDAIRDiseaseModel >> pInfection: aNumber [

	pInfection := aNumber
]

{ #category : #'accessing-parameters' }
CMIDAIRDiseaseModel >> pPreSymptomaticMildOdm [

	^ pPreSymptomaticMildOdm
]

{ #category : #'accessing-parameters' }
CMIDAIRDiseaseModel >> pPreSymptomaticMildOdm: aNumber [

	pPreSymptomaticMildOdm := aNumber
]

{ #category : #'accessing-colors' }
CMIDAIRDiseaseModel >> preSymptomaticMildColor [

	^ preSymptomaticMildColor
]

{ #category : #'accessing-colors' }
CMIDAIRDiseaseModel >> preSymptomaticMildColor: aColor [

	preSymptomaticMildColor := aColor
]

{ #category : #'accessing-colors' }
CMIDAIRDiseaseModel >> preSymptomaticSevereColor [

	^ preSymptomaticSevereColor
]

{ #category : #'accessing-colors' }
CMIDAIRDiseaseModel >> preSymptomaticSevereColor: aColor [

	preSymptomaticSevereColor := aColor
]

{ #category : #'accessing-colors' }
CMIDAIRDiseaseModel >> symptomsMildColor [

	^ symptomsMildColor
]

{ #category : #'accessing-colors' }
CMIDAIRDiseaseModel >> symptomsMildColor: aColor [

	symptomsMildColor := aColor
]

{ #category : #'accessing-colors' }
CMIDAIRDiseaseModel >> symptomsSevereColor [

	^ symptomsSevereColor
]

{ #category : #'accessing-colors' }
CMIDAIRDiseaseModel >> symptomsSevereColor: aColor [

	symptomsSevereColor := aColor
]

{ #category : #'accessing-parameters' }
CMIDAIRDiseaseModel >> tauARec [

	^ tauARec
]

{ #category : #'accessing-parameters' }
CMIDAIRDiseaseModel >> tauARec: aNumber [

	tauARec := aNumber
]

{ #category : #'accessing-parameters' }
CMIDAIRDiseaseModel >> tauCrit [

	^ tauCrit
]

{ #category : #'accessing-parameters' }
CMIDAIRDiseaseModel >> tauCrit: aNumber [

	tauCrit := aNumber
]

{ #category : #'accessing-parameters' }
CMIDAIRDiseaseModel >> tauCritSurv [

	^ tauCritSurv
]

{ #category : #'accessing-parameters' }
CMIDAIRDiseaseModel >> tauCritSurv: aNumber [

	tauCritSurv := aNumber
]

{ #category : #'accessing-parameters' }
CMIDAIRDiseaseModel >> tauDeath [

	^ tauDeath
]

{ #category : #'accessing-parameters' }
CMIDAIRDiseaseModel >> tauDeath: aNumber [

	tauDeath := aNumber
]

{ #category : #'accessing-parameters' }
CMIDAIRDiseaseModel >> tauHosp [

	^ tauHosp
]

{ #category : #'accessing-parameters' }
CMIDAIRDiseaseModel >> tauHosp: aNumber [

	tauHosp := aNumber
]

{ #category : #'accessing-parameters' }
CMIDAIRDiseaseModel >> tauHospRec [

	^ tauHospRec
]

{ #category : #'accessing-parameters' }
CMIDAIRDiseaseModel >> tauHospRec: aNumber [

	tauHospRec := aNumber
]

{ #category : #'accessing-parameters' }
CMIDAIRDiseaseModel >> tauRec [

	^ tauRec
]

{ #category : #'accessing-parameters' }
CMIDAIRDiseaseModel >> tauRec: aNumber [

	tauRec := aNumber
]

{ #category : #'accessing-parameters' }
CMIDAIRDiseaseModel >> tauSym [

	^ tauSym
]

{ #category : #'accessing-parameters' }
CMIDAIRDiseaseModel >> tauSym: aNumber [

	tauSym := aNumber
]
