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
		'pFalseNegative'
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

{ #category : #initialization }
CMIDAIRDiseaseModel >> initialize [

	super initialize.
	pAsymptomaticOdm := 0.5.
	pPreSymptomaticMildOdm := 0.3.
	pHosp := 0.1.
	pCrit := 0.95.
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
	pFalseNegative := 0.0
]

{ #category : #accessing }
CMIDAIRDiseaseModel >> name [

	^ #disease
]

{ #category : #accessing }
CMIDAIRDiseaseModel >> pAsymptomaticOdm [

	^ pAsymptomaticOdm
]

{ #category : #accessing }
CMIDAIRDiseaseModel >> pAsymptomaticOdm: aNumber [

	pAsymptomaticOdm := aNumber
]

{ #category : #accessing }
CMIDAIRDiseaseModel >> pCrit [

	^ pCrit
]

{ #category : #accessing }
CMIDAIRDiseaseModel >> pCrit: aNumber [

	pCrit := aNumber
]

{ #category : #accessing }
CMIDAIRDiseaseModel >> pDeath [

	^ pDeath
]

{ #category : #accessing }
CMIDAIRDiseaseModel >> pDeath: aNumber [

	pDeath := aNumber
]

{ #category : #accessing }
CMIDAIRDiseaseModel >> pFalseNegative [

	^ pFalseNegative
]

{ #category : #accessing }
CMIDAIRDiseaseModel >> pFalseNegative: aNumber [

	pFalseNegative := aNumber
]

{ #category : #accessing }
CMIDAIRDiseaseModel >> pHosp [

	^ pHosp
]

{ #category : #accessing }
CMIDAIRDiseaseModel >> pHosp: aNumber [

	pHosp := aNumber
]

{ #category : #accessing }
CMIDAIRDiseaseModel >> pICU [

	^ pICU
]

{ #category : #accessing }
CMIDAIRDiseaseModel >> pICU: aNumber [

	pICU := aNumber
]

{ #category : #accessing }
CMIDAIRDiseaseModel >> pInfection [

	^ pInfection
]

{ #category : #accessing }
CMIDAIRDiseaseModel >> pInfection: aNumber [

	pInfection := aNumber
]

{ #category : #accessing }
CMIDAIRDiseaseModel >> pPreSymptomaticMildOdm [

	^ pPreSymptomaticMildOdm
]

{ #category : #accessing }
CMIDAIRDiseaseModel >> pPreSymptomaticMildOdm: aNumber [

	pPreSymptomaticMildOdm := aNumber
]

{ #category : #accessing }
CMIDAIRDiseaseModel >> tauARec [

	^ tauARec
]

{ #category : #accessing }
CMIDAIRDiseaseModel >> tauARec: aNumber [

	tauARec := aNumber
]

{ #category : #accessing }
CMIDAIRDiseaseModel >> tauCrit [

	^ tauCrit
]

{ #category : #accessing }
CMIDAIRDiseaseModel >> tauCrit: aNumber [

	tauCrit := aNumber
]

{ #category : #accessing }
CMIDAIRDiseaseModel >> tauCritSurv [

	^ tauCritSurv
]

{ #category : #accessing }
CMIDAIRDiseaseModel >> tauCritSurv: aNumber [

	tauCritSurv := aNumber
]

{ #category : #accessing }
CMIDAIRDiseaseModel >> tauDeath [

	^ tauDeath
]

{ #category : #accessing }
CMIDAIRDiseaseModel >> tauDeath: aNumber [

	tauDeath := aNumber
]

{ #category : #accessing }
CMIDAIRDiseaseModel >> tauHosp [

	^ tauHosp
]

{ #category : #accessing }
CMIDAIRDiseaseModel >> tauHosp: aNumber [

	tauHosp := aNumber
]

{ #category : #accessing }
CMIDAIRDiseaseModel >> tauHospRec [

	^ tauHospRec
]

{ #category : #accessing }
CMIDAIRDiseaseModel >> tauHospRec: aNumber [

	tauHospRec := aNumber
]

{ #category : #accessing }
CMIDAIRDiseaseModel >> tauRec [

	^ tauRec
]

{ #category : #accessing }
CMIDAIRDiseaseModel >> tauRec: aNumber [

	tauRec := aNumber
]

{ #category : #accessing }
CMIDAIRDiseaseModel >> tauSym [

	^ tauSym
]

{ #category : #accessing }
CMIDAIRDiseaseModel >> tauSym: aNumber [

	tauSym := aNumber
]
