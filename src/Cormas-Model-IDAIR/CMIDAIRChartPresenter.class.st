Class {
	#name : #CMIDAIRChartPresenter,
	#superclass : #CMR3ChartPresenter,
	#instVars : [
		'updateButton'
	],
	#category : #'Cormas-Model-IDAIR-UI'
}

{ #category : #specs }
CMIDAIRChartPresenter class >> defaultSpec [

	^ SpPanedLayout newLeftToRight
		  add: (SpBoxLayout newVertical
				   add: #optionsPresenter;
				   add: #updateButton expand: false);
		  positionOfSlider: 25 percent;
		  add: #roassalChartPresenter;
		  yourself
]

{ #category : #initialization }
CMIDAIRChartPresenter >> initializePresenters [

	optionsPresenter := CMSpChartOptionsPresenter
		                    owner: self
		                    on: self cormasModel.
	roassalChartPresenter := CMIDAIRChartDiagram
		                         owner: self
		                         on: self cormasModel.
	updateButton := self newButton
		                icon: (Smalltalk ui iconNamed: #smallUpdate);
		                action: [ self updateChart ];
		                yourself.
	self roassalChartPresenter plotChart:
		self roassalChartPresenter currentCanvas
]

{ #category : #accessing }
CMIDAIRChartPresenter >> maxYValue [

	^ self optionsPresenter fixedMaxYValue
]

{ #category : #updating }
CMIDAIRChartPresenter >> newMaxX: aNumber [

	roassalChartPresenter newMaxX: aNumber
]

{ #category : #updating }
CMIDAIRChartPresenter >> updateChart [

	roassalChartPresenter updateChart
]
