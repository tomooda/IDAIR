Class {
	#name : #CMIDAIRRPGContactModel,
	#superclass : #CMIDAIRContactModel,
	#instVars : [
		'socialProfile',
		'players',
		'citizenActions',
		'policymakerActions',
		'hospitalManagerActions'
	],
	#category : #'Cormas-Model-IDAIR-Contact-RPG'
}

{ #category : #accessing }
CMIDAIRRPGContactModel class >> submodelName [

	^ 'RPG'
]

{ #category : #'adding-removing' }
CMIDAIRRPGContactModel >> addPlayer: aCMIDAIRCitizen named: aString [

	aCMIDAIRCitizen contactProfile isMuppetContactProfile ifTrue: [ 
		^ self error: 'Should not add a muppet as a player' ].
	players at: aString put: aCMIDAIRCitizen
]

{ #category : #converting }
CMIDAIRRPGContactModel >> asPresenter [

	^ CMIDAIRRPGContactModelPresenter on: self
]

{ #category : #accessing }
CMIDAIRRPGContactModel >> citizenActions [

	^ citizenActions
]

{ #category : #enumerating }
CMIDAIRRPGContactModel >> citizenActionsDo: aBlock [

	citizenActions do: aBlock
]

{ #category : #actions }
CMIDAIRRPGContactModel >> clearRound [

	self namesAndPlayersDo: [ :name :player | 
		player contactProfile clearRound ].
	socialProfile clearRound
]

{ #category : #defaults }
CMIDAIRRPGContactModel >> defaultCitizenActions [

	^ CMIDAIRRPGCitizenAction all
]

{ #category : #'accessing-contact' }
CMIDAIRRPGContactModel >> defaultContactProfileClass [

	^ CMIDAIRRPGContactProfile
]

{ #category : #defaults }
CMIDAIRRPGContactModel >> defaultHospitalManagerActions [

	^ CMIDAIRRPGHospitalAction all
]

{ #category : #defaults }
CMIDAIRRPGContactModel >> defaultPolicymakerActions [

	^ CMIDAIRRPGPolicymakerAction all
]

{ #category : #accessing }
CMIDAIRRPGContactModel >> hospitalManagerActions [

	^ hospitalManagerActions
]

{ #category : #'initialize-release' }
CMIDAIRRPGContactModel >> init [

	
]

{ #category : #'initialize-release' }
CMIDAIRRPGContactModel >> initialize [

	super initialize.
	socialProfile := CMIDAIRRPGSocialProfile new.
	citizenActions := self defaultCitizenActions.
	policymakerActions := self defaultPolicymakerActions.
	hospitalManagerActions := self defaultHospitalManagerActions.
	players := OrderedDictionary new
]

{ #category : #accessing }
CMIDAIRRPGContactModel >> initializers [

	^ Array new
]

{ #category : #enumerating }
CMIDAIRRPGContactModel >> namesAndPlayersDo: aBlock [

	players keysAndValuesDo: aBlock
]

{ #category : #accessing }
CMIDAIRRPGContactModel >> playerIndexOf: aCMIDAIRCitizen [
	^ players values indexOf: aCMIDAIRCitizen
]

{ #category : #accessing }
CMIDAIRRPGContactModel >> playerNamed: aString [

	^ players at: aString ifAbsent: [ nil ]
]

{ #category : #accessing }
CMIDAIRRPGContactModel >> players [

	^ players
]

{ #category : #accessing }
CMIDAIRRPGContactModel >> policymakerActions [

	^ policymakerActions
]

{ #category : #enumerating }
CMIDAIRRPGContactModel >> policymakerActionsDo: aBlock [

	policymakerActions do: aBlock
]

{ #category : #accessing }
CMIDAIRRPGContactModel >> probabilityForCitizen: aCMIDAIRCitizen prior: aNumber [

	^ aCMIDAIRCitizen contactProfile probabilityFromPrior: aNumber
]

{ #category : #accessing }
CMIDAIRRPGContactModel >> socialProfile [

	^ socialProfile
]

{ #category : #actions }
CMIDAIRRPGContactModel >> step: anInteger [

	| numberOfCitizensInCommunity totalBeta |
	numberOfCitizensInCommunity := self numberOfCitizensInCommunity.
	totalBeta := self totalBeta.
	totalBeta > 0.0 ifTrue: [ 
		| p |
		p := socialProfile probabilityFromPrior:
			     totalBeta / numberOfCitizensInCommunity * self daysPerStep.
		self cormasModel theCitizens do: [ :citizen | 
			(citizen isSusceptible and: [ 
				 self random <= (self probabilityForCitizen: citizen prior: p) ]) 
				ifTrue: [ citizen beExposed ] ] ]
]
