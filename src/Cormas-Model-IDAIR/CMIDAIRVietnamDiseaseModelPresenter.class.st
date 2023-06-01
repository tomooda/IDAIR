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
		'tR'
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
		  add: 'tEa ' at: 3 @ 1;
		  add: #tEa at: 4 @ 1;
		  add: 'tEm ' at: 3 @ 2;
		  add: #tEm at: 4 @ 2;
		  add: 'tEh ' at: 3 @ 4;
		  add: #tEh at: 4 @ 4;
		  add: 'tEc ' at: 3 @ 5;
		  add: #tEc at: 4 @ 5;
		  add: 'tEd ' at: 3 @ 6;
		  add: #tEd at: 4 @ 6;
		  add: 'tAa ' at: 5 @ 1;
		  add: #tAa at: 6 @ 1;
		  add: 'tAm ' at: 5 @ 2;
		  add: #tAm at: 6 @ 2;
		  add: 'tAh ' at: 5 @ 4;
		  add: #tAh at: 6 @ 4;
		  add: 'tAc ' at: 5 @ 5;
		  add: #tAc at: 6 @ 5;
		  add: 'tAd ' at: 5 @ 6;
		  add: #tAd at: 6 @ 6;
		  add: 'tIm ' at: 7 @ 2;
		  add: #tIm at: 8 @ 2;
		  add: 'tIq ' at: 7 @ 3;
		  add: #tIq at: 8 @ 3;
		  add: 'tIh ' at: 7 @ 4;
		  add: #tIh at: 8 @ 4;
		  add: 'tIc ' at: 7 @ 5;
		  add: #tIc at: 8 @ 5;
		  add: 'tId ' at: 7 @ 6;
		  add: #tId at: 8 @ 6;
		  add: 'tQ' at: 9 @ 3;
		  add: #tQ at: 10 @ 3;
		  add: 'tHh ' at: 9 @ 4;
		  add: #tHh at: 10 @ 4;
		  add: 'tHc ' at: 9 @ 5;
		  add: #tHc at: 10 @ 5;
		  add: 'tHd ' at: 9 @ 6;
		  add: #tHd at: 10 @ 6;
		  add: 'tCc ' at: 11 @ 5;
		  add: #tCc at: 12 @ 5;
		  add: 'tCd ' at: 11 @ 6;
		  add: #tCd at: 12 @ 6;
		  add: 'tR ' at: 13 @ 6;
		  add: #tR at: 14 @ 6;
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
		      yourself
]

{ #category : #initialization }
CMIDAIRVietnamDiseaseModelPresenter >> initializeWindow: aSpWindowPresenter [

	super initializeWindow: aSpWindowPresenter.
	aSpWindowPresenter initialExtent: 650 @ 300
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
		tR number: m tR ]
]

{ #category : #accessing }
CMIDAIRVietnamDiseaseModelPresenter >> title [
	^ 'Disease model parameters'
]
