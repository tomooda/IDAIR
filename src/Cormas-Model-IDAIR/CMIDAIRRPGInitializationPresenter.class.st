Class {
	#name : #CMIDAIRRPGInitializationPresenter,
	#superclass : #SpPresenterWithModel,
	#instVars : [
		'playerNameField1',
		'playerNameField2',
		'playerNameField3',
		'playerNameField4',
		'playerNameField5',
		'playerNameField6',
		'mildSymptomPopulationField',
		'severeSymptomPopulationField'
	],
	#category : #'Cormas-Model-IDAIR-RPG-UI'
}

{ #category : #specs }
CMIDAIRRPGInitializationPresenter class >> defaultSpec [

	<script: 'self new openWithSpec'>
	^ SpBoxLayout newVertical
		  add: (SpBoxLayout newHorizontal
				   add: 'Player 1  ' width: 150;
				   add: #playerNameField1 width: 100)
		  height: self buttonHeight;
		  add: (SpBoxLayout newHorizontal
				   add: 'Player 2  ' width: 150;
				   add: #playerNameField2 width: 100)
		  height: self buttonHeight;
		  add: (SpBoxLayout newHorizontal
				   add: 'Player 3  ' width: 150;
				   add: #playerNameField3 width: 100)
		  height: self buttonHeight;
		  add: (SpBoxLayout newHorizontal
				   add: 'Player 4  ' width: 150;
				   add: #playerNameField4 width: 100)
		  height: self buttonHeight;
		  add: (SpBoxLayout newHorizontal
				   add: 'Player 5  ' width: 150;
				   add: #playerNameField5 width: 100)
		  height: self buttonHeight;
		  add: (SpBoxLayout newHorizontal
				   add: 'Player 6  ' width: 150;
				   add: #playerNameField6 width: 100)
		  height: self buttonHeight;
		  add: '' asPresenter expand: false;
		  add: (SpBoxLayout newHorizontal
				   add: 'Mild symptoms  ' width: 150;
				   add: #mildSymptomPopulationField width: 100)
		  expand: false;
		  add: (SpBoxLayout newHorizontal
				   add: 'Severe symptoms  ' width: 150;
				   add: #severeSymptomPopulationField width: 100)
		  expand: false;
		  yourself
]

{ #category : #initialization }
CMIDAIRRPGInitializationPresenter >> initializePresenters [

	super initializePresenters.
	playerNameField1 := self newTextInput
		                    help: 'Player''s name';
		                    text: '';
		                    yourself.
	playerNameField2 := self newTextInput
		                    help: 'Player''s name';
		                    text: '';
		                    yourself.
	playerNameField3 := self newTextInput
		                    help: 'Player''s name';
		                    text: '';
		                    yourself.
	playerNameField4 := self newTextInput
		                    help: 'Player''s name';
		                    text: '';
		                    yourself.
	playerNameField5 := self newTextInput
		                    help: 'Player''s name';
		                    text: '';
		                    yourself.
	playerNameField6 := self newTextInput
		                    help: 'Player''s name';
		                    text: '';
		                    yourself.
	mildSymptomPopulationField := self newNumberInput
		                              beInteger;
		                              number: 7;
		                              maximum: 10;
		                              minimum: 0;
		                              yourself.
	severeSymptomPopulationField := self newNumberInput
		                                beInteger;
		                                number: 3;
		                                maximum: 10;
		                                minimum: 0;
		                                yourself
]

{ #category : #initialization }
CMIDAIRRPGInitializationPresenter >> initializeWindow: aWindowPresenter [

	super initializeWindow: aWindowPresenter.
	aWindowPresenter initialExtent: 500 @ 400
]

{ #category : #accessing }
CMIDAIRRPGInitializationPresenter >> title [

	^ 'RPG Initial Condition'
]

{ #category : #evaluating }
CMIDAIRRPGInitializationPresenter >> value: aCMIDAIRModel [

	| totalPopulation |
	totalPopulation := 0.
	playerNameField1 text trim ifNotEmpty: [ :playerName | 
		| population newCitizens |
		population := 100.
		newCitizens := aCMIDAIRModel
			               createN: population
			               randomlyLocatedEntities: CMIDAIRCitizen
			               playerName: playerName.
		totalPopulation := totalPopulation + population ].
	playerNameField2 text trim ifNotEmpty: [ :playerName | 
		| population newCitizens |
		population := 100.
		newCitizens := aCMIDAIRModel
			               createN: population
			               randomlyLocatedEntities: CMIDAIRCitizen
			               playerName: playerName.
		totalPopulation := totalPopulation + population ].
	playerNameField3 text trim ifNotEmpty: [ :playerName | 
		| population newCitizens |
		population := 100.
		newCitizens := aCMIDAIRModel
			               createN: population
			               randomlyLocatedEntities: CMIDAIRCitizen
			               playerName: playerName.
		totalPopulation := totalPopulation + population ].
	playerNameField4 text trim ifNotEmpty: [ :playerName | 
		| population newCitizens |
		population := 100.
		newCitizens := aCMIDAIRModel
			               createN: population
			               randomlyLocatedEntities: CMIDAIRCitizen
			               playerName: playerName.
		totalPopulation := totalPopulation + population ].
	playerNameField5 text trim ifNotEmpty: [ :playerName | 
		| population newCitizens |
		population := 100.
		newCitizens := aCMIDAIRModel
			               createN: population
			               randomlyLocatedEntities: CMIDAIRCitizen
			               playerName: playerName.
		totalPopulation := totalPopulation + population ].
	playerNameField6 text trim ifNotEmpty: [ :playerName | 
		| population newCitizens |
		population := 100.
		newCitizens := aCMIDAIRModel
			               createN: population
			               randomlyLocatedEntities: CMIDAIRCitizen
			               playerName: playerName.
		totalPopulation := totalPopulation + population ].
	mildSymptomPopulationField number in: [ :population | 
		population > 0 ifTrue: [ 
			| newCitizens |
			newCitizens := aCMIDAIRModel
				               createN: population
				               randomlyLocatedEntities: CMIDAIRCitizen
				               playerName: ''.
			newCitizens do: [ :citizen | 
				citizen
					beMildSymptom;
					randomDuration ].
			totalPopulation := totalPopulation + population ] ].
	severeSymptomPopulationField number in: [ :population | 
		population > 0 ifTrue: [ 
			| newCitizens |
			newCitizens := aCMIDAIRModel
				               createN: population
				               randomlyLocatedEntities: CMIDAIRCitizen
				               playerName: ''.
			newCitizens do: [ :citizen | 
				citizen
					beSevereSymptom;
					randomDuration ].
			totalPopulation := totalPopulation + population ] ].
	1000 - totalPopulation in: [ :population | 
		population > 0 ifTrue: [ 
			| newCitizens |
			newCitizens := aCMIDAIRModel
				               createN: population
				               randomlyLocatedEntities: CMIDAIRCitizen
				               playerName: ''.
			totalPopulation := totalPopulation + population ] ]
]
