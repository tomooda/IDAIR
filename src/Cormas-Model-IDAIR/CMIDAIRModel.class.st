Class {
	#name : #CMIDAIRModel,
	#superclass : #CMAbstractModel,
	#instVars : [
		'theCitizens',
		'theLocations',
		'submodels',
		'isHeadless',
		'initializer',
		'history'
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
CMIDAIRModel class >> colorOfProbe_numberOfSusceptible [
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

{ #category : #'charts-dimensions' }
CMIDAIRModel >> chartHeight [

	^ 150
]

{ #category : #'user interfaces' }
CMIDAIRModel >> chartPresenter [

	^ CMIDAIRChartPresenter on: self
]

{ #category : #'charts-dimensions' }
CMIDAIRModel >> chartWidth [

	^ 200
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

{ #category : #'instance creation - agents & objects' }
CMIDAIRModel >> createN: anInteger randomlyLocatedEntities: aClass playerName: aString [

	| citizens |
	citizens := self createN: anInteger randomlyLocatedEntities: aClass.
	aString ifNotEmpty: [ 
		self submodelAt: #contact do: [ :contactModel | 
			(contactModel isKindOf: CMIDAIRRPGContactModel) ifTrue: [ 
				(contactModel playerNamed: aString)
					ifNotNil: [ :player | 
						citizens do: [ :muppet | muppet contactProfile player: player ] ]
					ifNil: [ 
						| player muppets |
						player := citizens first.
						muppets := citizens copyWithoutFirst.
						muppets do: [ :muppet | muppet contactProfile player: player ].
						contactModel addPlayer: player named: aString ] ] ] ].
	^ citizens
]

{ #category : #'accessing-population' }
CMIDAIRModel >> currentNumberOfDead [

	| num |
	num := 0.
	self theCitizens do: [ :citizen | 
		citizen diseaseDynamics isDead ifTrue: [ num := num + 1 ] ].
	^ num
]

{ #category : #'accessing-population' }
CMIDAIRModel >> currentNumberOfMildSymptom [

	| num |
	num := 0.
	self theCitizens do: [ :citizen | 
		citizen diseaseDynamics isMildSymptom ifTrue: [ num := num + 1 ] ].
	^ num
]

{ #category : #'accessing-population' }
CMIDAIRModel >> currentNumberOfRecovered [

	| num |
	num := 0.
	self theCitizens do: [ :citizen | 
		citizen diseaseDynamics isRecovered ifTrue: [ num := num + 1 ] ].
	^ num
]

{ #category : #'accessing-population' }
CMIDAIRModel >> currentNumberOfSevereSymptom [

	| num |
	num := 0.
	self theCitizens do: [ :citizen | 
		citizen diseaseDynamics isSevereSymptom ifTrue: [ num := num + 1 ] ].
	^ num
]

{ #category : #accessing }
CMIDAIRModel >> daysPerStep [

	^ self submodelAt: #time do: [ :timeModel | timeModel daysPerStep ]
]

{ #category : #'charts-colors' }
CMIDAIRModel >> deadColor [

	^ Color black
]

{ #category : #defaults }
CMIDAIRModel >> defaultCitizenResourceDynamicsClass [

	^ self
		  submodelAt: #resource
		  do: [ :resourceModel | resourceModel defaultCitizenResourceDynamicsClass ]
]

{ #category : #defaults }
CMIDAIRModel >> defaultContactProfileClass [

	^ self
		  submodelAt: #contact
		  do: [ :contactModel | contactModel defaultContactProfileClass ]
]

{ #category : #defaults }
CMIDAIRModel >> defaultDiseaseDynamicsClass [

	^ self
		  submodelAt: #disease
		  do: [ :diseaseModel | diseaseModel defaultDiseaseDynamicsClass ]
]

{ #category : #defaults }
CMIDAIRModel >> defaultLocationDynamicsClass [

	^ self
		  submodelAt: #location
		  do: [ :locationModel | locationModel defaultLocationDynamicsClass ]
]

{ #category : #history }
CMIDAIRModel >> historyAt: anInteger [

	^ (anInteger between: 1 and: history size)
		  ifTrue: [ String cr asText join: (history at: anInteger) ]
		  ifFalse: [ Text new ]
]

{ #category : #charts }
CMIDAIRModel >> hospitalChart [

	^ self submodelAt: #resource do: [ :resourceModel | 
		  | chart plot |
		  chart := RSChart new.
		  chart extent: self chartWidth @ self shortChartHeight.
		  chart colors: (NSScale ordinal range: { 
					   Color lightGray.
					   Color darkGray }).

		  chart addPlot: (plot := CMIDAIRRSBedsPlot new
				           x1: { 
						           resourceModel numBeds.
						           resourceModel numICUs }
				           x2: { 
						           resourceModel occupiedBeds.
						           resourceModel occupiedICUs }
				           y: (1 to: 2);
				           yourself).
		  chart addDecoration: (RSHorizontalTick new
				   integer;
				   fontSize: 12;
				   numberOfTicks: 10).
		  chart
			  addDecoration: (RSVerticalTick new
					   fromNames: { 'Regular beds'. 'ICU beds' };
					   fontSize: 12);
			  title: 'Current status of hospital beds'.
		  RSComposite new shapes: chart build shapes ]
]

{ #category : #'user interfaces' }
CMIDAIRModel >> ifGUI: aBlock [

	^ self isHeadless ifFalse: aBlock
]

{ #category : #'charts-colors' }
CMIDAIRModel >> infectedColor [

	^ Color red
]

{ #category : #initialization }
CMIDAIRModel >> init [

	self
		createGridLines: 12
		columns: 12
		neighbourhood: 8
		closed: false.
	initializer ifNotNil: [ initializer value: self ].
"	self
		displayPov: #pov of: CMIDAIRLocation;
		displayPov: #diseasePov of: CMIDAIRCitizen.
	self halt.
	CMR3SpacePresenter openFor: self projectManager.
	self projectAnnouncer announce: CMSChangePoVAnnouncement new"
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
	isHeadless := false.
	history := OrderedCollection with: OrderedCollection new
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

	self addSubmodel: (CMIDAIRRPGDiseaseModel on: self).
	self addSubmodel: (CMIDAIRRPGContactModel on: self).
	self addSubmodel: (CMIDAIRRPGLocationModelFor6 on: self).
	self addSubmodel: (CMIDAIRRPGResourceModel on: self).
	self addSubmodel: (CMIDAIRSimpleTimeModel on: self)
]

{ #category : #'charts-dimensions' }
CMIDAIRModel >> longChartWidth [

	^ 400
]

{ #category : #charts }
CMIDAIRModel >> map [

	| shapes |
	shapes := OrderedCollection new.
	self theLocations do: [ :location | 
		shapes add: (RSBox new
				 position: location coordinates * 10;
				 color: location color;
				 extent: 10 @ 10;
				 yourself) ].
	self theCitizens do: [ :citizen | 
		shapes add: (RSCircle new
				 position: (citizen locationDynamics oldPosition ifNil: [ 
							  citizen locationDynamics position ]) * 10;
				 color: citizen diseaseDynamics color;
				 radius: 0.5;
				 model: citizen;
				 yourself) ].
	^ RSComposite new shapes: shapes
]

{ #category : #history }
CMIDAIRModel >> nextHistory [

	history add: OrderedCollection new
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

{ #category : #'accessing-population' }
CMIDAIRModel >> numberOfCitizensInCommunity [

	| numberOfCitizensInCommunity |
	numberOfCitizensInCommunity := 0.
	self theCitizens do: [ :citizen | 
		citizen isInCommunity ifTrue: [ 
			numberOfCitizensInCommunity := numberOfCitizensInCommunity + 1 ] ].
	self submodelAt: #resource do: [ :resourceModel | 
		numberOfCitizensInCommunity := numberOfCitizensInCommunity
		                               - resourceModel occupiedBeds
		                               - resourceModel occupiedICUs ].
	^ numberOfCitizensInCommunity
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
		citizen isHospitalized ifTrue: [ num := num + 1 ] ].
	^ num
]

{ #category : #probes }
CMIDAIRModel >> numberOfICUed [

	<probe>
	| num |
	num := 0.
	self theCitizens do: [ :citizen | 
		citizen isICUed ifTrue: [ num := num + 1 ] ].
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
CMIDAIRModel >> numberOfSusceptible [

	<probe>
	| num |
	num := 0.
	self theCitizens do: [ :citizen | 
		citizen diseaseDynamics isSusceptible ifTrue: [ num := num + 1 ] ].
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

{ #category : #'charts-colors' }
CMIDAIRModel >> occupiedBedsColor [

	^ Color lightGray
]

{ #category : #'charts-colors' }
CMIDAIRModel >> occupiedICUsColor [

	^ Color darkGray
]

{ #category : #'user interfaces' }
CMIDAIRModel >> openGUI [

	self ifGUI: [ 
		self submodelAt: #contact do: [ :submodel | 
			(submodel isKindOf: CMIDAIRRPGContactModel) ifTrue: [ 
				(CMIDAIRRPGPresenter on: submodel) openWithSpec.
				^ self ] ].
		self asPresenter openWithSpec ]
]

{ #category : #charts }
CMIDAIRModel >> patientsChart [

	^ self submodelAt: #disease do: [ :diseaseModel | 
		  | chart barPlot susceptibleBar recoveredBar mildBar severeBar deathBar shapes shape shape2 newMild newSevere newRecovered newWorsened newRecovering newDead |
		  newMild := diseaseModel numberOfNewMild.
		  newSevere := diseaseModel numberOfNewSevere.
		  newWorsened := diseaseModel numberOfNewWorsened.
		  newRecovering := diseaseModel numberOfNewRecovering.
		  newRecovered := diseaseModel numberOfNewRecovered.
		  newDead := diseaseModel numberOfNewDead.
		  chart := RSChart new.
		  chart extent: self chartWidth - 50 @ self chartHeight.
		  chart colors: (NSScale ordinal range: { Color black }).
		  barPlot := (chart barWidths: { 
					              self currentNumberOfDead.
					              self currentNumberOfSevereSymptom.
					              self currentNumberOfMildSymptom.
					              self currentNumberOfRecovered.
					              0 })
			             barSize: 10;
			             yourself.
		  chart addDecoration: (RSVerticalTick new
				   fromNames:
					   { 'Death'. 'Severe symptom'. 'Mild symptom'. 'Recovered'.
					   '' };
				   fontSize: 10).
		  chart
			  addDecoration: (RSHorizontalTick new
					   fontSize: 12;
					   integer;
					   yourself);
			  title: 'Current number of cases'.
		  shapes := chart build shapes.
		  susceptibleBar := barPlot bars fifth.
		  recoveredBar := barPlot bars fourth.
		  mildBar := barPlot bars third.
		  severeBar := barPlot bars second.
		  deathBar := barPlot bars first.
		  susceptibleBar color: Color transparent.
		  recoveredBar color: Color blue.
		  mildBar color: Color orange.
		  severeBar color: Color red.
		  deathBar color: Color black.
		  shapes add: (shape := RSArrowedLine new
				            startPoint: mildBar encompassingRectangle left + 20
					            @ susceptibleBar encompassingRectangle bottom;
				            endPoint: mildBar encompassingRectangle left + 20
					            @ mildBar encompassingRectangle top;
				            width: 2).
		  shapes add: (shape := RSLabel new
				            text: newMild printString;
				            translateMiddleLeftTo:
					            shape encompassingRectangle right + 5
					            @ (recoveredBar encompassingRectangle bottom
						             + mildBar encompassingRectangle top * 0.5)).
		  shapes add: (shape := RSArrowedLine new
				            startPoint: shape encompassingRectangle right + 10
					            @ susceptibleBar encompassingRectangle bottom;
				            endPoint: shape encompassingRectangle right + 10
					            @ severeBar encompassingRectangle top;
				            width: 2).
		  shapes add: (shape2 := shape := RSLabel new
				                      text: newSevere printString;
				                      translateMiddleLeftTo:
					                      shape encompassingRectangle right + 5
					                      @ (mildBar encompassingRectangle bottom
						                       + severeBar encompassingRectangle top
						                       * 0.5)).
		  shapes add: (shape := RSArrowedLine new
				            startPoint: shape encompassingRectangle right + 10
					            @ mildBar encompassingRectangle top;
				            endPoint: shape encompassingRectangle right + 10
					            @ recoveredBar encompassingRectangle bottom;
				            width: 2).
		  shapes add: (RSLabel new
				   text: newRecovered printString;
				   translateMiddleLeftTo:
					   shape encompassingRectangle rightCenter + (5 @ 0)).
		  shapes add: (shape := RSArrowedLine new
				            startPoint: shape2 encompassingRectangle right + 10
					            @ mildBar encompassingRectangle bottom;
				            endPoint: shape2 encompassingRectangle right + 10
					            @ severeBar encompassingRectangle top;
				            width: 2).
		  shapes add: (shape := RSLabel new
				            text: newWorsened printString;
				            translateMiddleLeftTo:
					            shape encompassingRectangle rightCenter + (5 @ 0)).
		  shapes add: (shape := RSArrowedLine new
				            startPoint: shape encompassingRectangle right + 10
					            @ severeBar encompassingRectangle top;
				            endPoint: shape encompassingRectangle right + 10
					            @ mildBar encompassingRectangle bottom;
				            width: 2).
		  shapes add: (shape := RSLabel new
				            text: newRecovering printString;
				            translateMiddleLeftTo:
					            shape encompassingRectangle rightCenter + (5 @ 0)).
		  shapes add: (shape := RSArrowedLine new
				            startPoint: deathBar encompassingRectangle left + 20
					            @ severeBar encompassingRectangle bottom;
				            endPoint: deathBar encompassingRectangle left + 20
					            @ deathBar encompassingRectangle top;
				            width: 2).
		  shapes add: (shape := RSLabel new
				            text: newDead printString;
				            translateMiddleLeftTo:
					            shape encompassingRectangle rightCenter + (5 @ 0)).
		  RSComposite new shapes: shapes ]
]

{ #category : #charts }
CMIDAIRModel >> populationChart [

	| chart daysPerStep |
	chart := RSChart new.
	chart extent: self chartWidth @ self shortChartHeight.
	daysPerStep := self daysPerStep.
	self submodelAt: #disease do: [ :diseaseModel | 
		diseaseModel historyOfInfected ifNotEmpty: [ :historyOfInfected | 
			chart addPlot: (RSLinePlot new
					 x:
						 (1 to:
							  historyOfInfected size * daysPerStep + 1
							  - (daysPerStep * 0.5) by: daysPerStep)
					 y: historyOfInfected;
					 color: self infectedColor) ].
		diseaseModel historyOfRecovered ifNotEmpty: [ :historyOfRecovered | 
			chart addPlot: (RSLinePlot new
					 x:
						 (1 to:
							  historyOfRecovered size * daysPerStep + 1
							  - (daysPerStep * 0.5) by: daysPerStep)
					 y: historyOfRecovered;
					 color: self recoveredColor) ].
		diseaseModel historyOfDead ifNotEmpty: [ :historyOfDead | 
			chart addPlot: (RSLinePlot new
					 x:
						 (1 to:
							  historyOfDead size * daysPerStep + 1 - (daysPerStep * 0.5)
						  by: daysPerStep)
					 y: historyOfDead;
					 color: self deadColor) ] ].
	self submodelAt: #resource do: [ :resourceModel | 
		resourceModel historyOfOccupiedBeds ifNotEmpty: [ 
			:historyOfOccupiedBeds | 
			chart addPlot: (RSLinePlot new
					 x: (1 to:
							  historyOfOccupiedBeds size * daysPerStep + 1
							  - (daysPerStep * 0.5) by: daysPerStep)
					 y: historyOfOccupiedBeds;
					 color: self occupiedBedsColor) ].
		resourceModel historyOfOccupiedICUs ifNotEmpty: [ 
			:historyOfOccupiedICUs | 
			chart addPlot: (RSLinePlot new
					 x: (1 to:
							  historyOfOccupiedICUs size * daysPerStep + 1
							  - (daysPerStep * 0.5) by: daysPerStep)
					 y: historyOfOccupiedICUs;
					 color: self occupiedICUsColor) ] ].
	chart addDecoration: (RSVerticalTick new
			 integer;
			 fontSize: 12).
	chart
		addDecoration: (RSHorizontalTick new
				 fontSize: 12;
				 integer;
				 yourself);
		xlabel: 'Time (day)';
		title: 'Course of the situation'.
	chart plots ifEmpty: [ 
		chart addPlot: (RSLinePlot new x: { 0 } y: { 0 }) ].
	^ RSComposite new shapes: chart build shapes
]

{ #category : #history }
CMIDAIRModel >> recordHistory: aText [

	history last add: aText asText
]

{ #category : #'charts-colors' }
CMIDAIRModel >> recoveredColor [

	^ Color blue
]

{ #category : #removing }
CMIDAIRModel >> removeDestroyedEntities [

	"don't remove dead entities because we want to count dead people."
]

{ #category : #'charts-dimensions' }
CMIDAIRModel >> shortChartHeight [

	^ 80
]

{ #category : #accessing }
CMIDAIRModel >> socialPreventionResourceFactor [

	self
		submodelAt: #resource
		do: [ :resourceModel | 
		^ resourceModel socialPreventionResourceFactor ].
	^ 1.0
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

{ #category : #'charts-dimensions' }
CMIDAIRModel >> tallChartHeight [

	^ 200
]

{ #category : #accessing }
CMIDAIRModel >> theCitizens [

	^ theCitizens
		  ifNil: [ theCitizens := OrderedCollection new ]
		  ifNotNil: [ theCitizens ]
]

{ #category : #accessing }
CMIDAIRModel >> theCitizens: aCollectionOfCMIDAIRCitizen [

	theCitizens := aCollectionOfCMIDAIRCitizen
]

{ #category : #accessing }
CMIDAIRModel >> theLocations [

	^ theLocations
		  ifNil: [ theLocations := OrderedCollection new ]
		  ifNotNil: [ theLocations ]
]

{ #category : #accessing }
CMIDAIRModel >> theLocations: aCollectionOfCMIDAIRLocation [

	theLocations := aCollectionOfCMIDAIRLocation
]

{ #category : #charts }
CMIDAIRModel >> wellbeingChart [

	^ self submodelAt: #contact do: [ :contactModel | 
		  | names wellbeings chart |
		  names := contactModel players keys asArray.
		  wellbeings := (contactModel players values collect: [ :citizen | 
			                 citizen contactProfile wellbeingPoints ]) asArray.
		  chart := RSChart new.
		  chart extent: self chartWidth @ self shortChartHeight.
		  chart colors:
			  (NSScale ordinal range:
				   { (Color blue mixed: 0.3 with: Color white) }).
		  (chart barHeights: wellbeings) barSize: 30.
		  chart addDecoration: (RSHorizontalTick new
				   fromNames: names;
				   fontSize: 12).
		  chart
			  addDecoration: (RSVerticalTick new
					   fontSize: 12;
					   integer;
					   yourself);
			  ylabel: 'points';
			  title: 'Well-being points'.
		  RSComposite new shapes: chart build shapes ]
]
