Class {
	#name : #CMIDAIRRPGPopulationChartPresenter,
	#superclass : #SpPresenterWithModel,
	#instVars : [
		'populationChart',
		'susceptibleCheckbox',
		'infectedCheckbox',
		'recoveredCheckbox',
		'deadCheckbox',
		'occupiedBedsCheckbox',
		'occupiedICUsCheckbox',
		'decDayButton',
		'incDayButton',
		'dayField',
		'historyText'
	],
	#category : #'Cormas-Model-IDAIR-RPG-UI'
}

{ #category : #'accessing-color' }
CMIDAIRRPGPopulationChartPresenter class >> deadColor [

	^ Color black
]

{ #category : #'accessing-color' }
CMIDAIRRPGPopulationChartPresenter class >> deadIcon [

	| form |
	form := Form extent: 16 @ 16 depth: 32.
	form getCanvas fillColor: self deadColor.
	^ form
]

{ #category : #specs }
CMIDAIRRPGPopulationChartPresenter class >> defaultSpec [

	^ SpPanedLayout newHorizontal
		  positionOfSlider: 0.75;
		  add: #populationChart;
		  add: (SpBoxLayout newVertical
				   add: (SpBoxLayout newHorizontal
						    vAlignCenter;
						    add: #susceptibleCheckbox width: 16;
						    add: self susceptibleIcon asPresenter expand: false;
						    add: ' Susceptible' asPresenter)
				   expand: false;
				   add: (SpBoxLayout newHorizontal
						    vAlignCenter;
						    add: #infectedCheckbox width: 16;
						    add: self infectedIcon asPresenter expand: false;
						    add: ' Infected' asPresenter)
				   expand: false;
				   add: (SpBoxLayout newHorizontal
						    vAlignCenter;
						    add: #recoveredCheckbox width: 16;
						    add: self recoveredIcon asPresenter expand: false;
						    add: ' Recovered' asPresenter)
				   expand: false;
				   add: (SpBoxLayout newHorizontal
						    vAlignCenter;
						    add: #deadCheckbox width: 16;
						    add: self deadIcon asPresenter expand: false;
						    add: ' Dead' asPresenter)
				   expand: false;
				   add: (SpBoxLayout newHorizontal
						    vAlignCenter;
						    add: #occupiedICUsCheckbox width: 16;
						    add: self occupiedICUsIcon asPresenter expand: false;
						    add: ' Occupied ICU beds' asPresenter)
				   expand: false;
				   add: (SpBoxLayout newHorizontal
						    vAlignCenter;
						    add: #occupiedBedsCheckbox width: 16;
						    add: self occupiedBedsIcon asPresenter expand: false;
						    add: ' Occupied regular beds ' asPresenter)
				   expand: false;
				   add: '' asPresenter expand: false;
				   add: (SpBoxLayout newHorizontal
						    vAlignCenter;
						    add: #decDayButton width: self buttonHeight;
						    add: #dayField width: 100;
						    add: #incDayButton width: self buttonHeight;
						    yourself)
				   expand: false;
				   add: #historyText;
				   yourself);
		  yourself
]

{ #category : #'accessing-color' }
CMIDAIRRPGPopulationChartPresenter class >> infectedColor [

	^ Color red
]

{ #category : #'accessing-color' }
CMIDAIRRPGPopulationChartPresenter class >> infectedIcon [

	| form |
	form := Form extent: 16 @ 16 depth: 32.
	form getCanvas fillColor: self infectedColor.
	^ form
]

{ #category : #'accessing-color' }
CMIDAIRRPGPopulationChartPresenter class >> occupiedBedsColor [

	^ Color lightGray
]

{ #category : #'accessing-color' }
CMIDAIRRPGPopulationChartPresenter class >> occupiedBedsIcon [

	| form |
	form := Form extent: 16 @ 16 depth: 32.
	form getCanvas fillColor: self occupiedBedsColor.
	^ form
]

{ #category : #'accessing-color' }
CMIDAIRRPGPopulationChartPresenter class >> occupiedICUsColor [

	^ Color darkGray
]

{ #category : #'accessing-color' }
CMIDAIRRPGPopulationChartPresenter class >> occupiedICUsIcon [

	| form |
	form := Form extent: 16 @ 16 depth: 32.
	form getCanvas fillColor: self occupiedICUsColor.
	^ form
]

{ #category : #'accessing-color' }
CMIDAIRRPGPopulationChartPresenter class >> recoveredColor [

	^ Color blue
]

{ #category : #'accessing-color' }
CMIDAIRRPGPopulationChartPresenter class >> recoveredIcon [

	| form |
	form := Form extent: 16 @ 16 depth: 32.
	form getCanvas fillColor: self recoveredColor.
	^ form
]

{ #category : #'accessing-color' }
CMIDAIRRPGPopulationChartPresenter class >> susceptibleColor [

	^ Color green
]

{ #category : #'accessing-color' }
CMIDAIRRPGPopulationChartPresenter class >> susceptibleIcon [

	| form |
	form := Form extent: 16 @ 16 depth: 32.
	form getCanvas fillColor: self susceptibleColor.
	^ form
]

{ #category : #'accessing-color' }
CMIDAIRRPGPopulationChartPresenter >> deadColor [

	^ self class deadColor
]

{ #category : #drawing }
CMIDAIRRPGPopulationChartPresenter >> drawPopulationChart: aCanvas [

	| chart daysPerStep day |
	aCanvas color: Color white.
	chart := RSChart new.
	chart container: aCanvas.
	chart extent: 400 @ 300.
	daysPerStep := self model daysPerStep.
	self model submodelAt: #disease do: [ :diseaseModel | 
		susceptibleCheckbox state ifTrue: [ 
			diseaseModel historyOfSusceptive ifNotEmpty: [ :history | 
				chart addPlot: (RSLinePlot new
						 x: (1 to: history size * daysPerStep by: daysPerStep)
						 y: history;
						 color: self susceptibleColor) ] ].
		infectedCheckbox state ifTrue: [ 
			diseaseModel historyOfInfected ifNotEmpty: [ :history | 
				chart addPlot: (RSLinePlot new
						 x: (1 to: history size * daysPerStep by: daysPerStep)
						 y: history;
						 color: self infectedColor) ] ].
		recoveredCheckbox state ifTrue: [ 
			diseaseModel historyOfRecovered ifNotEmpty: [ :history | 
				chart addPlot: (RSLinePlot new
						 x: (1 to: history size * daysPerStep by: daysPerStep)
						 y: history;
						 color: self recoveredColor) ] ].
		deadCheckbox state ifTrue: [ 
			diseaseModel historyOfDead ifNotEmpty: [ :history | 
				chart addPlot: (RSLinePlot new
						 x: (1 to: history size * daysPerStep by: daysPerStep)
						 y: history;
						 color: self deadColor) ] ] ].
	self model submodelAt: #resource do: [ :resourceModel | 
		occupiedBedsCheckbox state ifTrue: [ 
			resourceModel historyOfOccupiedBeds ifNotEmpty: [ :history | 
				chart addPlot: (RSLinePlot new
						 x: (1 to: history size * daysPerStep by: daysPerStep)
						 y: history;
						 color: self occupiedBedsColor) ] ].
		occupiedICUsCheckbox state ifTrue: [ 
			resourceModel historyOfOccupiedICUs ifNotEmpty: [ :history | 
				chart addPlot: (RSLinePlot new
						 x: (1 to: history size * daysPerStep by: daysPerStep)
						 y: history;
						 color: self occupiedICUsColor) ] ] ].
	chart addDecoration: (RSVerticalTick new
			 integer;
			 fontSize: 12).
	chart
		addDecoration: (RSHorizontalTick new
				 fontSize: 12;
				 integer;
				 yourself);
		xlabel: 'Time (day)';
		title: 'Course of the situation'.
	chart plots
		ifNotEmpty: [ :plots | 
			day := dayField number.
			day * daysPerStep <= plots first xValues last ifTrue: [ 
				chart addDecoration: (RSXMarkerDecoration new value: day) ] ]
		ifEmpty: [ chart addPlot: (RSLinePlot new x: { 0 } y: { 0 }) ].
	chart build.
	RSZoomToFitCanvasInteraction new zoomToFitOnStart: aCanvas
]

{ #category : #'accessing-color' }
CMIDAIRRPGPopulationChartPresenter >> infectedColor [

	^ self class infectedColor
]

{ #category : #initialization }
CMIDAIRRPGPopulationChartPresenter >> initializePresenters [

	super initializePresenters.
	populationChart := self newRoassal script: [ :canvas | 
		                   self drawPopulationChart: canvas ].
	susceptibleCheckbox := self newCheckBox
		                       state: true;
		                       color: self susceptibleColor;
		                       whenChangedDo: [ self refresh ];
		                       yourself.
	infectedCheckbox := self newCheckBox
		                    state: true;
		                    whenChangedDo: [ self refresh ];
		                    yourself.
	recoveredCheckbox := self newCheckBox
		                     state: true;
		                     whenChangedDo: [ self refresh ];
		                     yourself.
	deadCheckbox := self newCheckBox
		                state: true;
		                whenChangedDo: [ self refresh ];
		                yourself.
	occupiedBedsCheckbox := self newCheckBox
		                        state: true;
		                        whenChangedDo: [ self refresh ];
		                        yourself.
	occupiedICUsCheckbox := self newCheckBox
		                        state: true;
		                        whenChangedDo: [ self refresh ];
		                        yourself.
	decDayButton := self newButton
		                label: '<';
		                action: [ 
			                dayField number:
					                (dayField number - 1 // 7 - 1 * 7 + 1 max: 1) ];
		                yourself.
	incDayButton := self newButton
		                label: '>';
		                action: [ 
			                dayField number:
					                dayField number - 1 // 7 + 1 * 7 + 1 ];
		                yourself.
	dayField := self newNumberInput
		            beInteger;
		            number: 1;
		            climbRate: 7;
		            whenNumberChangedDo: [ :day | 
			            populationChart refresh.
			            historyText text:
					            (self model historyAt: day - 1 // 7 + 1) ];
		            yourself.
	historyText := self newText
]

{ #category : #accessing }
CMIDAIRRPGPopulationChartPresenter >> modelChanged [

	super modelChanged.
	self model ifNotNil: [ :model | 
		dayField text: (model timeStep + 1) printString ]
]

{ #category : #'accessing-color' }
CMIDAIRRPGPopulationChartPresenter >> occupiedBedsColor [

	^ self class occupiedBedsColor
]

{ #category : #'accessing-color' }
CMIDAIRRPGPopulationChartPresenter >> occupiedICUsColor [

	^ self class occupiedICUsColor
]

{ #category : #'accessing-color' }
CMIDAIRRPGPopulationChartPresenter >> recoveredColor [

	^ self class recoveredColor
]

{ #category : #accessing }
CMIDAIRRPGPopulationChartPresenter >> refresh [

	populationChart refresh.
	dayField text: (self model timeStep + 1) printString
]

{ #category : #'accessing-color' }
CMIDAIRRPGPopulationChartPresenter >> susceptibleColor [

	^ self class susceptibleColor
]
