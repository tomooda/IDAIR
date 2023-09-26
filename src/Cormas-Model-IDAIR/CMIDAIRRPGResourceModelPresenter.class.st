Class {
	#name : #CMIDAIRRPGResourceModelPresenter,
	#superclass : #SpPresenterWithModel,
	#instVars : [
		'numICUs',
		'numBeds',
		'occupiedICUs',
		'occupiedBeds'
	],
	#category : #'Cormas-Model-IDAIR-Resource-RPG'
}

{ #category : #specs }
CMIDAIRRPGResourceModelPresenter class >> defaultSpec [

	^ SpGridLayout new
		  beColumnNotHomogeneous;
		  beRowNotHomogeneous;
		  add: 'Regular Bed' at: 1 @ 1 span: 2 @ 1;
		  add: ' occupied' asPresenter at: 1 @ 2;
		  add: #occupiedBeds at: 2 @ 2;
		  add: ' total' asPresenter at: 1 @ 3;
		  add: #numBeds at: 2 @ 3;
		  add: '    ' asPresenter at: 3 @ 1;
		  add: 'ICU' at: 4 @ 1 span: 2 @ 1;
		  add: ' occupied' asPresenter at: 4 @ 2;
		  add: #occupiedICUs at: 5 @ 2;
		  add: ' total' asPresenter at: 4 @ 3;
		  add: #numICUs at: 5 @ 3;
		  yourself
]

{ #category : #initialization }
CMIDAIRRPGResourceModelPresenter >> initializePresenters [

	super initializePresenters.
	numICUs := self newNumberInput
		           beFloat;
		           climbRate: 1.0;
		           whenNumberChangedDo: [ :value | 
			           self model ifNotNil: [ :m | m numICUs: value ] ];
		           yourself.
	numBeds := self newNumberInput
		           beFloat;
		           climbRate: 1.0;
		           whenNumberChangedDo: [ :value | 
			           self model ifNotNil: [ :m | m numBeds: value ] ];
		           yourself.
	occupiedICUs := self newNumberInput
		                beFloat;
		                climbRate: 1.0;
		                whenNumberChangedDo: [ :value | 
			                self model ifNotNil: [ :m | m occupiedICUs: value ] ];
		                yourself.
	occupiedBeds := self newNumberInput
		                beFloat;
		                climbRate: 1.0;
		                whenNumberChangedDo: [ :value | 
			                self model ifNotNil: [ :m | m occupiedBeds: value ] ];
		                yourself
]

{ #category : #initialization }
CMIDAIRRPGResourceModelPresenter >> modelChanged [

	super modelChanged.

	self model ifNotNil: [ :m | numICUs number: m numICUs ].
	self model ifNotNil: [ :m | numBeds number: m numBeds ].
	self model ifNotNil: [ :m | occupiedICUs number: m occupiedICUs ].
	self model ifNotNil: [ :m | occupiedBeds number: m occupiedBeds ]
]
