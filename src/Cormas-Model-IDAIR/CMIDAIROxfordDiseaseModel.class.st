Class {
	#name : #CMIDAIROxfordDiseaseModel,
	#superclass : #CMIDAIRDiseaseModel,
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
	#category : #'Cormas-Model-IDAIR-Disease-Oxford'
}

{ #category : #converting }
CMIDAIROxfordDiseaseModel >> asPresenter [

	^ CMIDAIROxfordDiseaseModelPresenter on: self
]

{ #category : #'accessing-colors' }
CMIDAIROxfordDiseaseModel >> asymptomaticColor [

	^ asymptomaticColor
]

{ #category : #'accessing-colors' }
CMIDAIROxfordDiseaseModel >> asymptomaticColor: aColor [

	asymptomaticColor := aColor
]

{ #category : #'accessing-colors' }
CMIDAIROxfordDiseaseModel >> deadColor [

	^ deadColor
]

{ #category : #'accessing-colors' }
CMIDAIROxfordDiseaseModel >> deadColor: aColor [

	deadColor := aColor
]

{ #category : #accessing }
CMIDAIROxfordDiseaseModel >> defaultDiseaseDynamicsClass [

	^ CMIDAIROxfordSusceptive
]

{ #category : #'accessing-colors' }
CMIDAIROxfordDiseaseModel >> healthyColor [

	^ healthyColor
]

{ #category : #'accessing-colors' }
CMIDAIROxfordDiseaseModel >> healthyColor: aColor [

	healthyColor := aColor
]

{ #category : #'accessing-colors' }
CMIDAIROxfordDiseaseModel >> hospitalizedColor [

	^ hospitalizedColor
]

{ #category : #'accessing-colors' }
CMIDAIROxfordDiseaseModel >> hospitalizedColor: aColor [

	hospitalizedColor := aColor
]

{ #category : #'accessing-colors' }
CMIDAIROxfordDiseaseModel >> hospitalizedRecoveringColor [

	^ hospitalizedRecoveringColor
]

{ #category : #'accessing-colors' }
CMIDAIROxfordDiseaseModel >> hospitalizedRecoveringColor: aColor [

	hospitalizedRecoveringColor := aColor
]

{ #category : #'accessing-colors' }
CMIDAIROxfordDiseaseModel >> icuedColor [

	^ icuedColor
]

{ #category : #'accessing-colors' }
CMIDAIROxfordDiseaseModel >> icuedColor: anObject [

	icuedColor := anObject
]

{ #category : #initialization }
CMIDAIROxfordDiseaseModel >> initialize [

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

{ #category : #'user interfaces' }
CMIDAIROxfordDiseaseModel >> openGUI [

	^ self asPresenter openWithSpec
]

{ #category : #'accessing-parameters' }
CMIDAIROxfordDiseaseModel >> pAsymptomaticOdm [

	^ pAsymptomaticOdm
]

{ #category : #'accessing-parameters' }
CMIDAIROxfordDiseaseModel >> pAsymptomaticOdm: aNumber [

	pAsymptomaticOdm := aNumber
]

{ #category : #'accessing-parameters' }
CMIDAIROxfordDiseaseModel >> pCrit [

	^ pCrit
]

{ #category : #'accessing-parameters' }
CMIDAIROxfordDiseaseModel >> pCrit: aNumber [

	pCrit := aNumber
]

{ #category : #'accessing-parameters' }
CMIDAIROxfordDiseaseModel >> pDeath [

	^ pDeath
]

{ #category : #'accessing-parameters' }
CMIDAIROxfordDiseaseModel >> pDeath: aNumber [

	pDeath := aNumber
]

{ #category : #'accessing-parameters' }
CMIDAIROxfordDiseaseModel >> pFalseNegative [

	^ pFalseNegative
]

{ #category : #'accessing-parameters' }
CMIDAIROxfordDiseaseModel >> pFalseNegative: aNumber [

	pFalseNegative := aNumber
]

{ #category : #'accessing-parameters' }
CMIDAIROxfordDiseaseModel >> pHosp [

	^ pHosp
]

{ #category : #'accessing-parameters' }
CMIDAIROxfordDiseaseModel >> pHosp: aNumber [

	pHosp := aNumber
]

{ #category : #'accessing-parameters' }
CMIDAIROxfordDiseaseModel >> pICU [

	^ pICU
]

{ #category : #'accessing-parameters' }
CMIDAIROxfordDiseaseModel >> pICU: aNumber [

	pICU := aNumber
]

{ #category : #'accessing-parameters' }
CMIDAIROxfordDiseaseModel >> pInfection [

	^ pInfection
]

{ #category : #'accessing-parameters' }
CMIDAIROxfordDiseaseModel >> pInfection: aNumber [

	pInfection := aNumber
]

{ #category : #'accessing-parameters' }
CMIDAIROxfordDiseaseModel >> pPreSymptomaticMildOdm [

	^ pPreSymptomaticMildOdm
]

{ #category : #'accessing-parameters' }
CMIDAIROxfordDiseaseModel >> pPreSymptomaticMildOdm: aNumber [

	pPreSymptomaticMildOdm := aNumber
]

{ #category : #'accessing-colors' }
CMIDAIROxfordDiseaseModel >> preSymptomaticMildColor [

	^ preSymptomaticMildColor
]

{ #category : #'accessing-colors' }
CMIDAIROxfordDiseaseModel >> preSymptomaticMildColor: aColor [

	preSymptomaticMildColor := aColor
]

{ #category : #'accessing-colors' }
CMIDAIROxfordDiseaseModel >> preSymptomaticSevereColor [

	^ preSymptomaticSevereColor
]

{ #category : #'accessing-colors' }
CMIDAIROxfordDiseaseModel >> preSymptomaticSevereColor: aColor [

	preSymptomaticSevereColor := aColor
]

{ #category : #'accessing-colors' }
CMIDAIROxfordDiseaseModel >> symptomsMildColor [

	^ symptomsMildColor
]

{ #category : #'accessing-colors' }
CMIDAIROxfordDiseaseModel >> symptomsMildColor: aColor [

	symptomsMildColor := aColor
]

{ #category : #'accessing-colors' }
CMIDAIROxfordDiseaseModel >> symptomsSevereColor [

	^ symptomsSevereColor
]

{ #category : #'accessing-colors' }
CMIDAIROxfordDiseaseModel >> symptomsSevereColor: aColor [

	symptomsSevereColor := aColor
]

{ #category : #'accessing-parameters' }
CMIDAIROxfordDiseaseModel >> tauARec [

	^ tauARec
]

{ #category : #'accessing-parameters' }
CMIDAIROxfordDiseaseModel >> tauARec: aNumber [

	tauARec := aNumber
]

{ #category : #'accessing-parameters' }
CMIDAIROxfordDiseaseModel >> tauCrit [

	^ tauCrit
]

{ #category : #'accessing-parameters' }
CMIDAIROxfordDiseaseModel >> tauCrit: aNumber [

	tauCrit := aNumber
]

{ #category : #'accessing-parameters' }
CMIDAIROxfordDiseaseModel >> tauCritSurv [

	^ tauCritSurv
]

{ #category : #'accessing-parameters' }
CMIDAIROxfordDiseaseModel >> tauCritSurv: aNumber [

	tauCritSurv := aNumber
]

{ #category : #'accessing-parameters' }
CMIDAIROxfordDiseaseModel >> tauDeath [

	^ tauDeath
]

{ #category : #'accessing-parameters' }
CMIDAIROxfordDiseaseModel >> tauDeath: aNumber [

	tauDeath := aNumber
]

{ #category : #'accessing-parameters' }
CMIDAIROxfordDiseaseModel >> tauHosp [

	^ tauHosp
]

{ #category : #'accessing-parameters' }
CMIDAIROxfordDiseaseModel >> tauHosp: aNumber [

	tauHosp := aNumber
]

{ #category : #'accessing-parameters' }
CMIDAIROxfordDiseaseModel >> tauHospRec [

	^ tauHospRec
]

{ #category : #'accessing-parameters' }
CMIDAIROxfordDiseaseModel >> tauHospRec: aNumber [

	tauHospRec := aNumber
]

{ #category : #'accessing-parameters' }
CMIDAIROxfordDiseaseModel >> tauRec [

	^ tauRec
]

{ #category : #'accessing-parameters' }
CMIDAIROxfordDiseaseModel >> tauRec: aNumber [

	tauRec := aNumber
]

{ #category : #'accessing-parameters' }
CMIDAIROxfordDiseaseModel >> tauSym [

	^ tauSym
]

{ #category : #'accessing-parameters' }
CMIDAIROxfordDiseaseModel >> tauSym: aNumber [

	tauSym := aNumber
]
