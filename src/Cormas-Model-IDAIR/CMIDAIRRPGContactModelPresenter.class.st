Class {
	#name : #CMIDAIRRPGContactModelPresenter,
	#superclass : #SpPresenterWithModel,
	#category : #'Cormas-Model-IDAIR-Contact-RPG'
}

{ #category : #specs }
CMIDAIRRPGContactModelPresenter >> defaultSpec [

	<script: 'CMIDAIRRPGContactModel new asPresenter openWithSpec'>
	| citizenSpec policyMakerSpec |
	citizenSpec := SpBoxLayout newVertical
		               add: (SpBoxLayout newHorizontal
				                add: 'Citizen''s Action' asPresenter width: 200;
				                add: 'Personal contact factor' asPresenter
				                width: 100;
				                add: 'Well-being points' asPresenter width: 100)
		               height: self class labelHeight + 5;
		               yourself.
	self model citizenActionsDo: [ :action | 
		citizenSpec
			add: (SpBoxLayout newHorizontal
					 add: action name asPresenter width: 200;
					 add: (action isCitizenAction
							  ifTrue: [ 
								  self newNumberInput
									  beFloat;
									  number: action contactFactor;
									  climbRate: 0.1;
									  whenNumberChangedDo: [ :value | 
										  action contactFactor: value ];
									  yourself ]
							  ifFalse: [ '' asPresenter ])
					 width: 100;
					 add: (action isCitizenAction
							  ifTrue: [ 
								  self newNumberInput
									  beInteger;
									  number: action wellbeingPoints;
									  climbRate: 1;
									  whenNumberChangedDo: [ :value | 
										  action wellbeingPoints: value ];
									  yourself ]
							  ifFalse: [ '' asPresenter ])
					 width: 100;
					 yourself)
			expand: false ].

	policyMakerSpec := SpBoxLayout newVertical
		                   add: (SpBoxLayout newHorizontal
				                    add: 'Policy Maker''s Action' asPresenter
				                    width: 200;
				                    add: 'Transient factor' asPresenter
				                    width: 100;
				                    add: 'Cummulative factor' asPresenter
				                    width: 100)
		                   height: self class labelHeight + 5;
		                   yourself.
	self model policymakerActionsDo: [ :action | 
		action isSocialAction ifTrue: [ 
			policyMakerSpec
				add: (SpBoxLayout newHorizontal
						 add: action name asPresenter width: 200;
						 add: (self newNumberInput
								  beFloat;
								  number: action transientFactor;
								  climbRate: 0.1;
								  whenNumberChangedDo: [ :value | 
									  action transientFactor: value ];
								  yourself)
						 width: 100;
						 add: (self newNumberInput
								  beFloat;
								  number: action cummulativeFactor;
								  climbRate: 0.1;
								  whenNumberChangedDo: [ :value | 
									  action cummulativeFactor: value ];
								  yourself)
						 width: 100;
						 yourself)
				expand: false ] ].

	^ SpBoxLayout newHorizontal
		  add: citizenSpec expand: false;
		  add: '    ' asPresenter width: 50;
		  add: policyMakerSpec expand: false
]

{ #category : #api }
CMIDAIRRPGContactModelPresenter >> retrieveSpec: aSelector [

	| spec |
	spec := self perform: aSelector.
	spec isSpLayout ifTrue: [ spec selector: aSelector ].
	^ spec
]
