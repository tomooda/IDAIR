Class {
	#name : #CMIDAIRRPGLocationModelFor6,
	#superclass : #CMIDAIRRPGLocationModel,
	#category : #'Cormas-Model-IDAIR-Location-RPG'
}

{ #category : #enumerating }
CMIDAIRRPGLocationModelFor6 >> hospitalRectanglesDo: aBlock [

	^ self cormasModel spaceModel in: [ :space | 
		  space column @ space line ]
]
