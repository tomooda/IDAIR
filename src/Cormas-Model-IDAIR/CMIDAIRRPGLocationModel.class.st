Class {
	#name : #CMIDAIRRPGLocationModel,
	#superclass : #CMIDAIRLocationModel,
	#instVars : [
		'urbanRectangles',
		'suburbanRectangles',
		'hospitalRectangles',
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
	point := aCMIDAIRLocation coordinates.
	color := Color transparent.
	self urbanRectanglesDo: [ :rect | 
		(rect containsPoint: point) ifTrue: [ 
			color := self urbanColor mixed: 0.9 with: color ] ].
	self suburbanRectanglesDo: [ :rect | 
		(rect containsPoint: point) ifTrue: [ 
			color := self suburbanColor mixed: 0.9 with: color ] ].
	self hospitalRectanglesDo: [ :rect | 
		(rect containsPoint: point) ifTrue: [ 
			color := self hospitalColor mixed: 0.9 with: color ] ].
	^ color
]

{ #category : #private }
CMIDAIRRPGLocationModel >> computeHospitalRectangles [

	^ self subclassResponsibility
]

{ #category : #private }
CMIDAIRRPGLocationModel >> computeSuburbanRectangles [

	^ self subclassResponsibility
]

{ #category : #private }
CMIDAIRRPGLocationModel >> computeUrbanRectangles [

	^ self subclassResponsibility
]

{ #category : #'class access' }
CMIDAIRRPGLocationModel >> defaultLocationDynamicsClass [

	^ CMIDAIRRPGLocationDynamics
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

{ #category : #accessing }
CMIDAIRRPGLocationModel >> hospitalRectangles [

	^ hospitalRectangles ifNil: [ 
		  hospitalRectangles := self computeHospitalRectangles ]
]

{ #category : #enumerating }
CMIDAIRRPGLocationModel >> hospitalRectanglesDo: aBlock [

	self hospitalRectangles do: aBlock
]

{ #category : #initialization }
CMIDAIRRPGLocationModel >> initialize [

	super initialize.
	urbanColor := Color blue mixed: 0.2 with: Color white.
	suburbanColor := Color green mixed: 0.2 with: Color white.
	hospitalColor := Color red mixed: 0.1 with: Color white
]

{ #category : #accessing }
CMIDAIRRPGLocationModel >> rectangleForDesignator: aSymbol player: aCMIDAIRCitizen [

	| index |
	index := aCMIDAIRCitizen contactProfile playerIndex.
	index = 0 ifTrue: [ index := 6 atRandom ].
	aSymbol = #urban ifTrue: [ ^ self urbanRectangles at: index ].
	aSymbol = #suburban ifTrue: [ ^ self suburbanRectangles at: index ].
	aSymbol = #hospital ifTrue: [ ^ self hospitalRectangles at: index ].
	^ nil
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

{ #category : #accessing }
CMIDAIRRPGLocationModel >> suburbanRectangles [

	^ suburbanRectangles ifNil: [ 
		  suburbanRectangles := self computeSuburbanRectangles ]
]

{ #category : #enumerating }
CMIDAIRRPGLocationModel >> suburbanRectanglesDo: aBlock [

	self suburbanRectangles do: aBlock
]

{ #category : #accessing }
CMIDAIRRPGLocationModel >> urbanColor [

	^ urbanColor
]

{ #category : #accessing }
CMIDAIRRPGLocationModel >> urbanColor: aColor [

	urbanColor := aColor
]

{ #category : #accessing }
CMIDAIRRPGLocationModel >> urbanRectangles [
	^ urbanRectangles ifNil: [ urbanRectangles := self computeUrbanRectangles ]
]

{ #category : #enumerating }
CMIDAIRRPGLocationModel >> urbanRectanglesDo: aBlock [

	self urbanRectangles do: aBlock
]
