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
				                add: 'YES' asPresenter width: 100;
				                add: 'NO' asPresenter width: 100)
		               height: self class labelHeight + 5;
		               yourself.
	self model citizenActionsAndFactorsDo: [ :action :factors | 
		citizenSpec
			add: (SpBoxLayout newHorizontal
					 add: action asString asPresenter width: 200;
					 add: (factors first isSymbol
							  ifTrue: [ factors first asString asPresenter ]
							  ifFalse: [ 
								  self newNumberInput
									  beFloat;
									  number: factors first;
									  climbRate: 0.1;
									  whenNumberChangedDo: [ :value | 
										  self model citizenActionsAndFactors at: action put: { 
													  value.
													  (self model citizenActionsAndFactors at: action) second.
													  (self model citizenActionsAndFactors at: action) third } ];
									  yourself ])
					 width: 100;
					 add: (factors second isSymbol
							  ifTrue: [ factors second asString asPresenter ]
							  ifFalse: [ 
								  self newNumberInput
									  beFloat;
									  number: factors second;
									  climbRate: 0.1;
									  whenNumberChangedDo: [ :value | 
										  self model citizenActionsAndFactors at: action put: { 
													  (self model citizenActionsAndFactors at: action) first.
													  value.
													  (self model citizenActionsAndFactors at: action) third } ];
									  yourself ])
					 width: 100;
					 add: (self newNumberInput
							  beInteger;
							  number: factors third;
							  climbRate: 1;
							  whenNumberChangedDo: [ :value | 
								  self model citizenActionsAndFactors at: action put: { 
											  (self model citizenActionsAndFactors at: action) first.
											  (self model citizenActionsAndFactors at: action) second.
											  value } ];
							  yourself)
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
	self model policyMakerActionsAndFactorsDo: [ :action :factors | 
		policyMakerSpec
			add: (SpBoxLayout newHorizontal
					 add: action asString asPresenter width: 200;
					 add: (factors isSymbol
							  ifTrue: [ factors asString asPresenter ]
							  ifFalse: [ 
								  self newNumberInput
									  beFloat;
									  number: factors first;
									  climbRate: 0.1;
									  whenNumberChangedDo: [ :value | 
										  (self model policyMakerActionsAndFactors at: action)
											  at: 1
											  put: value ];
									  yourself ])
					 width: 100;
					 add: (factors isSymbol
							  ifTrue: [ '-' asPresenter ]
							  ifFalse: [ 
								  self newNumberInput
									  beFloat;
									  number: factors second;
									  climbRate: 0.1;
									  whenNumberChangedDo: [ :value | 
										  (self model policyMakerActionsAndFactors at: action)
											  at: 2
											  put: value ];
									  yourself ])
					 width: 100;
					 yourself)
			expand: false ].

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
