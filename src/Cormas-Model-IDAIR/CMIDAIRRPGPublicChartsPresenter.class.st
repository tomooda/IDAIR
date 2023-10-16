Class {
	#name : #CMIDAIRRPGPublicChartsPresenter,
	#superclass : #SpPresenterWithModel,
	#instVars : [
		'populationChart',
		'susceptibleCheckbox',
		'infectedCheckbox',
		'recoveredCheckbox',
		'deadCheckbox',
		'occupiedBedsCheckbox',
		'occupiedICUsCheckbox',
		'historyText',
		'wellbeingChart',
		'roundField',
		'decRoundButton',
		'incRoundButton',
		'activityChart',
		'preventionChart'
	],
	#category : #'Cormas-Model-IDAIR-RPG-UI'
}

{ #category : #'accessing-color' }
CMIDAIRRPGPublicChartsPresenter class >> deadColor [

	^ Color black
]

{ #category : #'accessing-color' }
CMIDAIRRPGPublicChartsPresenter class >> deadIcon [

	| form |
	form := Form extent: 16 @ 16 depth: 32.
	form getCanvas fillColor: self deadColor.
	^ form
]

{ #category : #specs }
CMIDAIRRPGPublicChartsPresenter class >> defaultSpec [

	| populationChartSpec |
	populationChartSpec := SpPanedLayout newHorizontal
		                       positionOfSlider: 0.75;
		                       add: #populationChart;
		                       add: (SpBoxLayout newVertical
				                        add: (SpBoxLayout newHorizontal
						                         vAlignCenter;
						                         add: #susceptibleCheckbox width: 16;
						                         add: self susceptibleIcon asPresenter
						                         expand: false;
						                         add: ' Susceptible' asPresenter)
				                        expand: false;
				                        add: (SpBoxLayout newHorizontal
						                         vAlignCenter;
						                         add: #infectedCheckbox width: 16;
						                         add: self infectedIcon asPresenter
						                         expand: false;
						                         add: ' Infected' asPresenter)
				                        expand: false;
				                        add: (SpBoxLayout newHorizontal
						                         vAlignCenter;
						                         add: #recoveredCheckbox width: 16;
						                         add: self recoveredIcon asPresenter
						                         expand: false;
						                         add: ' Recovered' asPresenter)
				                        expand: false;
				                        add: (SpBoxLayout newHorizontal
						                         vAlignCenter;
						                         add: #deadCheckbox width: 16;
						                         add: self deadIcon asPresenter
						                         expand: false;
						                         add: ' Dead' asPresenter)
				                        expand: false;
				                        add: (SpBoxLayout newHorizontal
						                         vAlignCenter;
						                         add: #occupiedICUsCheckbox width: 16;
						                         add: self occupiedICUsIcon asPresenter
						                         expand: false;
						                         add: ' Occupied ICU beds' asPresenter)
				                        expand: false;
				                        add: (SpBoxLayout newHorizontal
						                         vAlignCenter;
						                         add: #occupiedBedsCheckbox width: 16;
						                         add: self occupiedBedsIcon asPresenter
						                         expand: false;
						                         add:
							                         ' Occupied regular beds ' asPresenter)
				                        expand: false;
				                        add: '' asPresenter expand: false;
				                        add: (SpBoxLayout newHorizontal
						                         vAlignCenter;
						                         add: #decRoundButton
						                         width: self buttonHeight;
						                         add: #roundField width: 100;
						                         add: #incRoundButton
						                         width: self buttonHeight;
						                         yourself)
				                        expand: false;
				                        add: #historyText;
				                        yourself);
		                       yourself.

	^ SpPanedLayout newVertical
		  positionOfSlider: 0.7;
		  add: populationChartSpec;
		  add: (SpBoxLayout newHorizontal
				   add: #wellbeingChart;
				   add: #activityChart;
				   add: #preventionChart);
		  yourself
]

{ #category : #'accessing-color' }
CMIDAIRRPGPublicChartsPresenter class >> infectedColor [

	^ Color red
]

{ #category : #'accessing-color' }
CMIDAIRRPGPublicChartsPresenter class >> infectedIcon [

	| form |
	form := Form extent: 16 @ 16 depth: 32.
	form getCanvas fillColor: self infectedColor.
	^ form
]

{ #category : #'accessing-color' }
CMIDAIRRPGPublicChartsPresenter class >> occupiedBedsColor [

	^ Color lightGray
]

{ #category : #'accessing-color' }
CMIDAIRRPGPublicChartsPresenter class >> occupiedBedsIcon [

	| form |
	form := Form extent: 16 @ 16 depth: 32.
	form getCanvas fillColor: self occupiedBedsColor.
	^ form
]

{ #category : #'accessing-color' }
CMIDAIRRPGPublicChartsPresenter class >> occupiedICUsColor [

	^ Color darkGray
]

{ #category : #'accessing-color' }
CMIDAIRRPGPublicChartsPresenter class >> occupiedICUsIcon [

	| form |
	form := Form extent: 16 @ 16 depth: 32.
	form getCanvas fillColor: self occupiedICUsColor.
	^ form
]

{ #category : #'accessing-color' }
CMIDAIRRPGPublicChartsPresenter class >> recoveredColor [

	^ Color blue
]

{ #category : #'accessing-color' }
CMIDAIRRPGPublicChartsPresenter class >> recoveredIcon [

	| form |
	form := Form extent: 16 @ 16 depth: 32.
	form getCanvas fillColor: self recoveredColor.
	^ form
]

{ #category : #'accessing-color' }
CMIDAIRRPGPublicChartsPresenter class >> susceptibleColor [

	^ Color green
]

{ #category : #'accessing-color' }
CMIDAIRRPGPublicChartsPresenter class >> susceptibleIcon [

	| form |
	form := Form extent: 16 @ 16 depth: 32.
	form getCanvas fillColor: self susceptibleColor.
	^ form
]

{ #category : #'accessing-color' }
CMIDAIRRPGPublicChartsPresenter >> deadColor [

	^ self class deadColor
]

{ #category : #drawing }
CMIDAIRRPGPublicChartsPresenter >> drawActivityChart: aCanvas [

	aCanvas addShape: self model activityChart.
	CMIDAIRZoomToFitInteraction new onShape: aCanvas
]

{ #category : #drawing }
CMIDAIRRPGPublicChartsPresenter >> drawHospitalChart: aCanvas [

	| charts |
	charts := { 
		          self model patientsChart.
		          self model hospitalChart }.
	RSVerticalLineLayout new
		alignCenter;
		gapSize: 10;
		on: charts.

	aCanvas addAll: charts.
	CMIDAIRZoomToFitInteraction new onShape: aCanvas
]

{ #category : #drawing }
CMIDAIRRPGPublicChartsPresenter >> drawMap: aCanvas [

	aCanvas addShape: self model map.
	CMIDAIRZoomToFitInteraction new onShape: aCanvas
]

{ #category : #drawing }
CMIDAIRRPGPublicChartsPresenter >> drawPatientsChart: aCanvas [

	aCanvas addShape: self model patientsChart.
	CMIDAIRZoomToFitInteraction new onShape: aCanvas
]

{ #category : #drawing }
CMIDAIRRPGPublicChartsPresenter >> drawPopulationChart: aCanvas [

	| chart |
	aCanvas color: Color white.
	chart := RSChart new.
	chart container: aCanvas.
	chart extent: 400 @ 300.
	self model submodelAt: #disease do: [ :diseaseModel | 
		susceptibleCheckbox state ifTrue: [ 
			diseaseModel historyOfSusceptive ifNotEmpty: [ :history | 
				chart addPlot: ((history size > 1
						  ifTrue: [ RSLinePlot new ]
						  ifFalse: [ CMIDAIRRSScatterPlot new ])
						 x: (1 to: history size) y: history;
						 color: self susceptibleColor) ] ].
		infectedCheckbox state ifTrue: [ 
			diseaseModel historyOfInfected ifNotEmpty: [ :history | 
				chart addPlot: ((history size > 1
						  ifTrue: [ RSLinePlot new ]
						  ifFalse: [ CMIDAIRRSScatterPlot new ])
						 x: (1 to: history size) y: history;
						 color: self infectedColor) ] ].
		recoveredCheckbox state ifTrue: [ 
			diseaseModel historyOfRecovered ifNotEmpty: [ :history | 
				chart addPlot: ((history size > 1
						  ifTrue: [ RSLinePlot new ]
						  ifFalse: [ CMIDAIRRSScatterPlot new ])
						 x: (1 to: history size) y: history;
						 color: self recoveredColor) ] ].
		deadCheckbox state ifTrue: [ 
			diseaseModel historyOfDead ifNotEmpty: [ :history | 
				chart addPlot: ((history size > 1
						  ifTrue: [ RSLinePlot new ]
						  ifFalse: [ CMIDAIRRSScatterPlot new ])
						 x: (1 to: history size) y: history;
						 color: self deadColor) ] ] ].
	self model submodelAt: #resource do: [ :resourceModel | 
		occupiedBedsCheckbox state ifTrue: [ 
			resourceModel historyOfOccupiedBeds ifNotEmpty: [ :history | 
				chart addPlot: ((history size > 1
						  ifTrue: [ RSLinePlot new ]
						  ifFalse: [ CMIDAIRRSScatterPlot new ])
						 x: (1 to: history size) y: history;
						 color: self occupiedBedsColor) ] ].
		occupiedICUsCheckbox state ifTrue: [ 
			resourceModel historyOfOccupiedICUs ifNotEmpty: [ :history | 
				chart addPlot: ((history size > 1
						  ifTrue: [ RSLinePlot new ]
						  ifFalse: [ CMIDAIRRSScatterPlot new ])
						 x: (1 to: history size) y: history;
						 color: self occupiedICUsColor) ] ] ].
	chart addDecoration: (RSVerticalTick new
			 integer;
			 fontSize: 12).
	chart
		addDecoration: (RSHorizontalTick new
				 numberOfTicks: (self model historySize min: 10 max: 2);
				 fontSize: 12;
				 integer;
				 yourself);
		xlabel: 'Rounds';
		title: 'Course of the situation'.
	chart plots
		ifNotEmpty: [ :plots | 
			| round |
			round := roundField number.
			round <= plots first xValues last ifTrue: [ 
				chart addDecoration: (RSXMarkerDecoration new value: round) ] ]
		ifEmpty: [ chart addPlot: (RSLinePlot new x: { 0 } y: { 0 }) ].
	chart build.
	CMIDAIRZoomToFitInteraction new onShape: aCanvas
]

{ #category : #drawing }
CMIDAIRRPGPublicChartsPresenter >> drawPreventionChart: aCanvas [

	aCanvas addShape: self model preventionChart.
	CMIDAIRZoomToFitInteraction new onShape: aCanvas
]

{ #category : #drawing }
CMIDAIRRPGPublicChartsPresenter >> drawWellbeingChart: aCanvas [

	aCanvas addShape: self model wellbeingChart.
	CMIDAIRZoomToFitInteraction new onShape: aCanvas
]

{ #category : #'accessing-color' }
CMIDAIRRPGPublicChartsPresenter >> infectedColor [

	^ self class infectedColor
]

{ #category : #initialization }
CMIDAIRRPGPublicChartsPresenter >> initializePresenters [

	super initializePresenters.
	populationChart := self newRoassal script: [ :canvas | 
		                   self drawPopulationChart: canvas ].
	susceptibleCheckbox := self newCheckBox
		                       state: false;
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
	decRoundButton := self newButton
		                  label: '<';
		                  action: [ 
			                  roundField number: (roundField number - 1 max: 1) ];
		                  yourself.
	incRoundButton := self newButton
		                  label: '>';
		                  action: [ 
			                  roundField number:
					                  (roundField number + 1
						                   min: self model historySize - 1
						                   max: 1) ];
		                  yourself.
	roundField := self newNumberInput
		              beInteger;
		              number: 1;
		              climbRate: 1;
		              whenNumberChangedDo: [ :round | 
			              populationChart refresh.
			              historyText text: (self model historyAt: round) ];
		              yourself.
	historyText := self newText.
	wellbeingChart := self newRoassal script: [ :canvas | 
		                  self drawWellbeingChart: canvas ].
	activityChart := self newRoassal script: [ :canvas | 
		                 self drawActivityChart: canvas ].
	preventionChart := self newRoassal script: [ :canvas | 
		                   self drawPreventionChart: canvas ]
]

{ #category : #accessing }
CMIDAIRRPGPublicChartsPresenter >> modelChanged [

	super modelChanged.
	self model ifNotNil: [ :model | 
		roundField text: (model historySize - 1 max: 1) printString ]
]

{ #category : #'accessing-color' }
CMIDAIRRPGPublicChartsPresenter >> occupiedBedsColor [

	^ self class occupiedBedsColor
]

{ #category : #'accessing-color' }
CMIDAIRRPGPublicChartsPresenter >> occupiedICUsColor [

	^ self class occupiedICUsColor
]

{ #category : #'accessing-color' }
CMIDAIRRPGPublicChartsPresenter >> recoveredColor [

	^ self class recoveredColor
]

{ #category : #accessing }
CMIDAIRRPGPublicChartsPresenter >> refresh [

	roundField text: (self model historySize - 1 max: 1) printString.
	{ 
		populationChart.
		wellbeingChart.
		activityChart.
		preventionChart } do: #refresh
]

{ #category : #'accessing-color' }
CMIDAIRRPGPublicChartsPresenter >> susceptibleColor [

	^ self class susceptibleColor
]
