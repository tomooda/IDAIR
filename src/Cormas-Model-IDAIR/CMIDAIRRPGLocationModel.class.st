Class {
	#name : #CMIDAIRRPGLocationModel,
	#superclass : #CMIDAIRLocationModel,
	#instVars : [
		'urbanColor',
		'suburbanColor',
		'hospitalColor'
	],
	#category : #'Cormas-Model-IDAIR-Location-RPG'
}

{ #category : #accessing }
CMIDAIRRPGLocationModel class >> submodelName [

	^ 'RPG'
]

{ #category : #accessing }
CMIDAIRRPGLocationModel >> baseColorFor: aCMIDAIRLocation [

	| point color |
	point := aCMIDAIRLocation center.
	color := Color white.
	self urbanRectanglesDo: [ :rect | 
		(rect containsPoint: point) ifTrue: [ 
			color := self urbanColor mixed: 0.3 with: color ] ].
	self suburbanRectanglesDo: [ :rect | 
		(rect containsPoint: point) ifTrue: [ 
			color := self suburbanColor mixed: 0.2 with: color ] ].
	self hospitalRectanglesDo: [ :rect | 
		(rect containsPoint: point) ifTrue: [ 
			color := self hospitalColor mixed: 0.2 with: color ] ].
	^ color
]

{ #category : #accessing }
CMIDAIRRPGLocationModel >> extent [

	^ self spaceModelDo: [ :spaceModel | 
		  spaceModel column @ spaceModel line ]
]

{ #category : #accessing }
CMIDAIRRPGLocationModel >> hospitalColor [

	^ hospitalColor
]

{ #category : #accessing }
CMIDAIRRPGLocationModel >> hospitalColor: aColor [

	hospitalColor := aColor
]

{ #category : #enumerating }
CMIDAIRRPGLocationModel >> hospitalRectanglesDo: aBlock [

	^ self subclassResponsibility
]

{ #category : #enumerating }
CMIDAIRRPGLocationModel >> spaceModel [

	^ self cormasModel spaceModel
]

{ #category : #enumerating }
CMIDAIRRPGLocationModel >> spaceModelDo: aBlock [

	^ aBlock value: self cormasModel spaceModel
]

{ #category : #accessing }
CMIDAIRRPGLocationModel >> suburbanColor [

	^ suburbanColor
]

{ #category : #accessing }
CMIDAIRRPGLocationModel >> suburbanColor: aColor [

	suburbanColor := aColor
]

{ #category : #enumerating }
CMIDAIRRPGLocationModel >> suburbanRectanglesDo: aBlock [

	^ self subclassResponsibility
]

{ #category : #accessing }
CMIDAIRRPGLocationModel >> urbanColor [

	^ urbanColor
]

{ #category : #accessing }
CMIDAIRRPGLocationModel >> urbanColor: aColor [

	urbanColor := aColor
]

{ #category : #enumerating }
CMIDAIRRPGLocationModel >> urbanRectanglesDo: aBlock [

	^ self subclassResponsibility
]
