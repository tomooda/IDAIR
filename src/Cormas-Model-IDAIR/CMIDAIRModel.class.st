Class {
	#name : #CMIDAIRModel,
	#superclass : #CMAbstractModel,
	#instVars : [
		'theCitizens',
		'theLocations'
	],
	#category : #'Cormas-Model-IDAIR'
}

{ #category : #utilities }
CMIDAIRModel class >> deploy [
	<script>
	GraphicFontSettings setFontsToStyleNamed: #small.
	Smalltalk cleanUp: true except: {} confirming: false.
	MCRepositoryGroup
		allSubInstancesDo:
			[ :group | group repositories do: [ :repo | group removeRepository: repo ] ].
	IceRepository registry removeAll.
	IceCredentialStore current
		in:
			[ :store | store allCredentials do: [ :each | each removeFrom: store ] ].
	Deprecation
		raiseWarning: false;
		showWarning: false.
	NoChangesLog install.
	"NoPharoFilesOpener install."
	FFICompilerPlugin install.
	Stdio useNullStreams.
	MCCacheRepository uniqueInstance disable.
	EpMonitor reset.
	5
		timesRepeat:
			[ "PharoCommandLineHandler forcePreferencesOmission: true" Smalltalk garbageCollect ]
]

{ #category : #init }
CMIDAIRModel >> init [

	self
		createGridLines: 33
		columns: 33
		neighbourhood: 8
		closed: false.
	self createN: 1000 randomlyLocatedEntities: CMIDAIRCitizen.
	1 to: 10 do: [ :index | (self theCitizens at: index) beAsymptomatic ].
	self displayPov: #diseasePov of: CMIDAIRCitizen.
	"self displayPov: #contaminationPov of: CMIDAIRLocation"
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
