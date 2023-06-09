Class {
	#name : #CMIDAIRVietnamDiseaseModel,
	#superclass : #CMIDAIRDiseaseModel,
	#instVars : [
		'pa',
		'ph',
		'pc',
		'pd',
		'pq',
		'tEa',
		'tEm',
		'tEh',
		'tEc',
		'tEd',
		'tAa',
		'tAm',
		'tAh',
		'tAc',
		'tAd',
		'tIm',
		'tIq',
		'tIh',
		'tIc',
		'tId',
		'tHh',
		'tHc',
		'tHd',
		'tQ',
		'tCc',
		'tCd',
		'tR',
		'bAa',
		'bAm',
		'bAh',
		'bAc',
		'bAd',
		'bIm',
		'bIq',
		'bIh',
		'bIc',
		'bId'
	],
	#category : #'Cormas-Model-IDAIR-Disease-Vietnam'
}

{ #category : #accessing }
CMIDAIRVietnamDiseaseModel class >> submodelName [

	^ 'Vietnam'
]

{ #category : #converting }
CMIDAIRVietnamDiseaseModel >> asPresenter [

	^ CMIDAIRVietnamDiseaseModelPresenter on: self
]

{ #category : #accessing }
CMIDAIRVietnamDiseaseModel >> bAa [

	^ bAa
]

{ #category : #accessing }
CMIDAIRVietnamDiseaseModel >> bAa: aNumber [

	bAa := aNumber
]

{ #category : #accessing }
CMIDAIRVietnamDiseaseModel >> bAc [

	^ bAc
]

{ #category : #accessing }
CMIDAIRVietnamDiseaseModel >> bAc: aNumber [

	bAc := aNumber
]

{ #category : #accessing }
CMIDAIRVietnamDiseaseModel >> bAd [

	^ bAd
]

{ #category : #accessing }
CMIDAIRVietnamDiseaseModel >> bAd: aNumber [

	bAd := aNumber
]

{ #category : #accessing }
CMIDAIRVietnamDiseaseModel >> bAh [

	^ bAh
]

{ #category : #accessing }
CMIDAIRVietnamDiseaseModel >> bAh: aNumber [

	bAh := aNumber
]

{ #category : #accessing }
CMIDAIRVietnamDiseaseModel >> bAm [

	^ bAm
]

{ #category : #accessing }
CMIDAIRVietnamDiseaseModel >> bAm: aNumber [

	bAm := aNumber
]

{ #category : #accessing }
CMIDAIRVietnamDiseaseModel >> bIc [

	^ bIc
]

{ #category : #accessing }
CMIDAIRVietnamDiseaseModel >> bIc: aNumber [

	bIc := aNumber
]

{ #category : #accessing }
CMIDAIRVietnamDiseaseModel >> bId [

	^ bId
]

{ #category : #accessing }
CMIDAIRVietnamDiseaseModel >> bId: aNumber [

	bId := aNumber
]

{ #category : #accessing }
CMIDAIRVietnamDiseaseModel >> bIh [

	^ bIh
]

{ #category : #accessing }
CMIDAIRVietnamDiseaseModel >> bIh: aNumber [

	bIh := aNumber
]

{ #category : #accessing }
CMIDAIRVietnamDiseaseModel >> bIm [

	^ bIm
]

{ #category : #accessing }
CMIDAIRVietnamDiseaseModel >> bIm: aNumber [

	bIm := aNumber
]

{ #category : #accessing }
CMIDAIRVietnamDiseaseModel >> bIq [

	^ bIq
]

{ #category : #accessing }
CMIDAIRVietnamDiseaseModel >> bIq: aNumber [

	bIq := aNumber
]

{ #category : #defaults }
CMIDAIRVietnamDiseaseModel >> defaultDiseaseDynamicsClass [

	^ CMIDAIRVietnamDiseaseS
]

{ #category : #initialization }
CMIDAIRVietnamDiseaseModel >> initialize [

	super initialize.
	pa := 0.43.
	ph := 0.14.
	pc := 0.33.
	pd := 0.01.
	pq := 0.5.
	tEa := 2.0.
	tEm := 2.0.
	tEh := 2.0.
	tEc := 2.0.
	tEd := 2.0.
	tAa := 4.0.
	tAm := 4.0.
	tAh := 4.0.
	tAc := 4.0.
	tAd := 4.0.
	tIm := 12.0.
	tIq := 2.0.
	tIh := 5.0.
	tIc := 5.0.
	tId := 5.0.
	tQ := 10.0.
	tHh := 3.25.
	tHc := 4.25.
	tHd := 4.25.
	tCc := 6.0.
	tCd := 3.0.
	tR := 999.0.
	bAa := 1.5.
	bAm := 1.0.
	bAh := 1.0.
	bAc := 1.0.
	bAd := 1.0.
	bIm := 1.0.
	bIq := 1.0.
	bIh := 1.0.
	bIc := 1.0.
	bId := 1.0
]

{ #category : #'user interfaces' }
CMIDAIRVietnamDiseaseModel >> openGUI [

	^ self asPresenter openWithSpec
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
CMIDAIRVietnamDiseaseModel >> tAa [

	^ tAa
]

{ #category : #accessing }
CMIDAIRVietnamDiseaseModel >> tAa: anObject [

	tAa := anObject
]

{ #category : #accessing }
CMIDAIRVietnamDiseaseModel >> tAc [

	^ tAc
]

{ #category : #accessing }
CMIDAIRVietnamDiseaseModel >> tAc: anObject [

	tAc := anObject
]

{ #category : #accessing }
CMIDAIRVietnamDiseaseModel >> tAd [

	^ tAd
]

{ #category : #accessing }
CMIDAIRVietnamDiseaseModel >> tAd: anObject [

	tAd := anObject
]

{ #category : #accessing }
CMIDAIRVietnamDiseaseModel >> tAh [

	^ tAh
]

{ #category : #accessing }
CMIDAIRVietnamDiseaseModel >> tAh: anObject [

	tAh := anObject
]

{ #category : #accessing }
CMIDAIRVietnamDiseaseModel >> tAm [

	^ tAm
]

{ #category : #accessing }
CMIDAIRVietnamDiseaseModel >> tAm: anObject [

	tAm := anObject
]

{ #category : #accessing }
CMIDAIRVietnamDiseaseModel >> tCc [

	^ tCc
]

{ #category : #accessing }
CMIDAIRVietnamDiseaseModel >> tCc: anObject [

	tCc := anObject
]

{ #category : #accessing }
CMIDAIRVietnamDiseaseModel >> tCd [

	^ tCd
]

{ #category : #accessing }
CMIDAIRVietnamDiseaseModel >> tCd: anObject [

	tCd := anObject
]

{ #category : #accessing }
CMIDAIRVietnamDiseaseModel >> tEa [

	^ tEa
]

{ #category : #accessing }
CMIDAIRVietnamDiseaseModel >> tEa: anObject [

	tEa := anObject
]

{ #category : #accessing }
CMIDAIRVietnamDiseaseModel >> tEc [

	^ tEc
]

{ #category : #accessing }
CMIDAIRVietnamDiseaseModel >> tEc: anObject [

	tEc := anObject
]

{ #category : #accessing }
CMIDAIRVietnamDiseaseModel >> tEd [

	^ tEd
]

{ #category : #accessing }
CMIDAIRVietnamDiseaseModel >> tEd: anObject [

	tEd := anObject
]

{ #category : #accessing }
CMIDAIRVietnamDiseaseModel >> tEh [

	^ tEh
]

{ #category : #accessing }
CMIDAIRVietnamDiseaseModel >> tEh: anObject [

	tEh := anObject
]

{ #category : #accessing }
CMIDAIRVietnamDiseaseModel >> tEm [

	^ tEm
]

{ #category : #accessing }
CMIDAIRVietnamDiseaseModel >> tEm: anObject [

	tEm := anObject
]

{ #category : #accessing }
CMIDAIRVietnamDiseaseModel >> tHc [

	^ tHc
]

{ #category : #accessing }
CMIDAIRVietnamDiseaseModel >> tHc: anObject [

	tHc := anObject
]

{ #category : #accessing }
CMIDAIRVietnamDiseaseModel >> tHd [

	^ tHd
]

{ #category : #accessing }
CMIDAIRVietnamDiseaseModel >> tHd: anObject [

	tHd := anObject
]

{ #category : #accessing }
CMIDAIRVietnamDiseaseModel >> tHh [

	^ tHh
]

{ #category : #accessing }
CMIDAIRVietnamDiseaseModel >> tHh: anObject [

	tHh := anObject
]

{ #category : #accessing }
CMIDAIRVietnamDiseaseModel >> tIc [

	^ tIc
]

{ #category : #accessing }
CMIDAIRVietnamDiseaseModel >> tIc: anObject [

	tIc := anObject
]

{ #category : #accessing }
CMIDAIRVietnamDiseaseModel >> tId [

	^ tId
]

{ #category : #accessing }
CMIDAIRVietnamDiseaseModel >> tId: anObject [

	tId := anObject
]

{ #category : #accessing }
CMIDAIRVietnamDiseaseModel >> tIh [

	^ tIh
]

{ #category : #accessing }
CMIDAIRVietnamDiseaseModel >> tIh: anObject [

	tIh := anObject
]

{ #category : #accessing }
CMIDAIRVietnamDiseaseModel >> tIm [

	^ tIm
]

{ #category : #accessing }
CMIDAIRVietnamDiseaseModel >> tIm: anObject [

	tIm := anObject
]

{ #category : #accessing }
CMIDAIRVietnamDiseaseModel >> tIq [

	^ tIq
]

{ #category : #accessing }
CMIDAIRVietnamDiseaseModel >> tIq: anObject [

	tIq := anObject
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
