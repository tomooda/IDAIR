Class {
	#name : #CMIDAIRModel,
	#superclass : #CMAbstractModel,
	#instVars : [
		'theCitizens',
		'theLocations',
		'submodels'
	],
	#category : #'Cormas-Model-IDAIR-Core'
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

{ #category : #submodels }
CMIDAIRModel >> addSubmodel: aCMIDAIRSubmodel [

	^ submodels at: aCMIDAIRSubmodel name put: aCMIDAIRSubmodel
]

{ #category : #init }
CMIDAIRModel >> init [

	self addSubmodel: (CMIDAIRDiseaseModel on: self).
	self
		createGridLines: 33
		columns: 33
		neighbourhood: 8
		closed: false.
	self createN: 1000 randomlyLocatedEntities: CMIDAIRCitizen.
	1 to: 10 do: [ :index | (self theCitizens at: index) beAsymptomatic ].
	self displayPov: #diseasePov of: CMIDAIRCitizen.
	"self displayPov: #contaminationPov of: CMIDAIRLocation."
	self submodelAt: #disease do: [ :m | m asPresenter openWithSpec ]
]

{ #category : #initialization }
CMIDAIRModel >> initialize [

	super initialize.
	submodels := Dictionary new
]

{ #category : #control }
CMIDAIRModel >> step: time [

	self theCitizens do: #step.
	self theLocations do: #clearContamination.
	self theCitizens do: #contaminate.
	self theCitizens do: #contact
]

{ #category : #submodels }
CMIDAIRModel >> submodelAt: aSymbol do: aBlock [

	^ submodels at: aSymbol ifPresent: aBlock
]

{ #category : #accessing }
CMIDAIRModel >> theCitizens [

	^ theCitizens
		  ifNil: [ theCitizens := OrderedCollection new ]
		  ifNotNil: [ theCitizens ]
]

{ #category : #accessing }
CMIDAIRModel >> theCitizens1 [

	^ theCitizens
]

{ #category : #accessing }
CMIDAIRModel >> theCitizens: anObject [

	theCitizens := anObject
]

{ #category : #accessing }
CMIDAIRModel >> theLocations [

	^ theLocations
		  ifNil: [ theLocations := OrderedCollection new ]
		  ifNotNil: [ theLocations ]
]

{ #category : #accessing }
CMIDAIRModel >> theLocations1 [

	^ theLocations
]

{ #category : #accessing }
CMIDAIRModel >> theLocations: anObject [

	theLocations := anObject
]
