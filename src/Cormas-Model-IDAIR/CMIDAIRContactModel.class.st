Class {
	#name : #CMIDAIRContactModel,
	#superclass : #CMIDAIRSubmodel,
	#instVars : [
		'socialDistanceFactor'
	],
	#category : #'Cormas-Model-IDAIR-Contact'
}

{ #category : #testing }
CMIDAIRContactModel class >> isAbstract [

	^ self = CMIDAIRContactModel
]

{ #category : #accessing }
CMIDAIRContactModel class >> order [

	^ 0.5
]

{ #category : #accessing }
CMIDAIRContactModel class >> submodelCategoryName [

	^ #contact
]

{ #category : #accessing }
CMIDAIRContactModel >> daysPerStep [

	^ self cormasModel daysPerStep
]

{ #category : #'accessing-contact' }
CMIDAIRContactModel >> defaultContactProfileClass [

	^ self subclassResponsibility
]

{ #category : #defaults }
CMIDAIRContactModel >> defaultSocialDistanceFactor [

	^ 0.0
]

{ #category : #'accessing-population' }
CMIDAIRContactModel >> numberOfCitizensInCommunity [

	^ self cormasModel numberOfCitizensInCommunity
]

{ #category : #'accessing-population' }
CMIDAIRContactModel >> numberOfCitizensInICU [

	^ self cormasModel numberOfCitizensInICU
]

{ #category : #'accessing-population' }
CMIDAIRContactModel >> numberOfSusceptive [

	| num |
	num := 0.
	self cormasModel theCitizens do: [ :citizen | 
		citizen isSusceptive ifTrue: [ num := num + 1 ] ].
	^ num
]

{ #category : #'accessing-contact' }
CMIDAIRContactModel >> probabilityForCitizen: aCMIDAIRCitizen prior: aNumber [

	^ (aCMIDAIRCitizen contactProfile probabilityFromPrior: aNumber)
	  * (1.0 - aCMIDAIRCitizen resourceDynamics personalPreventionFactor
			   min: 1.0
			   max: 0.0)
]

{ #category : #accessing }
CMIDAIRContactModel >> socialDistanceFactor [

	^ socialDistanceFactor ifNil: [ 
		  socialDistanceFactor := self defaultSocialDistanceFactor ]
]

{ #category : #accessing }
CMIDAIRContactModel >> socialDistanceFactor: aNumber [

	socialDistanceFactor := aNumber
]

{ #category : #control }
CMIDAIRContactModel >> step: anInteger [

	| numberOfCitizensInCommunity totalBeta |
	numberOfCitizensInCommunity := self numberOfCitizensInCommunity.
	totalBeta := self totalBeta.
	totalBeta > 0.0 ifTrue: [ 
		| p |
		p := (1.0 - (self socialDistanceFactor
		       * self cormasModel socialPreventionResourceFactor)
			      min: 1.0
			      max: 0.0) * totalBeta / numberOfCitizensInCommunity
		     * self daysPerStep.
		self cormasModel theCitizens do: [ :citizen | 
			(citizen isSusceptive and: [ 
				 self random <= (self probabilityForCitizen: citizen prior: p) ]) 
				ifTrue: [ citizen beExposed ] ] ]
]

{ #category : #accessing }
CMIDAIRContactModel >> totalBeta [

	| totalBeta |
	totalBeta := self cormasModel theCitizens
		             inject: 0.0
		             into: [ :sum :citizen | 
		             citizen beta / citizen tau + sum ].
	^ totalBeta
]
