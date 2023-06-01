Class {
	#name : #CMIDAIRVietnamDiseaseModel,
	#superclass : #CMIDAIRDiseaseModel,
	#instVars : [
		'pa',
		'ph',
		'pc',
		'pd',
		'pq',
		'tE',
		'tA',
		'tI',
		'tH',
		'tQ',
		'tC',
		'tR'
	],
	#category : #'Cormas-Model-IDAIR-Disease-Vietnam'
}

{ #category : #defaults }
CMIDAIRVietnamDiseaseModel >> defaultDiseaseDynamicsClass [

	^ CMIDAIRVietnamDiseaseS
]

{ #category : #initialization }
CMIDAIRVietnamDiseaseModel >> initialize [

	super initialize.
	pa := 0.5.
	ph := 0.1.
	pc := 0.05.
	pd := 0.5.
	pq := 0.5.
	tE := 2.0.
	tA := 4.0.
	tI := 12.0.
	tH := 5.0.
	tQ := 5.0.
	tC := 4.25.
	tR := 999.0
]

{ #category : #accessing }
CMIDAIRVietnamDiseaseModel >> pa [

	^ pa
]

{ #category : #accessing }
CMIDAIRVietnamDiseaseModel >> pa: aNumber [

	pa := aNumber
]

{ #category : #accessing }
CMIDAIRVietnamDiseaseModel >> pc [

	^ pc
]

{ #category : #accessing }
CMIDAIRVietnamDiseaseModel >> pc: aNumber [

	pc := aNumber
]

{ #category : #accessing }
CMIDAIRVietnamDiseaseModel >> pd [

	^ pd
]

{ #category : #accessing }
CMIDAIRVietnamDiseaseModel >> pd: aNumber [

	pd := aNumber
]

{ #category : #accessing }
CMIDAIRVietnamDiseaseModel >> ph [

	^ ph
]

{ #category : #accessing }
CMIDAIRVietnamDiseaseModel >> ph: aNumber [

	ph := aNumber
]

{ #category : #accessing }
CMIDAIRVietnamDiseaseModel >> pq [

	^ pq
]

{ #category : #accessing }
CMIDAIRVietnamDiseaseModel >> pq: aNumber [

	pq := aNumber
]

{ #category : #accessing }
CMIDAIRVietnamDiseaseModel >> tA [

	^ tA
]

{ #category : #accessing }
CMIDAIRVietnamDiseaseModel >> tA: aNumber [

	tA := aNumber
]

{ #category : #accessing }
CMIDAIRVietnamDiseaseModel >> tC [

	^ tC
]

{ #category : #accessing }
CMIDAIRVietnamDiseaseModel >> tC: aNumber [

	tC := aNumber
]

{ #category : #accessing }
CMIDAIRVietnamDiseaseModel >> tE [

	^ tE
]

{ #category : #accessing }
CMIDAIRVietnamDiseaseModel >> tE: aNumber [

	tE := aNumber
]

{ #category : #accessing }
CMIDAIRVietnamDiseaseModel >> tH [

	^ tH
]

{ #category : #accessing }
CMIDAIRVietnamDiseaseModel >> tH: aNumber [

	tH := aNumber
]

{ #category : #accessing }
CMIDAIRVietnamDiseaseModel >> tI [

	^ tI
]

{ #category : #accessing }
CMIDAIRVietnamDiseaseModel >> tI: aNumber [

	tI := aNumber
]

{ #category : #accessing }
CMIDAIRVietnamDiseaseModel >> tQ [

	^ tQ
]

{ #category : #accessing }
CMIDAIRVietnamDiseaseModel >> tQ: aNumber [

	tQ := aNumber
]

{ #category : #accessing }
CMIDAIRVietnamDiseaseModel >> tR [

	^ tR
]

{ #category : #accessing }
CMIDAIRVietnamDiseaseModel >> tR: aNumber [

	tR := aNumber
]
