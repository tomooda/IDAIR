Class {
	#name : #CMIDAIRModel,
	#superclass : #CMAbstractModel,
	#instVars : [
		'theCitizens',
		'theLocations',
		'submodels',
		'isHeadless',
		'initializer'
	],
	#category : #'Cormas-Model-IDAIR-Core'
}

{ #category : #accessing }
CMIDAIRModel class >> aboutThisModel [

	" Answer a <String> which is the main description of the receiver's purpose "

	^ 'A base ABM model for resource management in epidemic outbreaks'
]

{ #category : #probes }
CMIDAIRModel class >> colorOfProbe_numberOfAsymptomatic [
	^ Color yellow
]

{ #category : #probes }
CMIDAIRModel class >> colorOfProbe_numberOfDead [
	^ Color black
]

{ #category : #probes }
CMIDAIRModel class >> colorOfProbe_numberOfHospitalized [
	^ Color lightGray
]

{ #category : #probes }
CMIDAIRModel class >> colorOfProbe_numberOfICUed [
	^ Color gray
]

{ #category : #probes }
CMIDAIRModel class >> colorOfProbe_numberOfInfected [
	^ Color blue
]

{ #category : #probes }
CMIDAIRModel class >> colorOfProbe_numberOfRecovered [
	^ Color green muchDarker
]

{ #category : #probes }
CMIDAIRModel class >> colorOfProbe_numberOfSusceptive [
	^ Color green
]

{ #category : #probes }
CMIDAIRModel class >> colorOfProbe_numberOfSymptomatic [
	^ Color red
]

{ #category : #probes }
CMIDAIRModel class >> defaultProbes [

	^ self probes
]

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

{ #category : #accessing }
CMIDAIRModel class >> howToRunIt [
	" Answer a <String> with information about how to run the receiver "

	^ 'Initialize with init, select all Probes, and run'
]

{ #category : #submodels }
CMIDAIRModel >> addSubmodel: aCMIDAIRSubmodel [

	^ submodels at: aCMIDAIRSubmodel submodelCategoryName put: aCMIDAIRSubmodel
]

{ #category : #'user interfaces' }
CMIDAIRModel >> asPresenter [

	^ CMIDAIRModelPresenter on: self
]

{ #category : #'user interfaces' }
CMIDAIRModel >> beGUI [

	self isHeadless: false
]

{ #category : #'user interfaces' }
CMIDAIRModel >> beHeadless [

	self isHeadless: true
]

{ #category : #'user interfaces' }
CMIDAIRModel >> chartPresenter [

	^ CMIDAIRChartPresenter on: self
]

{ #category : #'instance creation - agents & objects' }
CMIDAIRModel >> createN: aNumber randomlyLocatedEntities: aClass initMethod: aSymbol arguments: aCollec [

	"Return a collection of aNumber of entities of aClass for wich the init method 'aSymbol' with a set of arguments 'aCollec' has been send. 
	The new entities are randomly located on the grid.
	ex: self createN: 10 randomlyLocatedEntities: Predator initMethod: #initAge:energy: arguments: #(0 50) "

	| anAgent newEntities counter step |
	newEntities := OrderedCollection new.
	counter := 0.
	step := aNumber // 100 + 1.
	'Creating agents...'
		displayProgressFrom: 0
		to: 100
		during: [ :progress | 
			aNumber timesRepeat: [ 
				anAgent := self newEntity: aClass.
				anAgent moveTo: self pickCell.
				anAgent perform: aSymbol withArguments: aCollec.
				newEntities add: anAgent.
				(counter := counter + 1) % step = 0 ifTrue: [ 
					progress value: counter // step ] ] ].
	^ newEntities
]

{ #category : #accessing }
CMIDAIRModel >> daysPerStep [

	^ self submodelAt: #time do: [ :timeModel | timeModel daysPerStep ]
]

{ #category : #defaults }
CMIDAIRModel >> defaultDiseaseDynamicsClass [

	^ self
		  submodelAt: #disease
		  do: [ :diseaseModel | diseaseModel defaultDiseaseDynamicsClass ]
]

{ #category : #'user interfaces' }
CMIDAIRModel >> ifGUI: aBlock [

	^ self isHeadless ifFalse: aBlock
]

{ #category : #initialization }
CMIDAIRModel >> init [

	self
		createGridLines: 1
		columns: 1
		neighbourhood: 8
		closed: false.
	initializer ifNotNil: [ initializer value: self ].
	"self createN: 1000 randomlyLocatedEntities: CMIDAIRCitizen.
	1 to: 10 do: [ :index | (self theCitizens at: index) beAsymptomatic ]"
]

{ #category : #scheduling }
CMIDAIRModel >> initSimFromScnrStage2 [
	super initSimFromScnrStage2.
	self openGUI
]

{ #category : #init }
CMIDAIRModel >> init_Oxford_SingleLocation [

	self addSubmodel: (CMIDAIROxfordDiseaseModel on: self).
	self addSubmodel: (CMIDAIRSingleLocationContactModel on: self).
	self addSubmodel: (CMIDAIRSimpleTimeModel on: self).
	self
		createGridLines: 33
		columns: 33
		neighbourhood: 8
		closed: false.
	self createN: 1000 randomlyLocatedEntities: CMIDAIRCitizen.
	1 to: 10 do: [ :index | (self theCitizens at: index) beAsymptomatic ]
]

{ #category : #init }
CMIDAIRModel >> init_Vietnam_SingleLocation [

	self addSubmodel: (CMIDAIRVietnamDiseaseModel on: self).
	self addSubmodel: (CMIDAIRSingleLocationContactModel on: self).
	self addSubmodel: (CMIDAIRSimpleTimeModel on: self).
	self
		createGridLines: 33
		columns: 33
		neighbourhood: 8
		closed: false.
	self createN: 1000 randomlyLocatedEntities: CMIDAIRCitizen.
	1 to: 10 do: [ :index | (self theCitizens at: index) beAsymptomatic ]
]

{ #category : #initialization }
CMIDAIRModel >> initialize [

	super initialize.
	submodels := Dictionary new.
	isHeadless := false
]

{ #category : #initialization }
CMIDAIRModel >> initializer: aBlock [

	initializer := aBlock
]

{ #category : #accessing }
CMIDAIRModel >> initializers [

	^ Array streamContents: [ :stream | 
		  self submodelsDo: [ :submodel | 
			  stream nextPut: submodel initializers ] ]
]

{ #category : #'user interfaces' }
CMIDAIRModel >> isHeadless [

	^ isHeadless
]

{ #category : #'user interfaces' }
CMIDAIRModel >> isHeadless: aBoolean [

	isHeadless := aBoolean = true
]

{ #category : #initialization }
CMIDAIRModel >> loadDefaultSubmodels [

	self addSubmodel: (CMIDAIRVietnamDiseaseModel on: self).
	self addSubmodel: (CMIDAIRSingleLocationContactModel on: self).
	self addSubmodel: (CMIDAIRSimpleTimeModel on: self)
]

{ #category : #probes }
CMIDAIRModel >> numberOfAsymptomatic [

	<probe>
	| num |
	num := 0.
	self theCitizens do: [ :citizen | 
		citizen diseaseDynamics isAsymptomatic ifTrue: [ num := num + 1 ] ].
	^ num
]

{ #category : #probes }
CMIDAIRModel >> numberOfDead [

	<probe>
	| num |
	num := 0.
	self theCitizens do: [ :citizen | 
		citizen diseaseDynamics isDead ifTrue: [ num := num + 1 ] ].
	^ num
]

{ #category : #probes }
CMIDAIRModel >> numberOfHospitalized [

	<probe>
	| num |
	num := 0.
	self theCitizens do: [ :citizen | 
		citizen diseaseDynamics isHospitalized ifTrue: [ num := num + 1 ] ].
	^ num
]

{ #category : #probes }
CMIDAIRModel >> numberOfICUed [

	<probe>
	| num |
	num := 0.
	self theCitizens do: [ :citizen | 
		citizen diseaseDynamics isICUed ifTrue: [ num := num + 1 ] ].
	^ num
]

{ #category : #probes }
CMIDAIRModel >> numberOfInfected [

	<probe>
	| num |
	num := 0.
	self theCitizens do: [ :citizen | 
		citizen diseaseDynamics isInfected ifTrue: [ num := num + 1 ] ].
	^ num
]

{ #category : #probes }
CMIDAIRModel >> numberOfRecovered [

	<probe>
	| num |
	num := 0.
	self theCitizens do: [ :citizen | 
		citizen diseaseDynamics isRecovered ifTrue: [ num := num + 1 ] ].
	^ num
]

{ #category : #probes }
CMIDAIRModel >> numberOfSusceptive [

	<probe>
	| num |
	num := 0.
	self theCitizens do: [ :citizen | 
		citizen diseaseDynamics isSusceptive ifTrue: [ num := num + 1 ] ].
	^ num
]

{ #category : #probes }
CMIDAIRModel >> numberOfSymptomatic [

	<probe>
	| num |
	num := 0.
	self theCitizens do: [ :citizen | 
		citizen diseaseDynamics isSymptomatic ifTrue: [ num := num + 1 ] ].
	^ num
]

{ #category : #'user interfaces' }
CMIDAIRModel >> openGUI [

	self ifGUI: [ self asPresenter openWithSpec ]
]

{ #category : #removing }
CMIDAIRModel >> removeDestroyedEntities [

	"don't remove dead entities because we want to count dead people."
]

{ #category : #control }
CMIDAIRModel >> step: time [

	self submodelsDo: [ :m | m step: time ]
]

{ #category : #submodels }
CMIDAIRModel >> submodelAt: aSymbol do: aBlock [

	^ submodels at: aSymbol ifPresent: aBlock
]

{ #category : #submodels }
CMIDAIRModel >> submodelsDo: aBlock [

	submodels valuesDo: aBlock
]

{ #category : #submodels }
CMIDAIRModel >> submodelsInOrderDo: aBlock [

	(submodels values asSortedCollection: [ :less :more | 
		 less order <= more order ]) do: aBlock
]

{ #category : #accessing }
CMIDAIRModel >> theCitizens [

	^ theCitizens
		  ifNil: [ theCitizens := OrderedCollection new ]
		  ifNotNil: [ theCitizens ]
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
CMIDAIRModel >> theLocations: anObject [

	theLocations := anObject
]
