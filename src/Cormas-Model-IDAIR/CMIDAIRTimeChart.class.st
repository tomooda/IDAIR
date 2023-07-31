Class {
	#name : #CMIDAIRTimeChart,
	#superclass : #CMIDAIRChart,
	#instVars : [
		'startTimeSlider',
		'endTimeSlider'
	],
	#category : #'Cormas-Model-IDAIR-UI-Prototype'
}

{ #category : #layout }
CMIDAIRTimeChart class >> defaultLayout [

	^ SpBoxLayout newVertical
		  add: #roassal;
		  add: #startTimeSlider expand: false;
		  add: #endTimeSlider expand: false;
		  yourself
]

{ #category : #examples }
CMIDAIRTimeChart class >> example [

	^ self new openWithSpec
]

{ #category : #initialization }
CMIDAIRTimeChart >> initializePresenters [

	super initializePresenters.
	startTimeSlider := self newSlider
		                   label: 'start';
		                   min: 1;
		                   max: 200;
		                   quantum: 1;
		                   value: 1;
		                   whenValueChangedDo: [ roassal refresh ];
		                   yourself.
	endTimeSlider := self newSlider
		                 label: 'end';
		                 min: 1;
		                 max: 200;
		                 quantum: 1;
		                 value: 200;
		                 whenValueChangedDo: [ roassal refresh ];
		                 yourself
]

{ #category : #drawing }
CMIDAIRTimeChart >> visualize: aCanvas [

	| minX maxX x charts |
	enabledItems ifEmpty: [ ^ self ].
	minX := startTimeSlider value max: 1.
	maxX := endTimeSlider value rounded min: amountsByDay size.
	x := minX rounded to: maxX.
	charts := enabledItems collect: [ :resource | 
		          | chart decorations shape |
		          chart := RSChart new.
		          chart
			          container: aCanvas;
			          title: resource;
			          extent: 800 @ 100;
			          minValueX: minX;
			          maxValueX: maxX;
			          minValueY: 0.
		          chart
			          addPlot: (RSLinePlot new
					           x: x
					           y:
						           (x collect: [ :xx | 
								            (amountsByDay at: xx) at: resource ]));
			          addDecoration: (RSVerticalTick new
					           numberOfTicks: 4;
					           fontSize: 10;
					           asFloat);
			          addDecoration: (RSHorizontalTick new
					           numberOfTicks: 4;
					           fontSize: 10;
					           asFloat).
		          decorations := OrderedCollection new.
		          events keysAndValuesDo: [ :t :es | 
			          | d |
			          d := RSXMarkerDecoration new value: t.
			          chart addDecoration: d.
			          decorations add: d -> (String cr join: es) ].
		          shape := chart asShape.
		          decorations do: [ :d | 
			          d key createdShapes first @ (RSPopup text: d value) ].
		          shape ].
	RSVerticalLineLayout on: charts.
	aCanvas addAll: charts.
	aCanvas when: RSExtentChangedEvent do: [ 
		aCanvas camera
			zoomToFit: aCanvas extent
			rectangle: aCanvas encompassingRectangle.
		aCanvas signalUpdate ]
]
