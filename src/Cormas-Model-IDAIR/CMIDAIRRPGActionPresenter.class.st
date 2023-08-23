Class {
	#name : #CMIDAIRRPGActionPresenter,
	#superclass : #SpPresenterWithModel,
	#instVars : [
		'playerList'
	],
	#category : #'Cormas-Model-IDAIR-Contact-RPG'
}

{ #category : #accessing }
CMIDAIRRPGActionPresenter >> citizen [

	^ playerList selectedItem
]

{ #category : #specs }
CMIDAIRRPGActionPresenter >> citizenActionsSpec [

	| spec |
	spec := SpBoxLayout newVertical.
	self model citizenActionsAndFactorsDo: [ :action :factors | 
		| yesButton noButton |
		yesButton := self newButton
			             label: 'YES';
			             action: [ self citizenPlay: factors first ];
			             yourself.
		noButton := self newButton
			            label: 'NO';
			            action: [ self citizenPlay: factors second ];
			            yourself.
		spec
			add: (SpBoxLayout newHorizontal
					 add: action asString asPresenter width: 200;
					 add: yesButton width: 100;
					 add: noButton width: 100)
			expand: false ].
	^ spec
]

{ #category : #operations }
CMIDAIRRPGActionPresenter >> citizenPlay: aNumberOrSymbol [

	self citizen ifNotNil: [ :citizen | 
		aNumberOrSymbol isSymbol
			ifTrue: [ citizen perform: aNumberOrSymbol asSymbol ]
			ifFalse: [ citizen contactProfile factor: aNumberOrSymbol asFloat ] ]
]

{ #category : #specs }
CMIDAIRRPGActionPresenter >> defaultSpec [

	<script: 'CMIDAIRRPGContactModel new asPresenter openWithSpec'>
	| citizenSpec policyMakerSpec |
	citizenSpec := SpBoxLayout newVertical
		               add: (SpBoxLayout newHorizontal
				                add: 'Citizen''s Actions' asPresenter
				                width: 200)
		               height: self class labelHeight + 5;
		               yourself.
	citizenSpec add: (SpBoxLayout newHorizontal
			 add: #playerList width: 200;
			 add: ' ' asPresenter width: 50;
			 add: self citizenActionsSpec expand: false).

	policyMakerSpec := SpBoxLayout newVertical
		                   add: (SpBoxLayout newHorizontal
				                    add: 'Policy Maker''s Actions' asPresenter
				                    width: 200)
		                   height: self class labelHeight + 5;
		                   yourself.
	policyMakerSpec add: self policyMakerActionsSpec expand: false.
	^ SpBoxLayout newHorizontal
		  add: citizenSpec expand: false;
		  add: '    ' asPresenter width: 50;
		  add: policyMakerSpec expand: false
]

{ #category : #initialization }
CMIDAIRRPGActionPresenter >> initializePresenters [

	playerList := self newList
		              display: [ :assoc | assoc key ];
		              yourself
]

{ #category : #accessing }
CMIDAIRRPGActionPresenter >> modelChanged [

	super modelChanged.
	playerList items: (self model
			 ifNotNil: [ :model | model players associations ]
			 ifNil: [ Array new ])
]

{ #category : #specs }
CMIDAIRRPGActionPresenter >> policyMakerActionsSpec [

	| spec |
	spec := SpBoxLayout newVertical.
	self model policyMakerActionsAndFactorsDo: [ :action :factor | 
		spec
			add: (SpBoxLayout newHorizontal
					 add: (self newButton
							  label: action;
							  action: [ self policyMakerPlay: factor ];
							  yourself)
					 width: 200)
			expand: false ].
	^ spec
]

{ #category : #operations }
CMIDAIRRPGActionPresenter >> policyMakerPlay: aNumberOrSymbol [

	self model ifNotNil: [ :contactModel | 
		aNumberOrSymbol isSymbol
			ifTrue: [ contactModel perform: aNumberOrSymbol asSymbol ]
			ifFalse: [ 
			contactModel socialProfile factor: aNumberOrSymbol asFloat ] ]
]

{ #category : #api }
CMIDAIRRPGActionPresenter >> retrieveSpec: aSelector [

	| spec |
	spec := self perform: aSelector.
	spec isSpLayout ifTrue: [ spec selector: aSelector ].
	^ spec
]
