Class {
	#name : #CMIDAIRRPGCitizenChartPresenter,
	#superclass : #SpPresenterWithModel,
	#instVars : [
		'riskChart',
		'wellbeingChart'
	],
	#category : #'Cormas-Model-IDAIR-RPG-UI'
}

{ #category : #specs }
CMIDAIRRPGCitizenChartPresenter class >> defaultSpec [

	^ SpBoxLayout newVertical
		  add: #wellbeingChart;
		  yourself
]

{ #category : #accessing }
CMIDAIRRPGCitizenChartPresenter >> cormasModel [

	^ self model ifNotNil: #cormasModel
]

{ #category : #drawing }
CMIDAIRRPGCitizenChartPresenter >> drawWellbeingChart: aCanvas [

	| patientsChart wbpChart populationChart |
	aCanvas color: Color white.
	patientsChart := self cormasModel patientsChart.
	wbpChart := self cormasModel wellbeingPointsChart.
	populationChart := self cormasModel populationChart.
	RSVerticalLineLayout new
		alignCenter;
		gapSize: 10;
		on: { 
				patientsChart.
				wbpChart.
				populationChart }.
	aCanvas
		addShape: patientsChart;
		addShape: wbpChart;
		addShape: populationChart.
	RSZoomToFitCanvasInteraction new zoomToFitOnStart: aCanvas
]

{ #category : #initialization }
CMIDAIRRPGCitizenChartPresenter >> initializePresenters [

	super initializePresenters.
	wellbeingChart := self newRoassal script: [ :canvas | 
		                  self drawWellbeingChart: canvas ]
]

{ #category : #accessing }
CMIDAIRRPGCitizenChartPresenter >> refresh [

	wellbeingChart refresh
]
