Class {
	#name : #CMIDAIRLocation,
	#superclass : #CMSpatialEntityElement,
	#instVars : [
		'visited'
	],
	#category : #'Cormas-Model-IDAIR-Core'
}

{ #category : #accessing }
CMIDAIRLocation >> clearVisited [

	visited := false
]

{ #category : #testing }
CMIDAIRLocation >> hasInfected [

	^ (self occupants: CMIDAIRCitizen) anySatisfy: #isInfected
]

{ #category : #accessing }
CMIDAIRLocation >> homeColor [

	^ Color white
]

{ #category : #accessing }
CMIDAIRLocation >> hospitalColor [

	^ Color red mixed: 0.05 with: Color white
]

{ #category : #controlling }
CMIDAIRLocation >> ifHome: aBlock [

	self isHome ifTrue: aBlock
]

{ #category : #controlling }
CMIDAIRLocation >> ifHospital: aBlock [

	self isHospital ifTrue: aBlock
]

{ #category : #initialization }
CMIDAIRLocation >> initialize [

	super initialize.
	visited := false
]

{ #category : #testing }
CMIDAIRLocation >> isHome [

	^ self isHospital not
]

{ #category : #testing }
CMIDAIRLocation >> isHospital [

	^ self numCol > self spaceModel line
]

{ #category : #accessing }
CMIDAIRLocation >> isVisited [

	^ visited
]

{ #category : #pov }
CMIDAIRLocation >> pov [

	<pov>
	self ifHospital: [ ^ self hospitalColor ].
	self hasInfected ifTrue: [ ^ Color red alpha: 0.2 ].
	self isVisited ifTrue: [ 
		^ Color blue alpha: 0.2 ].
	^ Color white
]

{ #category : #enumerating }
CMIDAIRLocation >> residentsDo: aBlock [

	^ self subclassResponsibility
]

{ #category : #accessing }
CMIDAIRLocation >> setVisited [

	visited := true
]
