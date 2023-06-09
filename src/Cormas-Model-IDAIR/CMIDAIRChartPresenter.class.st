Class {
	#name : #CMIDAIRChartPresenter,
	#superclass : #CMR3ChartPresenter,
	#category : #'Cormas-Model-IDAIR-UI'
}

{ #category : #initialization }
CMIDAIRChartPresenter >> initializePresenters [

	optionsPresenter := CMSpChartOptionsPresenter
		                    owner: self
		                    on: self cormasModel.
	roassalChartPresenter := CMIDAIRChartDiagram
		                         owner: self
		                         on: self cormasModel.
	self roassalChartPresenter plotChart:
		self roassalChartPresenter currentCanvas
]

{ #category : #updating }
CMIDAIRChartPresenter >> newMaxX: aNumber [

	roassalChartPresenter newMaxX: aNumber
]

{ #category : #updating }
CMIDAIRChartPresenter >> updateChart [

	roassalChartPresenter updateChart
]
