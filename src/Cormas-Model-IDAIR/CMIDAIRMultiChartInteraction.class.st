Class {
	#name : #CMIDAIRMultiChartInteraction,
	#superclass : #RSKeyNavigationCanvasInteraction,
	#instVars : [
		'currentShapeIndex'
	],
	#category : #'Cormas-Model-IDAIR-RPG-UI'
}

{ #category : #accessing }
CMIDAIRMultiChartInteraction >> currentShapeIndex [

	^ currentShapeIndex
]

{ #category : #initialization }
CMIDAIRMultiChartInteraction >> initialize [
	super initialize.
	currentShapeIndex :=0
]

{ #category : #events }
CMIDAIRMultiChartInteraction >> moveFrom: fromShape to: toShape [

	| canvas camera oldPosition newPosition |
	canvas := toShape canvas.
	camera := canvas camera.
	oldPosition := camera position.
	canvas camera
		zoomToFit: canvas extent * 0.9
		rectangle: toShape encompassingRectangle.
	canvas signalUpdate
	"newPosition := camera position.

	canvas newAnimation
		duration: 200 milliSeconds;
		easing: RSEasingInterpolator backOut;
		from: oldPosition;
		to: newPosition;
		onStepDo: [ :aPosition | 
			camera translateTo: aPosition.
			canvas signalUpdate ]"
]

{ #category : #hooks }
CMIDAIRMultiChartInteraction >> onShape: aCanvas [

	super onShape: aCanvas.
	aCanvas when: RSExtentChangedEvent do: [ aCanvas zoomToFit ]
]

{ #category : #events }
CMIDAIRMultiChartInteraction >> processKeyDown: evt [

	| newIndex keyName shapes |
	newIndex := nil.
	keyName := evt keyName.
	shapes := evt canvas shapes.
	(keyName = #SPACE or: [ keyName = #RETURN ]) ifTrue: [ newIndex := 0 ].
	keyName = #UP ifTrue: [ newIndex := 1 max: currentShapeIndex - 1 ].
	keyName = #DOWN ifTrue: [ 
		newIndex := shapes size min: currentShapeIndex + 1 ].
	newIndex ifNil: [ ^ super processKeyDown: evt ].
	self
		moveFrom:
		(shapes at: currentShapeIndex ifAbsent: [ shapes first canvas ])
		to: (shapes at: newIndex ifAbsent: [ shapes first canvas ]).
	currentShapeIndex := newIndex
]
