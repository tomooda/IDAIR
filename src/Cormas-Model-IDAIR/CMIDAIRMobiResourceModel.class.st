Class {
	#name : #CMIDAIRMobiResourceModel,
	#superclass : #CMIDAIRResourceModel,
	#instVars : [
		'numICUs',
		'numBeds',
		'currentMasks',
		'maxMasks',
		'masksSupply',
		'maskWearingRate',
		'currentOxygen',
		'maxOxygen',
		'oxygenSupply'
	],
	#category : #'Cormas-Model-IDAIR-Resource-Mobi'
}

{ #category : #accessing }
CMIDAIRMobiResourceModel class >> submodelName [

	^ 'Mask,Oxygen,Bed,ICU'
]

{ #category : #converting }
CMIDAIRMobiResourceModel >> asPresenter [

	^ CMIDAIRMobiResourceModelPresenter on: self
]

{ #category : #control }
CMIDAIRMobiResourceModel >> consume: anInteger [

	self cormasModel theCitizens do: [ :citizen | 
		citizen resourceDynamics
			hasMask: false;
			hasOxygen: false.
		citizen isInCommunity ifTrue: [ 
			currentMasks >= 1 ifTrue: [ 
				currentMasks := currentMasks - 1.
				citizen resourceDynamics hasMask: true ] ].

		citizen isICUed ifTrue: [ 
			currentOxygen >= 1
				ifTrue: [ 
					currentOxygen := currentOxygen - 1.
					citizen resourceDynamics hasOxygen: true ]
				ifFalse: [ citizen beDead ] ] ]
]

{ #category : #accessing }
CMIDAIRMobiResourceModel >> currentMasks [

	^ currentMasks
]

{ #category : #accessing }
CMIDAIRMobiResourceModel >> currentMasks: aNumber [

	currentMasks := aNumber
]

{ #category : #accessing }
CMIDAIRMobiResourceModel >> currentOxygen [

	^ currentOxygen
]

{ #category : #accessing }
CMIDAIRMobiResourceModel >> currentOxygen: aNumber [

	currentOxygen := aNumber
]

{ #category : #defaults }
CMIDAIRMobiResourceModel >> defaultCitizenResourceDynamicsClass [

	^ CMIDAIRMobiCitizenResourceDynamics
]

{ #category : #initialization }
CMIDAIRMobiResourceModel >> init [

	
]

{ #category : #initialization }
CMIDAIRMobiResourceModel >> initialize [

	super initialize.
	numICUs := 2.0.
	numBeds := 10.0.
	currentMasks := 100.0.
	maxMasks := 10000.0.
	masksSupply := 100.0.
	maskWearingRate := 0.7.
	currentOxygen := 10.0.
	maxOxygen := 20.0.
	oxygenSupply := 5.0
]

{ #category : #accessing }
CMIDAIRMobiResourceModel >> initializers [

	^ {  }
]

{ #category : #accessing }
CMIDAIRMobiResourceModel >> maskWearingRate [

	^ maskWearingRate
]

{ #category : #accessing }
CMIDAIRMobiResourceModel >> maskWearingRate: aNumber [

	maskWearingRate := aNumber
]

{ #category : #accessing }
CMIDAIRMobiResourceModel >> masksSupply [

	^ masksSupply
]

{ #category : #accessing }
CMIDAIRMobiResourceModel >> masksSupply: aNumber [

	masksSupply := aNumber
]

{ #category : #accessing }
CMIDAIRMobiResourceModel >> maxMasks [

	^ maxMasks
]

{ #category : #accessing }
CMIDAIRMobiResourceModel >> maxMasks: aNumber [

	maxMasks := aNumber
]

{ #category : #accessing }
CMIDAIRMobiResourceModel >> maxOxygen [

	^ maxOxygen
]

{ #category : #accessing }
CMIDAIRMobiResourceModel >> maxOxygen: aNumber [

	maxOxygen := aNumber
]

{ #category : #accessing }
CMIDAIRMobiResourceModel >> numBeds [

	^ numBeds
]

{ #category : #accessing }
CMIDAIRMobiResourceModel >> numBeds: aNumber [

	numBeds := aNumber
]

{ #category : #accessing }
CMIDAIRMobiResourceModel >> numICUs [

	^ numICUs
]

{ #category : #accessing }
CMIDAIRMobiResourceModel >> numICUs: aNumber [

	numICUs := aNumber
]

{ #category : #'resource managements' }
CMIDAIRMobiResourceModel >> occupyBed: aCMIDAIRCitizen [

	numBeds = 0
		ifTrue: [ aCMIDAIRCitizen resourceDynamics hasBed: false ]
		ifFalse: [ 
			numBeds := numBeds - 1.
			aCMIDAIRCitizen resourceDynamics hasBed: true ]
]

{ #category : #'resource managements' }
CMIDAIRMobiResourceModel >> occupyICU: aCMIDAIRCitizen [

	numICUs = 0
		ifTrue: [ aCMIDAIRCitizen resourceDynamics hasICU: false ]
		ifFalse: [ 
			numICUs := numICUs - 1.
			aCMIDAIRCitizen resourceDynamics hasICU: true ]
]

{ #category : #accessing }
CMIDAIRMobiResourceModel >> oxygenSupply [

	^ oxygenSupply
]

{ #category : #accessing }
CMIDAIRMobiResourceModel >> oxygenSupply: aNumber [

	oxygenSupply := aNumber
]

{ #category : #'resource managements' }
CMIDAIRMobiResourceModel >> releaseBed: aCMIDAIRCitizen [

	numBeds := numBeds + 1.
	aCMIDAIRCitizen resourceDynamics hasBed: false
]

{ #category : #'resource managements' }
CMIDAIRMobiResourceModel >> releaseICU: aCMIDAIRCitizen [

	numICUs := numICUs + 1.
	aCMIDAIRCitizen resourceDynamics hasICU: false
]

{ #category : #accessing }
CMIDAIRMobiResourceModel >> socialPreventionResourceFactor [

	^ currentMasks asFloat
	  / (self cormasModel numberOfCitizensInCommunity * maskWearingRate) 
		  min: 1.0
]

{ #category : #control }
CMIDAIRMobiResourceModel >> supply: anInteger [

	| days |
	days := self daysPerStep.
	currentMasks := masksSupply * days + currentMasks min: maxMasks.
	currentOxygen := oxygenSupply * days + currentOxygen min: maxOxygen
]
