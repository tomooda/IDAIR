Class {
	#name : #CMIDAIRRPGLocationDynamics,
	#superclass : #CMIDAIRLocationDynamics,
	#instVars : [
		'locationDesignators',
		'rectangle',
		'locationFactor'
	],
	#classVars : [
		'RandomGenerator'
	],
	#category : #'Cormas-Model-IDAIR-Location-RPG'
}

{ #category : #'instance creation' }
CMIDAIRRPGLocationDynamics class >> on: aCMIDAIRCitizen [

	^ self new
		  citizen: aCMIDAIRCitizen;
		  yourself
]

{ #category : #accessing }
CMIDAIRRPGLocationDynamics class >> randomGenerator [

	^ RandomGenerator ifNil: [ RandomGenerator := Random new ]
]

{ #category : #initialization }
CMIDAIRRPGLocationDynamics >> initialize [

	super initialize.
	locationDesignators := { #suburban }
]

{ #category : #accessing }
CMIDAIRRPGLocationDynamics >> locationDesignators [

	^ locationDesignators
]

{ #category : #accessing }
CMIDAIRRPGLocationDynamics >> locationDesignators: aCollectionOfSymbol [

	locationDesignators := aCollectionOfSymbol.
	self updatePosition
]

{ #category : #accessing }
CMIDAIRRPGLocationDynamics >> locationFactor [

	^ locationFactor ifNil: [ 
		  | r x y |
		  r := self random.
		  x := self random - 0.5 * r + 0.5.
		  y := self random - 0.5 * r + 0.5.
		  locationFactor := x @ y ]
]

{ #category : #accessing }
CMIDAIRRPGLocationDynamics >> locationFactor: aPoint [

	locationFactor := aPoint
]

{ #category : #accessing }
CMIDAIRRPGLocationDynamics >> player [

	^ citizen contactProfile player
]

{ #category : #accessing }
CMIDAIRRPGLocationDynamics >> playerIndex [

	^ citizen contactProfile playerIndex
]

{ #category : #accessing }
CMIDAIRRPGLocationDynamics >> position [

	rectangle ifNil: [ self updatePosition ].
	^ self rectangle origin - (0.5 @ 0.5)
	  + (self rectangle extent * self locationFactor)
]

{ #category : #accessing }
CMIDAIRRPGLocationDynamics >> random [

	^ self class randomGenerator next
]

{ #category : #accessing }
CMIDAIRRPGLocationDynamics >> rectangle [

	^ rectangle ifNil: [ rectangle := self findRectangle ]
]

{ #category : #accessing }
CMIDAIRRPGLocationDynamics >> rectangle: aRectangle [

	rectangle := aRectangle
]

{ #category : #accessing }
CMIDAIRRPGLocationDynamics >> suburbanRectangle [

	^ self citizen cormasModel
		  submodelAt: #location
		  do: [ :locationModel | 
			  locationModel suburbanRectangles at: self playerIndex ]
]

{ #category : #updating }
CMIDAIRRPGLocationDynamics >> updatePosition [

	self citizen cormasModel
		submodelAt: #location
		do: [ :locationModel | 
			rectangle ifNotNil: [ 
				| oldPosition |
				oldPosition := self position.
				(locationDesignators anySatisfy: [ :designator | 
					 (locationModel
						  rectangleForDesignator: designator
						  player: citizen) containsPoint: oldPosition ]) ifTrue: [ ^ self ] ].
			rectangle := locationModel
				             rectangleForDesignator: locationDesignators atRandom
				             player: citizen.
			citizen coordinates: self position floor ]
]

{ #category : #accessing }
CMIDAIRRPGLocationDynamics >> urbanRectangle [

	^ self citizen cormasModel
		  submodelAt: #location
		  do: [ :locationModel | 
		  locationModel urbanRectangles at: self playerIndex ]
]
