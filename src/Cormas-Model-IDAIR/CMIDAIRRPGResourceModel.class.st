Class {
	#name : #CMIDAIRRPGResourceModel,
	#superclass : #CMIDAIRResourceModel,
	#instVars : [
		'numICUs',
		'numBeds',
		'patientsInBeds',
		'patientsInICUs',
		'historyOfOccupiedICUs',
		'historyOfOccupiedBeds',
		'vaccineEligibilityRate',
		'facemaskPolicy'
	],
	#category : #'Cormas-Model-IDAIR-Resource-RPG'
}

{ #category : #accessing }
CMIDAIRRPGResourceModel class >> submodelName [

	^ 'RPG'
]

{ #category : #converting }
CMIDAIRRPGResourceModel >> asPresenter [

	^ CMIDAIRRPGResourceModelPresenter on: self
]

{ #category : #operations }
CMIDAIRRPGResourceModel >> assignBed: aCMIDAIRCitizen [

	patientsInBeds size < numBeds ifTrue: [ 
		patientsInICUs remove: aCMIDAIRCitizen ifAbsent: [  ].
		patientsInBeds add: aCMIDAIRCitizen ]
]

{ #category : #operations }
CMIDAIRRPGResourceModel >> assignICU: aCMIDAIRCitizen [

	patientsInICUs size < numICUs ifTrue: [ 
		patientsInBeds remove: aCMIDAIRCitizen ifAbsent: [  ].
		patientsInICUs add: aCMIDAIRCitizen ]
]

{ #category : #operations }
CMIDAIRRPGResourceModel >> checkPatientsInBeds [

	patientsInBeds copy do: [ :citizen | 
		(citizen diseaseDynamics isMildSymptom or: [ 
			 citizen diseaseDynamics isSevereSymptom ]) ifFalse: [ 
			patientsInBeds remove: citizen ifAbsent: [  ] ] ]
]

{ #category : #operations }
CMIDAIRRPGResourceModel >> checkPatientsInICUs [

	patientsInICUs copy do: [ :citizen | 
		citizen diseaseDynamics isSevereSymptom ifFalse: [ 
			patientsInICUs remove: citizen ifAbsent: [  ].
			(citizen diseaseDynamics isMildSymptom and: [ 
				 patientsInBeds size < numBeds ]) ifTrue: [ 
				patientsInBeds add: citizen ] ] ]
]

{ #category : #control }
CMIDAIRRPGResourceModel >> consume: anInteger [

	
]

{ #category : #defaults }
CMIDAIRRPGResourceModel >> defaultCitizenResourceDynamicsClass [

	^ CMIDAIRRPGCitizenResourceDynamics
]

{ #category : #accessing }
CMIDAIRRPGResourceModel >> facemaskPolicy [

	^ facemaskPolicy
]

{ #category : #accessing }
CMIDAIRRPGResourceModel >> facemaskPolicy: aBoolean [

	facemaskPolicy := aBoolean
]

{ #category : #'round management' }
CMIDAIRRPGResourceModel >> finalizeRound [

	super finalizeRound.
	self checkPatientsInBeds.
	self checkPatientsInICUs
]

{ #category : #accessing }
CMIDAIRRPGResourceModel >> historyOfOccupiedBeds [

	^ historyOfOccupiedBeds
]

{ #category : #accessing }
CMIDAIRRPGResourceModel >> historyOfOccupiedICUs [

	^ historyOfOccupiedICUs
]

{ #category : #accessing }
CMIDAIRRPGResourceModel >> hospitalizedPatients [

	^ patientsInBeds , patientsInICUs
]

{ #category : #operations }
CMIDAIRRPGResourceModel >> increaseBeds: anInteger ICUs: anotherInteger [

	numBeds := numBeds + anInteger.
	numICUs := numICUs + anotherInteger
]

{ #category : #initialization }
CMIDAIRRPGResourceModel >> init [

	
]

{ #category : #initialization }
CMIDAIRRPGResourceModel >> initialize [

	super initialize.
	numICUs := 4.
	numBeds := 10.
	patientsInBeds := OrderedCollection new.
	patientsInICUs := OrderedCollection new.
	vaccineEligibilityRate := 0.0.
	facemaskPolicy := false.
	historyOfOccupiedBeds := OrderedCollection new.
	historyOfOccupiedICUs := OrderedCollection new
]

{ #category : #control }
CMIDAIRRPGResourceModel >> initializeRound [

	self recordHistory
]

{ #category : #accessing }
CMIDAIRRPGResourceModel >> initializers [

	^ {  }
]

{ #category : #testing }
CMIDAIRRPGResourceModel >> isInBed: aCMIDAIRCitizen [

	^ patientsInBeds includes: aCMIDAIRCitizen
]

{ #category : #testing }
CMIDAIRRPGResourceModel >> isInICU: aCMIDAIRCitizen [

	^ patientsInICUs includes: aCMIDAIRCitizen
]

{ #category : #operations }
CMIDAIRRPGResourceModel >> moveToICU: anInteger [

	| candidates res |
	candidates := (patientsInBeds select: [ :citizen | 
		               citizen diseaseDynamics isSevereSymptom ]) asArray
		              shuffle.
	1
		to: (res := (anInteger min: numICUs - patientsInICUs size) min:
				        candidates size)
		do: [ :index | self assignICU: (candidates at: index) ].
	^ res
]

{ #category : #accessing }
CMIDAIRRPGResourceModel >> numBeds [

	^ numBeds
]

{ #category : #accessing }
CMIDAIRRPGResourceModel >> numBeds: aNumber [

	numBeds := aNumber
]

{ #category : #accessing }
CMIDAIRRPGResourceModel >> numICUs [

	^ numICUs
]

{ #category : #accessing }
CMIDAIRRPGResourceModel >> numICUs: aNumber [

	numICUs := aNumber
]

{ #category : #accessing }
CMIDAIRRPGResourceModel >> occupiedBeds [

	^ patientsInBeds size
]

{ #category : #accessing }
CMIDAIRRPGResourceModel >> occupiedBedsMild [

	| num |
	num := 0.
	patientsInBeds do: [ :citizen | 
		citizen diseaseDynamics isMildSymptom ifTrue: [ num := num + 1 ] ].
	^ num
]

{ #category : #accessing }
CMIDAIRRPGResourceModel >> occupiedBedsSevere [

	| num |
	num := 0.
	patientsInBeds do: [ :citizen | 
		citizen diseaseDynamics isSevereSymptom ifTrue: [ num := num + 1 ] ].
	^ num
]

{ #category : #accessing }
CMIDAIRRPGResourceModel >> occupiedICUs [

	^ patientsInICUs size
]

{ #category : #operations }
CMIDAIRRPGResourceModel >> occupyBedForMild: numMild severe: numSevere [

	| mild severe |
	mild := (self cormasModel theCitizens select: [ :citizen | 
		         citizen diseaseDynamics isMildSymptom ]) asArray shuffle 
		        copyWithoutAll: patientsInBeds , patientsInICUs.
	mild := mild first: (numMild min: mild size).
	severe := (self cormasModel theCitizens select: [ :citizen | 
		           citizen diseaseDynamics isSevereSymptom ]) asArray
		          shuffle copyWithoutAll: patientsInBeds , patientsInICUs.
	severe := severe first: (numSevere min: severe size).
	^ mild size + severe size <= (numBeds - patientsInBeds size)
		  ifTrue: [ 
			  severe do: [ :citizen | self assignBed: citizen ].
			  mild do: [ :citizen | self assignBed: citizen ].
			  { 
				  mild size.
				  severe size } ]
		  ifFalse: [ nil ]
]

{ #category : #operations }
CMIDAIRRPGResourceModel >> occupyICU: anInteger [

	| candidates res |
	candidates := ((self cormasModel theCitizens select: [ :citizen | 
		                citizen diseaseDynamics isSevereSymptom ]) asArray
		               shuffle copyWithoutAll: patientsInICUs)
	              , (patientsInBeds select: [ :citizen | 
			               citizen diseaseDynamics isSevereSymptom ]) asArray
			              shuffle.
	1
		to: (res := (anInteger min: numICUs - patientsInICUs size) min:
				        candidates size)
		do: [ :index | self assignICU: (candidates at: index) ].
	^ res
]

{ #category : #operations }
CMIDAIRRPGResourceModel >> recordHistory [

	historyOfOccupiedBeds add: patientsInBeds size.
	historyOfOccupiedICUs add: patientsInICUs size
]

{ #category : #accessing }
CMIDAIRRPGResourceModel >> socialPreventionResourceFactor [

	^ 1.0
]

{ #category : #control }
CMIDAIRRPGResourceModel >> step: anInteger [

	super step: anInteger.
	self checkPatientsInBeds.
	self checkPatientsInICUs
]

{ #category : #control }
CMIDAIRRPGResourceModel >> supply: anInteger [

	
]

{ #category : #accessing }
CMIDAIRRPGResourceModel >> vaccineEligibilityRate [

	^ vaccineEligibilityRate
]

{ #category : #accessing }
CMIDAIRRPGResourceModel >> vaccineEligibilityRate: aNumber [

	vaccineEligibilityRate := aNumber
]
