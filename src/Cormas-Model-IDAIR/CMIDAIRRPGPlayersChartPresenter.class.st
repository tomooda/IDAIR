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
		'numICUs'
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

	aCanvas color: Color transparent.

	self model namesAndPlayersDo: [ :name :citizen | 
		| histogram chart |
		histogram := OrderedDictionary new.
		citizen diseaseDynamics class colors keysDo: [ :dynamics | 
			histogram at: dynamics put: 0 ].
		citizen cormasModel theCitizens do: [ :c | 
			c contactProfile player == citizen ifTrue: [ 
				| dynamics |
				dynamics := c diseaseDynamics name.
				histogram at: dynamics put: (histogram at: dynamics) + 1 ] ].
		chart := RSChart new.
		chart extent: 60 @ 400.
		chart maxValueY: histogram values sum.
		chart colors:
			(NSScale ordinal range: citizen diseaseDynamics class colors values).
		histogram values inject: 0 into: [ :bottom :value | 
			(chart barHeights: { value }) bottom: { bottom }.
			bottom + value ].
		chart
			addDecoration: (RSVerticalTick new
					 fontSize: 12;
					 integer;
					 yourself);
			addDecoration: (RSChartTitleDecoration new
					 title:
						 name , '(' , citizen contactProfile wellbeingPoints printString
						 , ')';
					 fontSize: 10).
		aCanvas addShape: (RSComposite new shapes: chart build shapes) ].
	RSHorizontalLineLayout on: aCanvas shapes.
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
