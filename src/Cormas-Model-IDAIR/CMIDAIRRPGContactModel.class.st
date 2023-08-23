Class {
	#name : #CMIDAIRRPGContactModel,
	#superclass : #CMIDAIRContactModel,
	#instVars : [
		'socialProfile',
		'citizenActionsAndFactors',
		'policyMakerActionsAndFactors',
		'players'
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

	^ SpNotebookPresenter new
		  addPage: (SpNotebookPage
				   title: 'Settings'
				   provider: [ CMIDAIRRPGContactModelPresenter on: self ]);
		  addPage: (SpNotebookPage
				   title: 'Play'
				   provider: [ CMIDAIRRPGActionPresenter on: self ]);
		  yourself
]

{ #category : #accessing }
CMIDAIRRPGContactModel >> citizenActionsAndFactors [

	^ citizenActionsAndFactors
]

{ #category : #enumerating }
CMIDAIRRPGContactModel >> citizenActionsAndFactorsDo: aBlock [

	citizenActionsAndFactors keysAndValuesDo: aBlock
]

{ #category : #defaults }
CMIDAIRRPGContactModel >> defaultCitizenActionsAndFactors [

	^ OrderedDictionary new
		  at: 'Go to a Bar' put: #( 2.5 1.0 );
		  at: 'Go to a wedding' put: #( 1.1 1.0 );
		  at: 'Go to a ceremony' put: #( 1.1 1.0 );
		  at: 'Go to the hospital' put: #( 1.0 1.0 );
		  at: 'Earn a living' put: #( 1.2 0.7 );
		  at: 'Buy basic living necessities' put: #( 1.0 0.5 );
		  at: 'Business trip' put: #( 2.0 1.0 );
		  at: 'Travel abroad to study' put: #( 1.0 1.0 );
		  at: 'Work out at a gym' put: #( 1.5 1.0 );
		  at: 'Bring family to the hospital' put: #( 1.0 1.0 );
		  at: 'Go to school' put: #( 1.0 0.5 );
		  at: 'Field trip' put: #( 0.5 1.0 );
		  at: 'Communication by talking' put: #( 1.5 1.0 );
		  at: 'Shopping' put: #( 1.5 0.8 );
		  at: 'Regular health checkup' put: #( 1.0 1.0 );
		  at: 'Getting monthly medication' put: #( 1.0 1.0 );
		  at: 'Seek health care' put: #( 1.0 1.0 );
		  at: 'Getting facemask to wear' put: #( 0.5 1.0 );
		  at: 'Getting vaccinated' put: #( #beVaccinated 1.0 );
		  at: 'You need a test kit' put: #( 1.0 1.0 );
		  at: 'Your test is positive' put: #( #beExposed 1.0 );
		  at: 'Your symptom is severe' put: #( #beSevereSymptom
			     1.0 );
		  yourself
]

{ #category : #'accessing-contact' }
CMIDAIRRPGContactModel >> defaultContactProfileClass [

	^ CMIDAIRRPGContactProfile
]

{ #category : #defaults }
CMIDAIRRPGContactModel >> defaultPolicyMakerActionsAndFactors [

	^ OrderedDictionary new
		  at: 'Wear a facemask' put: 1.0;
		  at: 'Close the border' put: 0.7;
		  at: 'Social distancing level 1' put: 0.9;
		  at: 'Social distancing level 2' put: 0.8;
		  at: 'Social distancing level 3' put: 0.75;
		  at: 'Social distancing level 4' put: 0.7;
		  at: 'Social distancing level 5' put: 0.65;
		  at: 'Lockdown' put: 0.5;
		  yourself
]

{ #category : #'initialize-release' }
CMIDAIRRPGContactModel >> init [

	
]

{ #category : #'initialize-release' }
CMIDAIRRPGContactModel >> initialize [

	super initialize.
	socialProfile := CMIDAIRRPGSocialProfile new.
	citizenActionsAndFactors := self defaultCitizenActionsAndFactors.
	policyMakerActionsAndFactors := self defaultPolicyMakerActionsAndFactors.
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
CMIDAIRRPGContactModel >> players [

	^ players
]

{ #category : #accessing }
CMIDAIRRPGContactModel >> policyMakerActionsAndFactors [

	^ policyMakerActionsAndFactors
]

{ #category : #enumerating }
CMIDAIRRPGContactModel >> policyMakerActionsAndFactorsDo: aBlock [

	policyMakerActionsAndFactors keysAndValuesDo: aBlock
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
			(citizen isSusceptive and: [ 
				 self random <= (self probabilityForCitizen: citizen prior: p) ]) 
				ifTrue: [ citizen beExposed ] ] ]
]
