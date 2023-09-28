Class {
	#name : #CMIDAIRRPGCitizenChartPresenter,
	#superclass : #SpPresenterWithModel,
	#instVars : [
		'riskChart'
	],
	#category : #'Cormas-Model-IDAIR-RPG-UI'
}

{ #category : #specs }
CMIDAIRRPGCitizenChartPresenter class >> defaultSpec [

	^ SpBoxLayout newVertical
		  add: #riskChart;
		  yourself
]

{ #category : #drawing }
CMIDAIRRPGCitizenChartPresenter >> drawRiskChart: aCanvas [

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
CMIDAIRRPGCitizenChartPresenter >> initializePresenters [

	super initializePresenters.
	riskChart := self newRoassal script: [ :canvas | 
		             self drawRiskChart: canvas ]
]

{ #category : #accessing }
CMIDAIRRPGCitizenChartPresenter >> refresh [

	riskChart refresh
]
