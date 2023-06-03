Class {
	#name : #CMIDAIRVietnamDiseaseModelPresenter,
	#superclass : #SpPresenterWithModel,
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

{ #category : #specs }
CMIDAIRVietnamDiseaseModelPresenter class >> defaultSpec [

	^ SpGridLayout new
		  beColumnNotHomogeneous;
		  beRowHomogeneous;
		  add: 'pa ' at: 1 @ 1;
		  add: #pa at: 2 @ 1;
		  add: 'ph ' at: 1 @ 4;
		  add: #ph at: 2 @ 4;
		  add: 'pc ' at: 1 @ 5;
		  add: #pc at: 2 @ 5;
		  add: 'pd ' at: 1 @ 6;
		  add: #pd at: 2 @ 6;
		  add: 'pq ' at: 1 @ 3;
		  add: #pq at: 2 @ 3;
		  add: 'τEa' at: 3 @ 1;
		  add: #tEa at: 4 @ 1;
		  add: 'τEm' at: 3 @ 2;
		  add: #tEm at: 4 @ 2;
		  add: 'τEh' at: 3 @ 4;
		  add: #tEh at: 4 @ 4;
		  add: 'τEc' at: 3 @ 5;
		  add: #tEc at: 4 @ 5;
		  add: 'τEd' at: 3 @ 6;
		  add: #tEd at: 4 @ 6;
		  add: 'τAm' at: 5 @ 2;
		  add: #tAm at: 6 @ 2;
		  add: 'τAh' at: 5 @ 4;
		  add: #tAh at: 6 @ 4;
		  add: 'τAc' at: 5 @ 5;
		  add: #tAc at: 6 @ 5;
		  add: 'τAd' at: 5 @ 6;
		  add: #tAd at: 6 @ 6;
		  add: 'τIm' at: 9 @ 2;
		  add: #tIm at: 10 @ 2;
		  add: 'τIq' at: 9 @ 3;
		  add: #tIq at: 10 @ 3;
		  add: 'τIh' at: 9 @ 4;
		  add: #tIh at: 10 @ 4;
		  add: 'τIc' at: 9 @ 5;
		  add: #tIc at: 10 @ 5;
		  add: 'τId' at: 9 @ 6;
		  add: #tId at: 10 @ 6;
		  add: 'τQ' at: 13 @ 3;
		  add: #tQ at: 14 @ 3;
		  add: 'τHh' at: 13 @ 4;
		  add: #tHh at: 14 @ 4;
		  add: 'τHc' at: 13 @ 5;
		  add: #tHc at: 14 @ 5;
		  add: 'τHd' at: 13 @ 6;
		  add: #tHd at: 14 @ 6;
		  add: 'τCc' at: 15 @ 5;
		  add: #tCc at: 16 @ 5;
		  add: 'τCd' at: 15 @ 6;
		  add: #tCd at: 16 @ 6;
		  add: 'τR' at: 15 @ 7;
		  add: #tR at: 16 @ 7;
		  add: 'βAa' at: 7 @ 1;
		  add: #bAa at: 8 @ 1;
		  add: 'βAm' at: 7 @ 2;
		  add: #bAm at: 8 @ 2;
		  add: 'βAh' at: 7 @ 4;
		  add: #bAh at: 8 @ 4;
		  add: 'βAc' at: 7 @ 5;
		  add: #bAc at: 8 @ 5;
		  add: 'βAd' at: 7 @ 6;
		  add: #bAd at: 8 @ 6;
		  add: 'βIm' at: 11 @ 2;
		  add: #bIm at: 12 @ 2;
		  add: 'βIq' at: 11 @ 3;
		  add: #bIq at: 12 @ 3;
		  add: 'βIh' at: 11 @ 4;
		  add: #bIh at: 12 @ 4;
		  add: 'βIc' at: 11 @ 5;
		  add: #bIc at: 12 @ 5;
		  add: 'βId' at: 11 @ 6;
		  add: #bId at: 12 @ 6;
		  yourself
]

{ #category : #initialization }
CMIDAIRVietnamDiseaseModelPresenter >> initializePresenters [

	super initializePresenters.
	pa := self newNumberInput
		      beFloat;
		      climbRate: 0.01;
		      whenNumberChangedDo: [ :value | 
			      self model ifNotNil: [ :m | m pa: value ] ];
		      yourself.
	ph := self newNumberInput
		      beFloat;
		      climbRate: 0.01;
		      whenNumberChangedDo: [ :value | 
			      self model ifNotNil: [ :m | m ph: value ] ];
		      yourself.
	pc := self newNumberInput
		      beFloat;
		      climbRate: 0.01;
		      whenNumberChangedDo: [ :value | 
			      self model ifNotNil: [ :m | m pc: value ] ];
		      yourself.
	pd := self newNumberInput
		      beFloat;
		      climbRate: 0.01;
		      whenNumberChangedDo: [ :value | 
			      self model ifNotNil: [ :m | m pd: value ] ];
		      yourself.
	pq := self newNumberInput
		      beFloat;
		      climbRate: 0.01;
		      whenNumberChangedDo: [ :value | 
			      self model ifNotNil: [ :m | m pq: value ] ];
		      yourself.
	tEa := self newNumberInput
		       beFloat;
		       climbRate: 1.0;
		       whenNumberChangedDo: [ :value | 
			       self model ifNotNil: [ :m | m tEa: value ] ];
		       yourself.
	tEm := self newNumberInput
		       beFloat;
		       climbRate: 1.0;
		       whenNumberChangedDo: [ :value | 
			       self model ifNotNil: [ :m | m tEm: value ] ];
		       yourself.
	tEh := self newNumberInput
		       beFloat;
		       climbRate: 1.0;
		       whenNumberChangedDo: [ :value | 
			       self model ifNotNil: [ :m | m tEh: value ] ];
		       yourself.
	tEc := self newNumberInput
		       beFloat;
		       climbRate: 1.0;
		       whenNumberChangedDo: [ :value | 
			       self model ifNotNil: [ :m | m tEc: value ] ];
		       yourself.
	tEd := self newNumberInput
		       beFloat;
		       climbRate: 1.0;
		       whenNumberChangedDo: [ :value | 
			       self model ifNotNil: [ :m | m tEd: value ] ];
		       yourself.
	tAa := self newNumberInput
		       beFloat;
		       climbRate: 1.0;
		       whenNumberChangedDo: [ :value | 
			       self model ifNotNil: [ :m | m tAa: value ] ];
		       yourself.
	tAm := self newNumberInput
		       beFloat;
		       climbRate: 1.0;
		       whenNumberChangedDo: [ :value | 
			       self model ifNotNil: [ :m | m tAm: value ] ];
		       yourself.
	tAh := self newNumberInput
		       beFloat;
		       climbRate: 1.0;
		       whenNumberChangedDo: [ :value | 
			       self model ifNotNil: [ :m | m tAh: value ] ];
		       yourself.
	tAc := self newNumberInput
		       beFloat;
		       climbRate: 1.0;
		       whenNumberChangedDo: [ :value | 
			       self model ifNotNil: [ :m | m tAc: value ] ];
		       yourself.
	tAd := self newNumberInput
		       beFloat;
		       climbRate: 1.0;
		       whenNumberChangedDo: [ :value | 
			       self model ifNotNil: [ :m | m tAd: value ] ];
		       yourself.
	tIm := self newNumberInput
		       beFloat;
		       climbRate: 1.0;
		       whenNumberChangedDo: [ :value | 
			       self model ifNotNil: [ :m | m tIm: value ] ];
		       yourself.
	tIq := self newNumberInput
		       beFloat;
		       climbRate: 1.0;
		       whenNumberChangedDo: [ :value | 
			       self model ifNotNil: [ :m | m tIq: value ] ];
		       yourself.
	tIh := self newNumberInput
		       beFloat;
		       climbRate: 1.0;
		       whenNumberChangedDo: [ :value | 
			       self model ifNotNil: [ :m | m tIh: value ] ];
		       yourself.
	tIc := self newNumberInput
		       beFloat;
		       climbRate: 1.0;
		       whenNumberChangedDo: [ :value | 
			       self model ifNotNil: [ :m | m tIc: value ] ];
		       yourself.
	tId := self newNumberInput
		       beFloat;
		       climbRate: 1.0;
		       whenNumberChangedDo: [ :value | 
			       self model ifNotNil: [ :m | m tId: value ] ];
		       yourself.
	tQ := self newNumberInput
		      beFloat;
		      climbRate: 1.0;
		      whenNumberChangedDo: [ :value | 
			      self model ifNotNil: [ :m | m tQ: value ] ];
		      yourself.
	tHh := self newNumberInput
		       beFloat;
		       climbRate: 1.0;
		       whenNumberChangedDo: [ :value | 
			       self model ifNotNil: [ :m | m tHh: value ] ];
		       yourself.
	tHc := self newNumberInput
		       beFloat;
		       climbRate: 1.0;
		       whenNumberChangedDo: [ :value | 
			       self model ifNotNil: [ :m | m tHc: value ] ];
		       yourself.
	tHd := self newNumberInput
		       beFloat;
		       climbRate: 1.0;
		       whenNumberChangedDo: [ :value | 
			       self model ifNotNil: [ :m | m tHd: value ] ];
		       yourself.
	tCc := self newNumberInput
		       beFloat;
		       climbRate: 1.0;
		       whenNumberChangedDo: [ :value | 
			       self model ifNotNil: [ :m | m tCc: value ] ];
		       yourself.
	tCd := self newNumberInput
		       beFloat;
		       climbRate: 1.0;
		       whenNumberChangedDo: [ :value | 
			       self model ifNotNil: [ :m | m tCd: value ] ];
		       yourself.
	tR := self newNumberInput
		      beFloat;
		      climbRate: 1.0;
		      whenNumberChangedDo: [ :value | 
			      self model ifNotNil: [ :m | m tR: value ] ];
		      yourself.

	bAa := self newNumberInput
		       beFloat;
		       climbRate: 0.1;
		       whenNumberChangedDo: [ :value | 
			       self model ifNotNil: [ :m | m bAa: value ] ];
		       yourself.
	bAm := self newNumberInput
		       beFloat;
		       climbRate: 0.1;
		       whenNumberChangedDo: [ :value | 
			       self model ifNotNil: [ :m | m bAm: value ] ];
		       yourself.
	bAh := self newNumberInput
		       beFloat;
		       climbRate: 0.1;
		       whenNumberChangedDo: [ :value | 
			       self model ifNotNil: [ :m | m bAh: value ] ];
		       yourself.
	bAc := self newNumberInput
		       beFloat;
		       climbRate: 0.1;
		       whenNumberChangedDo: [ :value | 
			       self model ifNotNil: [ :m | m bAc: value ] ];
		       yourself.
	bAd := self newNumberInput
		       beFloat;
		       climbRate: 0.1;
		       whenNumberChangedDo: [ :value | 
			       self model ifNotNil: [ :m | m bAd: value ] ];
		       yourself.
	bIm := self newNumberInput
		       beFloat;
		       climbRate: 0.1;
		       whenNumberChangedDo: [ :value | 
			       self model ifNotNil: [ :m | m bIm: value ] ];
		       yourself.
	bIq := self newNumberInput
		       beFloat;
		       climbRate: 0.1;
		       whenNumberChangedDo: [ :value | 
			       self model ifNotNil: [ :m | m bIq: value ] ];
		       yourself.
	bIh := self newNumberInput
		       beFloat;
		       climbRate: 0.1;
		       whenNumberChangedDo: [ :value | 
			       self model ifNotNil: [ :m | m bIh: value ] ];
		       yourself.
	bIc := self newNumberInput
		       beFloat;
		       climbRate: 0.1;
		       whenNumberChangedDo: [ :value | 
			       self model ifNotNil: [ :m | m bIc: value ] ];
		       yourself.
	bId := self newNumberInput
		       beFloat;
		       climbRate: 0.1;
		       whenNumberChangedDo: [ :value | 
			       self model ifNotNil: [ :m | m bId: value ] ];
		       yourself
]

{ #category : #initialization }
CMIDAIRVietnamDiseaseModelPresenter >> initializeWindow: aSpWindowPresenter [

	super initializeWindow: aSpWindowPresenter.
	aSpWindowPresenter initialExtent: 780.0 @ 218.0
]

{ #category : #updating }
CMIDAIRVietnamDiseaseModelPresenter >> modelChanged [

	super modelChanged.
	self model ifNotNil: [ :m | 
		pa number: m pa.
		ph number: m ph.
		pc number: m pc.
		pd number: m pd.
		pq number: m pq.
		tEa number: m tEa.
		tEm number: m tEm.
		tEh number: m tEh.
		tEc number: m tEc.
		tEd number: m tEd.
		tAa number: m tAa.
		tAm number: m tAm.
		tAh number: m tAh.
		tAc number: m tAc.
		tAd number: m tAd.
		tIm number: m tIm.
		tIq number: m tIq.
		tIh number: m tIh.
		tIc number: m tIc.
		tId number: m tId.
		tHh number: m tHh.
		tHc number: m tHc.
		tHd number: m tHd.
		tQ number: m tQ.
		tCc number: m tCc.
		tCd number: m tCd.
		tR number: m tR.
		bAa number: m bAa.
		bAm number: m bAm.
		bAh number: m bAh.
		bAc number: m bAc.
		bAd number: m bAd.
		bIm number: m bIm.
		bIq number: m bIq.
		bIh number: m bIh.
		bIc number: m bIc.
		bId number: m bId ]
]

{ #category : #accessing }
CMIDAIRVietnamDiseaseModelPresenter >> title [
	^ 'Disease model parameters'
]
