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
CMIDAIRLocation >> createBaseColor [

	self cormasModel
		submodelAt: #location
		do: [ :locationModel | ^ locationModel baseColorFor: self ].
	^ Color white
]

{ #category : #testing }
CMIDAIRLocation >> hasInfected [

	^ (self occupants: CMIDAIRCitizen) anySatisfy: #isInfected
]

{ #category : #initialization }
CMIDAIRLocation >> initialize [

	super initialize.
	
]

{ #category : #pov }
CMIDAIRLocation >> pov [

	<pov>
	^ Color white
]

{ #category : #enumerating }
CMIDAIRLocation >> residentsDo: aBlock [

	^ self subclassResponsibility
]

{ #category : #'accessing-colors' }
CMIDAIRLocation >> suburbanColor [

	^ Color green mixed: 0.1 with: Color white
]

{ #category : #'accessing-colors' }
CMIDAIRLocation >> urbanColor [

	^ Color blue mixed: 0.2 with: Color white
]
