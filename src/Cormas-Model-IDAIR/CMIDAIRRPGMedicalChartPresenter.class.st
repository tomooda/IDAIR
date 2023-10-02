Class {
	#name : #CMIDAIRRPGMedicalChartPresenter,
	#superclass : #SpPresenterWithModel,
	#instVars : [
		'patientsChart',
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
CMIDAIRRPGMedicalChartPresenter class >> defaultSpec [

	^ SpBoxLayout newVertical
		  add: #patientsChart expand: true;
		  yourself
]

{ #category : #drawing }
CMIDAIRRPGMedicalChartPresenter >> _drawPatientsChart: aCanvas [

	| chart barPlot emptyBar mildBar severeBar deathBar shapes shape plot |
	aCanvas color: Color white.
	chart := RSChart new.
	chart extent: 400 @ 200.
	chart colors: (NSScale ordinal range: { Color black }).
	barPlot := (chart barWidths: { 
				            self currentNumberOfDead.
				            self currentNumberOfSevereSymptom.
				            self currentNumberOfMildSymptom.
				            0 })
		           barSize: 20;
		           yourself.
	chart addDecoration: (RSVerticalTick new
			 fromNames: { 'Death'. 'Severe symptom'. 'Mild symptom'.
				 '' };
			 fontSize: 12).
	chart
		addDecoration: (RSHorizontalTick new
				 fontSize: 12;
				 integer;
				 yourself);
		title: 'Current number of cases'.
	shapes := chart build shapes.
	emptyBar := barPlot bars fourth.
	mildBar := barPlot bars third.
	severeBar := barPlot bars second.
	deathBar := barPlot bars first.
	emptyBar color: Color transparent.
	mildBar color: Color orange.
	severeBar color: Color red.
	deathBar color: Color black.
	shapes add: (shape := RSArrowedLine new
			          startPoint: mildBar encompassingRectangle left + 20
				          @ emptyBar encompassingRectangle bottom;
			          endPoint: mildBar encompassingRectangle left + 20
				          @ mildBar encompassingRectangle top;
			          width: 2).
	shapes add: (shape := RSLabel new
			          text: newMild printString;
			          translateMiddleLeftTo:
				          shape encompassingRectangle rightCenter + (5 @ 0)).
	shapes add: (shape := RSArrowedLine new
			          startPoint: shape encompassingRectangle right + 10
				          @ mildBar encompassingRectangle top;
			          endPoint: shape encompassingRectangle right + 10
				          @ emptyBar encompassingRectangle bottom;
			          width: 2).
	shapes add: (shape := RSLabel new
			          text: newRecovered printString;
			          translateMiddleLeftTo:
				          shape encompassingRectangle rightCenter + (5 @ 0)).
	shapes add: (shape := RSArrowedLine new
			          startPoint: shape encompassingRectangle right + 10
				          @ emptyBar encompassingRectangle bottom;
			          endPoint: shape encompassingRectangle right + 10
				          @ severeBar encompassingRectangle top;
			          width: 2).
	shapes add: (shape := RSLabel new
			          text: newSevere printString;
			          translateMiddleLeftTo:
				          shape encompassingRectangle right + 5
				          @ (mildBar encompassingRectangle bottom
					           + severeBar encompassingRectangle top * 0.5)).
	shapes add: (shape := RSArrowedLine new
			          startPoint: shape encompassingRectangle right + 10
				          @ mildBar encompassingRectangle bottom;
			          endPoint: shape encompassingRectangle right + 10
				          @ severeBar encompassingRectangle top;
			          width: 2).
	shapes add: (shape := RSLabel new
			          text: newWorsened printString;
			          translateMiddleLeftTo:
				          shape encompassingRectangle rightCenter + (5 @ 0)).
	shapes add: (shape := RSArrowedLine new
			          startPoint: shape encompassingRectangle right + 10
				          @ severeBar encompassingRectangle top;
			          endPoint: shape encompassingRectangle right + 10
				          @ mildBar encompassingRectangle bottom;
			          width: 2).
	shapes add: (shape := RSLabel new
			          text: newRecovering printString;
			          translateMiddleLeftTo:
				          shape encompassingRectangle rightCenter + (5 @ 0)).


	shapes add: (shape := RSArrowedLine new
			          startPoint: deathBar encompassingRectangle left + 20
				          @ severeBar encompassingRectangle bottom;
			          endPoint: deathBar encompassingRectangle left + 20
				          @ deathBar encompassingRectangle top;
			          width: 2).
	shapes add: (shape := RSLabel new
			          text: newDead printString;
			          translateMiddleLeftTo:
				          shape encompassingRectangle rightCenter + (5 @ 0)).
	aCanvas addShape: (RSComposite new shapes: shapes).


	chart := RSChart new.
	chart extent: 400 @ 80.
	chart colors: (NSScale ordinal range: { 
				 Color lightGray.
				 Color darkGray }).

	chart addPlot: (plot := CMIDAIRRSBedsPlot new
			         x1: { 
					         numBeds.
					         numICUs }
			         x2: { 
					         occupiedBeds.
					         occupiedICUs }
			         y: (1 to: 2);
			         yourself).
	chart addDecoration: (RSHorizontalTick new
			 integer;
			 fontSize: 12;
			 numberOfTicks: 10).
	chart
		addDecoration: (RSVerticalTick new
				 fromNames: { 'Regular beds'. 'ICU beds' };
				 fontSize: 12);
		title: 'Current status of hospital beds'.
	aCanvas addShape: (RSComposite new shapes: chart build shapes).
	RSVerticalLineLayout new
		alignCenter;
		gapSize: 10;
		on: aCanvas shapes.
	RSZoomToFitCanvasInteraction new zoomToFitOnStart: aCanvas
]

{ #category : #accessing }
CMIDAIRRPGMedicalChartPresenter >> currentNumberOfDead [

	| num |
	num := 0.
	self model cormasModel theCitizens do: [ :citizen | 
		citizen diseaseDynamics isDead ifTrue: [ num := num + 1 ] ].
	^ num
]

{ #category : #accessing }
CMIDAIRRPGMedicalChartPresenter >> currentNumberOfMildSymptom [

	| num |
	num := 0.
	self model cormasModel theCitizens do: [ :citizen | 
		citizen diseaseDynamics isMildSymptom ifTrue: [ num := num + 1 ] ].
	^ num
]

{ #category : #accessing }
CMIDAIRRPGMedicalChartPresenter >> currentNumberOfRecovered [

	| num |
	num := 0.
	self model cormasModel theCitizens do: [ :citizen | 
		citizen diseaseDynamics isRecovered ifTrue: [ num := num + 1 ] ].
	^ num
]

{ #category : #accessing }
CMIDAIRRPGMedicalChartPresenter >> currentNumberOfSevereSymptom [

	| num |
	num := 0.
	self model cormasModel theCitizens do: [ :citizen | 
		citizen diseaseDynamics isSevereSymptom ifTrue: [ num := num + 1 ] ].
	^ num
]

{ #category : #drawing }
CMIDAIRRPGMedicalChartPresenter >> drawPatientsChart: aCanvas [

	| chart barPlot susceptibleBar recoveredBar mildBar severeBar deathBar shapes shape plot |
	aCanvas color: Color white.
	chart := RSChart new.
	chart extent: 400 @ 200.
	chart colors: (NSScale ordinal range: { Color black }).
	barPlot := (chart barWidths: { 
				            self currentNumberOfDead.
				            self currentNumberOfSevereSymptom.
				            self currentNumberOfMildSymptom.
								self currentNumberOfRecovered.
				            0 })
		           barSize: 20;
		           yourself.
	chart addDecoration: (RSVerticalTick new
			 fromNames: { 'Death'. 'Severe symptom'. 'Mild symptom'. 'Recovered' .
				 '' };
			 fontSize: 12).
	chart
		addDecoration: (RSHorizontalTick new
				 fontSize: 12;
				 integer;
				 yourself);
		title: 'Current number of cases'.
	shapes := chart build shapes.
	susceptibleBar := barPlot bars fifth.
	recoveredBar := barPlot bars fourth.
	mildBar := barPlot bars third.
	severeBar := barPlot bars second.
	deathBar := barPlot bars first.
	susceptibleBar color: Color transparent.
	recoveredBar color: Color blue.
	mildBar color: Color orange.
	severeBar color: Color red.
	deathBar color: Color black.
	shapes add: (shape := RSArrowedLine new
			          startPoint: mildBar encompassingRectangle left + 20
				          @ susceptibleBar encompassingRectangle bottom;
			          endPoint: mildBar encompassingRectangle left + 20
				          @ mildBar encompassingRectangle top;
			          width: 2).
	shapes add: (shape := RSLabel new
			          text: newMild printString;
			          translateMiddleLeftTo:
				          shape encompassingRectangle right + 5
				          @ (recoveredBar encompassingRectangle bottom
					           + mildBar encompassingRectangle top * 0.5)).
	shapes add: (shape := RSArrowedLine new
			          startPoint: shape encompassingRectangle right + 10
				          @ susceptibleBar encompassingRectangle bottom;
			          endPoint: shape encompassingRectangle right + 10
				          @ severeBar encompassingRectangle top;
			          width: 2).
	shapes add: (shape := RSLabel new
			          text: newSevere printString;
			          translateMiddleLeftTo:
				          shape encompassingRectangle right + 5
				          @ (mildBar encompassingRectangle bottom
					           + severeBar encompassingRectangle top * 0.5)).
	shapes add: (shape := RSArrowedLine new
			          startPoint: shape encompassingRectangle right + 10
				          @ mildBar encompassingRectangle top;
			          endPoint: shape encompassingRectangle right + 10
				          @ recoveredBar encompassingRectangle bottom;
			          width: 2).
	shapes add: (shape := RSLabel new
			          text: newRecovered printString;
			          translateMiddleLeftTo:
				          shape encompassingRectangle rightCenter + (5 @ 0)).
	shapes add: (shape := RSArrowedLine new
			          startPoint: shape encompassingRectangle right + 10
				          @ mildBar encompassingRectangle bottom;
			          endPoint: shape encompassingRectangle right + 10
				          @ severeBar encompassingRectangle top;
			          width: 2).
	shapes add: (shape := RSLabel new
			          text: newWorsened printString;
			          translateMiddleLeftTo:
				          shape encompassingRectangle rightCenter + (5 @ 0)).
	shapes add: (shape := RSArrowedLine new
			          startPoint: shape encompassingRectangle right + 10
				          @ severeBar encompassingRectangle top;
			          endPoint: shape encompassingRectangle right + 10
				          @ mildBar encompassingRectangle bottom;
			          width: 2).
	shapes add: (shape := RSLabel new
			          text: newRecovering printString;
			          translateMiddleLeftTo:
				          shape encompassingRectangle rightCenter + (5 @ 0)).


	shapes add: (shape := RSArrowedLine new
			          startPoint: deathBar encompassingRectangle left + 20
				          @ severeBar encompassingRectangle bottom;
			          endPoint: deathBar encompassingRectangle left + 20
				          @ deathBar encompassingRectangle top;
			          width: 2).
	shapes add: (shape := RSLabel new
			          text: newDead printString;
			          translateMiddleLeftTo:
				          shape encompassingRectangle rightCenter + (5 @ 0)).
	aCanvas addShape: (RSComposite new shapes: shapes).


	chart := RSChart new.
	chart extent: 400 @ 80.
	chart colors: (NSScale ordinal range: { 
				 Color lightGray.
				 Color darkGray }).

	chart addPlot: (plot := CMIDAIRRSBedsPlot new
			         x1: { 
					         numBeds.
					         numICUs }
			         x2: { 
					         occupiedBeds.
					         occupiedICUs }
			         y: (1 to: 2);
			         yourself).
	chart addDecoration: (RSHorizontalTick new
			 integer;
			 fontSize: 12;
			 numberOfTicks: 10).
	chart
		addDecoration: (RSVerticalTick new
				 fromNames: { 'Regular beds'. 'ICU beds' };
				 fontSize: 12);
		title: 'Current status of hospital beds'.
	aCanvas addShape: (RSComposite new shapes: chart build shapes).
	RSVerticalLineLayout new
		alignCenter;
		gapSize: 10;
		on: aCanvas shapes.
	RSZoomToFitCanvasInteraction new zoomToFitOnStart: aCanvas
]

{ #category : #initialization }
CMIDAIRRPGMedicalChartPresenter >> initializePresenters [

	super initializePresenters.
	patientsChart := self newRoassal script: [ :canvas | 
		                 self drawPatientsChart: canvas ].
	newMild := 0.
	newSevere := 0.
	newWorsened := 0.
	newRecovering := 0.
	newRecovered := 0.
	newDead := 0.
	numBeds := 0.
	occupiedBeds := 0.
	numICUs := 0.
	occupiedICUs := 0
]

{ #category : #initialization }
CMIDAIRRPGMedicalChartPresenter >> modelChanged [

	super modelChanged.
	self updateNewPatients.
	self updateResources
]

{ #category : #enumerating }
CMIDAIRRPGMedicalChartPresenter >> playersDo: aBlock [

	self model ifNotNil: [ :contactModel | 
		contactModel namesAndPlayersDo: [ :name :player | 
			aBlock value: player ] ]
]

{ #category : #accessing }
CMIDAIRRPGMedicalChartPresenter >> refresh [

	self
		updateNewPatients;
		updateResources.
	patientsChart refresh
]

{ #category : #initialization }
CMIDAIRRPGMedicalChartPresenter >> updateNewPatients [

	self model cormasModel submodelAt: #disease do: [ :diseaseModel | 
		newMild := diseaseModel numberOfNewMild.
		newSevere := diseaseModel numberOfNewSevere.
		newWorsened := diseaseModel numberOfNewWorsened.
		newRecovering := diseaseModel numberOfNewRecovering.
		newRecovered := diseaseModel numberOfNewRecovered.
		newDead := diseaseModel numberOfNewDead ]
]

{ #category : #initialization }
CMIDAIRRPGMedicalChartPresenter >> updateResources [

	self model cormasModel submodelAt: #resource do: [ :resourceModel | 
		numBeds := resourceModel numBeds.
		occupiedBeds := resourceModel occupiedBeds.
		numICUs := resourceModel numICUs.
		occupiedICUs := resourceModel occupiedICUs ]
]
