Class {
	#name : #CMIDAIRRSScatterPlot,
	#superclass : #RSScatterPlot,
	#instVars : [
		'radius'
	],
	#category : #'Cormas-Model-IDAIR-RPG-UI'
}

{ #category : #initialization }
CMIDAIRRSScatterPlot >> initialize [

	super initialize.
	radius := 4
]

{ #category : #accessing }
CMIDAIRRSScatterPlot >> radius [

	^ radius
]

{ #category : #accessing }
CMIDAIRRSScatterPlot >> radius: aNumber [

	radius := aNumber
]

{ #category : #rendering }
CMIDAIRRSScatterPlot >> renderIn: canvas [

	| newPoint color |
	color := self computeColor.
	self checkAssertion.
	ellipses := (1 to: xValues size)
		            collect: [ :notUsed | 
			            self shape copy
				            radius: radius;
				            color: color ]
		            as: RSGroup.
	xValues doWithIndex: [ :xt :i | 
		| yt et |
		et := ellipses at: i.
		yt := yValues at: i.
		newPoint := self scalePoint: xt @ yt.
		(self isPointWellDefined: newPoint) ifTrue: [ 
			et model: xt @ yt.
			et translateTo: newPoint.
			canvas add: et ] ]
]
