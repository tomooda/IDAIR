Class {
	#name : #CMIDAIRMobiCitizenResourceDynamics,
	#superclass : #CMIDAIRCitizenResourceDynamics,
	#instVars : [
		'hasBed',
		'hasICU',
		'hasMask',
		'hasOxygen'
	],
	#category : #'Cormas-Model-IDAIR-Resource-Mobi'
}

{ #category : #operations }
CMIDAIRMobiCitizenResourceDynamics >> citizenDead [

	self hasBed ifTrue: [ self resourceModel releaseBed: self citizen ].
	self hasICU ifTrue: [ self resourceModel releaseICU: self citizen ]
]

{ #category : #operations }
CMIDAIRMobiCitizenResourceDynamics >> citizenHospitalized [

	self hasICU ifTrue: [ self resourceModel releaseICU: self citizen ].
	self hasBed ifFalse: [ self resourceModel occupyBed: self citizen ]
]

{ #category : #operations }
CMIDAIRMobiCitizenResourceDynamics >> citizenICUed [

	self hasBed ifTrue: [ self resourceModel releaseBed: self citizen ].
	self hasICU ifFalse: [ self resourceModel occupyICU: self citizen ].
	self hasICU ifFalse: [ self citizen beDead ]
]

{ #category : #operations }
CMIDAIRMobiCitizenResourceDynamics >> citizenQuarrantined [

	self hasBed ifTrue: [ self resourceModel releaseBed: self citizen ].
	self hasICU ifTrue: [ self resourceModel releaseICU: self citizen ]
]

{ #category : #operations }
CMIDAIRMobiCitizenResourceDynamics >> citizenRecovered [

	
]

{ #category : #operations }
CMIDAIRMobiCitizenResourceDynamics >> citizenReleased [

	self hasBed ifTrue: [ self resourceModel releaseBed: self citizen ].
	self hasICU ifTrue: [ self resourceModel releaseICU: self citizen ]
]

{ #category : #accessing }
CMIDAIRMobiCitizenResourceDynamics >> hasBed [

	^ hasBed
]

{ #category : #accessing }
CMIDAIRMobiCitizenResourceDynamics >> hasBed: aBoolean [

	hasBed := aBoolean
]

{ #category : #accessing }
CMIDAIRMobiCitizenResourceDynamics >> hasICU [

	^ hasICU
]

{ #category : #accessing }
CMIDAIRMobiCitizenResourceDynamics >> hasICU: aBoolean [

	hasICU := aBoolean
]

{ #category : #testing }
CMIDAIRMobiCitizenResourceDynamics >> hasIsolation [

	^ self hasBed or: [ self hasICU ]
]

{ #category : #accessing }
CMIDAIRMobiCitizenResourceDynamics >> hasMask [

	^ hasMask
]

{ #category : #accessing }
CMIDAIRMobiCitizenResourceDynamics >> hasMask: aBoolean [

	hasMask := aBoolean
]

{ #category : #accessing }
CMIDAIRMobiCitizenResourceDynamics >> hasOxygen [

	^ hasOxygen
]

{ #category : #accessing }
CMIDAIRMobiCitizenResourceDynamics >> hasOxygen: aBoolean [

	hasOxygen := aBoolean
]

{ #category : #initialization }
CMIDAIRMobiCitizenResourceDynamics >> initialize [

	super initialize.
	hasBed := false.
	hasICU := false
]

{ #category : #accessing }
CMIDAIRMobiCitizenResourceDynamics >> personalPreventionFactor [

	^ self hasMask
		  ifTrue: [ 0.5 ]
		  ifFalse: [ 0.0 ]
]

{ #category : #controlling }
CMIDAIRMobiCitizenResourceDynamics >> step [
	
]
