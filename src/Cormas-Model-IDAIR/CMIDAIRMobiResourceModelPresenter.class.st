Class {
	#name : #CMIDAIRMobiResourceModelPresenter,
	#superclass : #SpPresenterWithModel,
	#instVars : [
		'numICUs',
		'numBeds',
		'currentMasks',
		'maxMasks',
		'masksSupply',
		'maskWearingRate',
		'currentOxygen',
		'maxOxygen',
		'oxygenSupply'
	],
	#category : #'Cormas-Model-IDAIR-Resource-Mobi'
}

{ #category : #specs }
CMIDAIRMobiResourceModelPresenter class >> defaultSpec [

	^ SpGridLayout new
		  beColumnNotHomogeneous;
		  beRowNotHomogeneous;
		  add: 'Regular Bed' at: 1 @ 1 span: 2 @ 1;
		  add: ' total' asPresenter at: 1 @ 2;
		  add: #numBeds at: 2 @ 2;
		  add: '    ' asPresenter at: 3 @ 1;
		  add: 'ICU' at: 4 @ 1 span: 2 @ 1;
		  add: ' total' asPresenter at: 4 @ 2;
		  add: #numICUs at: 5 @ 2;
		  add: '    ' asPresenter at: 6 @ 1;
		  add: 'Masks' at: 7 @ 1 span: 2 @ 1;
		  add: ' available' asPresenter at: 7 @ 2;
		  add: #currentMasks at: 8 @ 2;
		  add: ' supply (unit/day)' asPresenter at: 7 @ 3;
		  add: #masksSupply at: 8 @ 3;
		  add: ' max stocks' asPresenter at: 7 @ 4;
		  add: #maxMasks at: 8 @ 4;
		  add: '    ' asPresenter at: 9 @ 1;
		  add: 'Oxygen' at: 10 @ 1 span: 2 @ 1;
		  add: ' available' asPresenter at: 10 @ 2;
		  add: #currentOxygen at: 11 @ 2;
		  add: ' supply (unit/day)' asPresenter at: 10 @ 3;
		  add: #oxygenSupply at: 11 @ 3;
		  add: ' max stocks' asPresenter at: 10 @ 4;
		  add: #maxOxygen at: 11 @ 4;
		  yourself
]

{ #category : #initialization }
CMIDAIRMobiResourceModelPresenter >> initializePresenters [

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
	currentMasks := self newNumberInput
		                beFloat;
		                climbRate: 1.0;
		                whenNumberChangedDo: [ :value | 
			                self model ifNotNil: [ :m | m currentMasks: value ] ];
		                yourself.
	maxMasks := self newNumberInput
		            beFloat;
		            climbRate: 1.0;
		            whenNumberChangedDo: [ :value | 
			            self model ifNotNil: [ :m | m maxMasks: value ] ];
		            yourself.
	masksSupply := self newNumberInput
		               beFloat;
		               climbRate: 1.0;
		               whenNumberChangedDo: [ :value | 
			               self model ifNotNil: [ :m | m masksSupply: value ] ];
		               yourself.
	maskWearingRate := self newNumberInput
		                   beFloat;
		                   climbRate: 0.1;
		                   whenNumberChangedDo: [ :value | 
			                   self model ifNotNil: [ :m | 
					                   m maskWearingRate: value ] ];
		                   yourself.
	currentOxygen := self newNumberInput
		                 beFloat;
		                 climbRate: 1.0;
		                 whenNumberChangedDo: [ :value | 
			                 self model ifNotNil: [ :m | 
					                 m currentOxygen: value ] ];
		                 yourself.
	maxOxygen := self newNumberInput
		             beFloat;
		             climbRate: 1.0;
		             whenNumberChangedDo: [ :value | 
			             self model ifNotNil: [ :m | m maxOxygen: value ] ];
		             yourself.
	oxygenSupply := self newNumberInput
		                beFloat;
		                climbRate: 1.0;
		                whenNumberChangedDo: [ :value | 
			                self model ifNotNil: [ :m | m oxygenSupply: value ] ];
		                yourself
]

{ #category : #initialization }
CMIDAIRMobiResourceModelPresenter >> modelChanged [

	super modelChanged.

	self model ifNotNil: [ :m | numICUs number: m numICUs ].
	self model ifNotNil: [ :m | numBeds number: m numBeds ].
	self model ifNotNil: [ :m | currentMasks number: m currentMasks ].
	self model ifNotNil: [ :m | maxMasks number: m maxMasks ].
	self model ifNotNil: [ :m | masksSupply number: m masksSupply ].
	self model ifNotNil: [ :m | 
		maskWearingRate number: m maskWearingRate ].
	self model ifNotNil: [ :m | currentOxygen number: m currentOxygen ].
	self model ifNotNil: [ :m | maxOxygen number: m maxOxygen ].
	self model ifNotNil: [ :m | oxygenSupply number: m oxygenSupply ]
]
