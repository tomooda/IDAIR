Class {
	#name : #CMIDAIRRPGPlayersChartPresenter,
	#superclass : #SpPresenterWithModel,
	#instVars : [
		'roassal',
		'newMild',
		'newSevere',
		'newRecovering',
		'newRecovered',
		'newDead'
	],
	#category : #'Cormas-Model-IDAIR-Contact-RPG'
}

{ #category : #specs }
CMIDAIRRPGPlayersChartPresenter class >> defaultSpec [

	^ SpBoxLayout newVertical
		  add: #roassal;
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
					 title: name;
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
		                yourself
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
	self model cormasModel submodelAt: #disease do: [ :diseaseModel | 
		newMild number: diseaseModel numberOfNewMild.
		newSevere number: diseaseModel numberOfNewSevere.
		newRecovering number: diseaseModel numberOfNewRecovering.
		newRecovered number: diseaseModel numberOfNewRecovered ]
]
