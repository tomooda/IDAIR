Class {
	#name : #CMIDAIRChartDiagram,
	#superclass : #CMR3ChartDiagram,
	#category : #'Cormas-Model-IDAIR-UI'
}

{ #category : #accessing }
CMIDAIRChartDiagram >> maxYValue [

	^ self scaleToMinMax
		  ifTrue: [ self detectMaxProbeValue ]
		  ifFalse: [ self owner maxYValue ]
]

{ #category : #'accessing - chart' }
CMIDAIRChartDiagram >> newMaxX: aNumber [

	newMaxX := aNumber.
	self updateChart
]

{ #category : #'accessing - chart' }
CMIDAIRChartDiagram >> timeChanged: aNewTimeStep [

	
]

{ #category : #updating }
CMIDAIRChartDiagram >> updateChart [

	self removeAllElements.

	self chartBuilder maxValueX: newMaxX + 1.
	self updateYAxis.

	self updateProbes
]
