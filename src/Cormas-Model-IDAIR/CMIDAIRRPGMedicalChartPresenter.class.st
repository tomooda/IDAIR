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
		'newWorsened',
		'bedsChart'
	],
	#category : #'Cormas-Model-IDAIR-RPG-UI'
}

{ #category : #specs }
CMIDAIRRPGMedicalChartPresenter class >> defaultSpec [

	^ SpBoxLayout newVertical
		  add: #patientsChart expand: true;
		  yourself
]

{ #category : #specs }
CMIDAIRRPGMedicalChartPresenter class >> defaultSpec2 [

	^ SpBoxLayout newVertical
		  add: #patientsChart expand: true;
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
		  expand: false
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
CMIDAIRRPGMedicalChartPresenter >> currentNumberOfSevereSymptom [

	| num |
	num := 0.
	self model cormasModel theCitizens do: [ :citizen | 
		citizen diseaseDynamics isSevereSymptom ifTrue: [ num := num + 1 ] ].
	^ num
]

{ #category : #drawing }
CMIDAIRRPGMedicalChartPresenter >> drawPatientsChart: aCanvas [

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
				 (Color blue mixed: 0.4 with: Color white).
				 (Color blue mixed: 0.4 with: Color black) }).

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
	bedsChart := self newRoassal script: [ :canvas | 
		             self drawBedsChart: canvas ].
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
	patientsChart refresh.
	bedsChart refresh
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
