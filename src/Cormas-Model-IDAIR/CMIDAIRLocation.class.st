Class {
	#name : #CMIDAIRLocation,
	#superclass : #CMSpatialEntityElement,
	#instVars : [
		'baseColor'
	],
	#category : #'Cormas-Model-IDAIR-Core'
}

{ #category : #'accessing-colors' }
CMIDAIRLocation >> baseColor [

	^ baseColor ifNil: [ baseColor := self createBaseColor ]
]

{ #category : #'accessing-colors' }
CMIDAIRLocation >> color [

	^ self baseColor
]

{ #category : #'accessing-colors' }
CMIDAIRLocation >> createBaseColor [

	self cormasModel
		submodelAt: #location
		do: [ :locationModel | ^ locationModel baseColorFor: self ].
	^ Color white
]

{ #category : #pov }
CMIDAIRLocation >> defaultPov [

	<pov>
	^ self baseColor
]

{ #category : #testing }
CMIDAIRLocation >> hasInfected [

	^ (self occupants: CMIDAIRCitizen) anySatisfy: #isInfected
]

{ #category : #accessing }
CMIDAIRLocation >> infectionRate [

	| total infected |
	total := 0.
	infected := 0.
	(self occupants: CMIDAIRCitizen) do: [ :citizen | 
		citizen isInfected ifTrue: [ infected := infected + 1 ].
		total := total + 1 ].
	^ infected asFloat / total asFloat
]

{ #category : #initialization }
CMIDAIRLocation >> initialize [

	super initialize.
	
]

{ #category : #accessing }
CMIDAIRLocation >> numberOfInfected [

	| infected |
	infected := 0.
	(self occupants: CMIDAIRCitizen) do: [ :citizen | 
		citizen isInfected ifTrue: [ infected := infected + 1 ] ].
	^ infected
]

{ #category : #pov }
CMIDAIRLocation >> pov [

	<pov>
	^ self defaultPov
]

{ #category : #enumerating }
CMIDAIRLocation >> residentsDo: aBlock [

	^ self subclassResponsibility
]
