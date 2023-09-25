Class {
	#name : #CMIDAIRRPGLocationModelFor6,
	#superclass : #CMIDAIRRPGLocationModel,
	#category : #'Cormas-Model-IDAIR-Location-RPG'
}

{ #category : #private }
CMIDAIRRPGLocationModelFor6 >> computeHospitalRectangles [

	| extent width height |
	extent := self extent.
	width := extent x / 3.
	height := extent y / 3.
	^ { 
		  (width * 5 / 2 + 1 @ (height * 2 + 1) extent: width / 2 @ height).
		  (width * 5 / 2 + 1 @ (height * 2 + 1) extent: width / 2 @ height).
		  (width * 5 / 2 + 1 @ (height * 2 + 1) extent: width / 2 @ height).
		  (width * 5 / 2 + 1 @ (height * 2 + 1) extent: width / 2 @ height).
		  (width * 5 / 2 + 1 @ (height * 2 + 1) extent: width / 2 @ height).
		  (width * 5 / 2 + 1 @ (height * 2 + 1) extent: width / 2 @ height) }
]

{ #category : #private }
CMIDAIRRPGLocationModelFor6 >> computeSuburbanRectangles [

	| extent width height |
	extent := self extent.
	width := extent x / 3.
	height := extent y / 3.
	^ { 
		  (width / 2 + 1 @ 1 extent: width @ height).
		  (width * 3 / 2 + 1 @ 1 extent: width @ height).
		  (1 @ (height + 1) extent: width @ height).
		  (width * 2 + 1 @ (height + 1) extent: width @ height).
		  (width / 2 + 1 @ (height * 2 + 1) extent: width @ height).
		  (width * 3 / 2 + 1 @ (height * 2 + 1) extent: width @ height) }
]

{ #category : #private }
CMIDAIRRPGLocationModelFor6 >> computeUrbanRectangles [

	| extent width height |
	extent := self extent.
	width := extent x / 3.
	height := extent y / 3.
	^ { 
		  (width + 1 @ (height + 1) extent: width @ height).
		  (width + 1 @ (height + 1) extent: width @ height).
		  (width + 1 @ (height + 1) extent: width @ height).
		  (width + 1 @ (height + 1) extent: width @ height).
		  (width + 1 @ (height + 1) extent: width @ height).
		  (width + 1 @ (height + 1) extent: width @ height) }
]

{ #category : #enumerating }
CMIDAIRRPGLocationModelFor6 >> hospitalRectanglesDo: aBlock [

	^ self cormasModel spaceModel in: [ :space | 
		  space column @ space line ]
]
