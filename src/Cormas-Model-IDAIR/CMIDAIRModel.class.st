Class {
	#name : #CMIDAIRModel,
	#superclass : #CMAbstractModel,
	#instVars : [
		'theCitizens',
		'theLocations'
	],
	#category : #'Cormas-Model-IDAIR'
}

{ #category : #init }
CMIDAIRModel >> init [

	self
		createGridLines: 27
		columns: 27
		neighbourhood: 8
		closed: false.
	self createN: 400 randomlyLocatedEntities: CMIDAIRCitizen.
	1 to: 10 do: [ :index | (self theCitizens at: index) beIncubative ].
	self
		displayPov: #diseasePov of: CMIDAIRCitizen;
		displayPov: #contaminationPov of: CMIDAIRLocation
]

{ #category : #control }
CMIDAIRModel >> step: time [

	self theCitizens do: #step.
	self theLocations do: #clearContamination.
	self theCitizens do: #contaminate.
	self theCitizens do: #contact
]

{ #category : #accessing }
CMIDAIRModel >> theCitizens [

	^ theCitizens
		  ifNil: [ theCitizens := OrderedCollection new ]
		  ifNotNil: [ theCitizens ]
]

{ #category : #accessing }
CMIDAIRModel >> theLocations [

	^ theLocations
		  ifNil: [ theLocations := OrderedCollection new ]
		  ifNotNil: [ theLocations ]
]
