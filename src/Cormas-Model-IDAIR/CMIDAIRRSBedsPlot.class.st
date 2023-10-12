Class {
	#name : #CMIDAIRRSBedsPlot,
	#superclass : #RSDoubleBarPlot,
	#category : #'Cormas-Model-IDAIR-RPG-UI'
}

{ #category : #rendering }
CMIDAIRRSBedsPlot >> createXScale [

	super createXScale.
	x2Scale := xScale
]

{ #category : #accessing }
CMIDAIRRSBedsPlot >> secondColor: aColor [

	secondColor := aColor
]
