Class {
	#name : #CMIDAIRZoomToFitInteraction,
	#superclass : #RSZoomToFitCanvasInteraction,
	#category : #'Cormas-Model-IDAIR-RPG-UI'
}

{ #category : #hooks }
CMIDAIRZoomToFitInteraction >> onShape: aCanvas [

	super onShape: aCanvas.
	aCanvas when: RSExtentChangedEvent do: [ aCanvas zoomToFit ]
]
