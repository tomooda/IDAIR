Class {
	#name : #CMIDAIRBarsChart,
	#superclass : #CMIDAIRSnapshotChart,
	#instVars : [
		'layoutDropList'
	],
	#category : #'Cormas-Model-IDAIR-UI-Prototype'
}

{ #category : #examples }
CMIDAIRBarsChart class >> example [

	^ self new openWithSpec
]

{ #category : #drawing }
CMIDAIRBarsChart >> visualize: aCanvas [

	self amounts ifNotNil: [ :amounts | 
		| chart |
		chart := RSChart new.
		chart container: aCanvas.
		chart maxValueX: 100.
		chart barWidths: amounts values.
		chart addDecoration: RSHorizontalTick new integer.
		chart addDecoration: (RSVerticalTick new fromNames: amounts keys).
		chart title: 'Day ' , self date asString.
		chart build ].

	aCanvas when: RSExtentChangedEvent do: [ 
		aCanvas camera
			zoomToFit: aCanvas extent
			rectangle: aCanvas encompassingRectangle.
		aCanvas signalUpdate ]
]
