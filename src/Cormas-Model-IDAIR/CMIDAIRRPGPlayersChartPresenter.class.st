Class {
	#name : #CMIDAIRRPGPlayersChartPresenter,
	#superclass : #SpPresenterWithModel,
	#instVars : [
		'roassal',
		'newMild',
		'newSevere',
		'newRecovering',
		'newRecovered',
		'newDead',
		'occupiedBeds',
		'numBeds',
		'occupiedICUs',
		'numICUs',
		'newWorsened'
	],
	#category : #'Cormas-Model-IDAIR-RPG-UI'
}

{ #category : #specs }
CMIDAIRRPGPlayersChartPresenter class >> defaultSpec [

	^ SpBoxLayout newVertical
		  add: #roassal;
		  add: (SpBoxLayout newHorizontal
				   add: (SpBoxLayout newVertical
						    add: (SpBoxLayout newHorizontal
								     add: 'new mild symptoms' asPresenter width: 200;
								     add: #newMild width: 100;
								     yourself)
						    expand: false;
						    add: (SpBoxLayout newHorizontal
								     add: 'new severe symptoms' asPresenter width: 200;
								     add: #newSevere width: 100;
								     yourself)
						    expand: false;
						    add: (SpBoxLayout newHorizontal
								     add: 'new worsened symptoms' asPresenter width: 200;
								     add: #newWorsened width: 100;
								     yourself)
						    expand: false;
						    add: (SpBoxLayout newHorizontal
								     add: 'new recovering to mild' asPresenter width: 200;
								     add: #newRecovering width: 100;
								     yourself)
						    expand: false;
						    add: (SpBoxLayout newHorizontal
								     add: 'new recovered patients' asPresenter width: 200;
								     add: #newRecovered width: 100;
								     yourself)
						    expand: false;
						    add: (SpBoxLayout newHorizontal
								     add: 'new deaths' asPresenter width: 200;
								     add: #newDead width: 100;
								     yourself)
						    expand: false;
						    yourself)
				   expand: true;
				   add: (SpBoxLayout newVertical
						    add: (SpBoxLayout newHorizontal
								     add: 'Regular Beds ' width: 100;
								     add: #occupiedBeds expand: false;
								     add: ' / ' expand: false;
								     add: #numBeds expand: false;
								     yourself)
						    expand: false;
						    add: (SpBoxLayout newHorizontal
								     add: 'ICU Beds   ' width: 100;
								     add: #occupiedICUs expand: false;
								     add: ' / ' expand: false;
								     add: #numICUs expand: false;
								     yourself)
						    expand: false;
						    yourself)
				   expand: true;
				   yourself)
		  expand: false;
		  yourself
]

{ #category : #drawing }
CMIDAIRRPGPlayersChartPresenter >> drawBarChart: aCanvas [

	| names patients deaths chart legends |
	names := self model players keys asArray.
	patients := Array new: names size withAll: 0.
	deaths := Array new: names size withAll: 0.
	self model cormasModel theCitizens do: [ :citizen | 
		| playerIndex |
		playerIndex := citizen contactProfile playerIndex.
		playerIndex > 0 ifTrue: [ 
			citizen diseaseDynamics isSusceptible not ifTrue: [ 
				citizen diseaseDynamics isDead
					ifTrue: [ 
					deaths at: playerIndex put: (deaths at: playerIndex) + 1 ]
					ifFalse: [ 
					patients at: playerIndex put: (patients at: playerIndex) + 1 ] ] ] ].
	aCanvas color: Color white.
	chart := RSChart new.
	chart extent: names size * 80 @ 100.
	chart colors: (NSScale ordinal range: { 
				 (Color red mixed: 0.3 with: Color white).
				 Color black }).
	chart barHeights: patients.
	(chart barHeights: deaths) bottom: patients.
	chart addDecoration: (RSHorizontalTick new
			 fromNames: names;
			 fontSize: 12).
	chart
		addDecoration: (RSVerticalTick new
				 fontSize: 12;
				 integer;
				 yourself);
		addDecoration: RSVerticalTick new integer;
		ylabel: 'Risk (%)';
		title: 'Cummulated risk of each player''s actions'.
	aCanvas addShape: (RSComposite new shapes: chart build shapes).
	legends := RSLegend new.
	legends layout horizontal.
	#( Infection Death ) doWithIndex: [ :legendLabel :index | 
		legends
			text: legendLabel
			withBoxColor: (chart plots at: index) computeColor ].
	aCanvas addShape: (RSComposite new shapes: legends build shapes).
	RSHorizontalLineLayout new
		alignBottom;
		applyOn: aCanvas shapes.
	RSZoomToFitCanvasInteraction new zoomToFitOnStart: aCanvas
]

{ #category : #initialization }
CMIDAIRRPGPlayersChartPresenter >> initializePresenters [

	super initializePresenters.
	roassal := self newRoassal script: [ :canvas | 
		           self drawBarChart: canvas ].
	newMild := self newNumberInput
		           disable;
		           beInteger;
		           number: 0;
		           yourself.
	newSevere := self newNumberInput
		             disable;
		             beInteger;
		             number: 0;
		             yourself.
	newWorsened := self newNumberInput
		             disable;
		             beInteger;
		             number: 0;
		             yourself.
	newRecovering := self newNumberInput
		                 disable;
		                 beInteger;
		                 number: 0;
		                 yourself.
	newRecovered := self newNumberInput
		                disable;
		                beInteger;
		                number: 0;
		                yourself.
	newDead := self newNumberInput
		           disable;
		           beInteger;
		           number: 0;
		           yourself.
	numBeds := self newLabel
		           label: '?';
		           yourself.
	occupiedBeds := self newLabel
		                label: '0';
		                yourself.
	numICUs := self newLabel
		           label: '?';
		           yourself.
	occupiedICUs := self newLabel
		                label: '0';
		                yourself
]

{ #category : #initialization }
CMIDAIRRPGPlayersChartPresenter >> modelChanged [

	super modelChanged.
	self updateNewPatients.
	self updateResources
]

{ #category : #enumerating }
CMIDAIRRPGPlayersChartPresenter >> playersDo: aBlock [

	self model ifNotNil: [ :contactModel | 
		contactModel namesAndPlayersDo: [ :name :player | 
			aBlock value: player ] ]
]

{ #category : #accessing }
CMIDAIRRPGPlayersChartPresenter >> refresh [

	roassal refresh.
	self
		updateNewPatients;
		updateResources
]

{ #category : #initialization }
CMIDAIRRPGPlayersChartPresenter >> updateNewPatients [

	self model cormasModel submodelAt: #disease do: [ :diseaseModel | 
		newMild number: diseaseModel numberOfNewMild.
		newSevere number: diseaseModel numberOfNewSevere.
		newWorsened number: diseaseModel numberOfNewWorsened.
		newRecovering number: diseaseModel numberOfNewRecovering.
		newRecovered number: diseaseModel numberOfNewRecovered.
		newDead number: diseaseModel numberOfNewDead ]
]

{ #category : #initialization }
CMIDAIRRPGPlayersChartPresenter >> updateResources [

	self model cormasModel submodelAt: #resource do: [ :resourceModel | 
		numBeds label: resourceModel numBeds printString.
		occupiedBeds label: resourceModel occupiedBeds printString.
		numICUs label: resourceModel numICUs printString.
		occupiedICUs label: resourceModel occupiedICUs printString ]
]
