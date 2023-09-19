Class {
	#name : #CMIDAIRRPGPlayersChartPresenter,
	#superclass : #SpPresenterWithModel,
	#instVars : [
		'roassal'
	],
	#category : #'Cormas-Model-IDAIR-Contact-RPG'
}

{ #category : #specs }
CMIDAIRRPGPlayersChartPresenter class >> defaultSpec [

	^ SpBoxLayout newVertical
		  add: #roassal;
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
		           self drawBarChart: canvas ]
]

{ #category : #enumerating }
CMIDAIRRPGPlayersChartPresenter >> playersDo: aBlock [

	self model ifNotNil: [ :contactModel | 
		contactModel namesAndPlayersDo: [ :name :player | 
			aBlock value: player ] ]
]

{ #category : #accessing }
CMIDAIRRPGPlayersChartPresenter >> refresh [

	roassal refresh
]
