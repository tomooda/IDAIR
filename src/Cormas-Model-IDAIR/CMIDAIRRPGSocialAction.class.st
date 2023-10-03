Class {
	#name : #CMIDAIRRPGSocialAction,
	#superclass : #CMIDAIRRPGAction,
	#instVars : [
		'transientFactor',
		'cummulativeFactor'
	],
	#category : #'Cormas-Model-IDAIR-RPG-Actions'
}

{ #category : #constants }
CMIDAIRRPGSocialAction class >> all [

	^ { 
		  self facemask.
		  self treatmentGuideline.
		  self openQuarrantineCamp.
		  self vaccination25.
		  self vaccination50.
		  self vaccination75.
		  self vaccination100.
		  self closeBorder.
		  self socialDistancing1.
		  self socialDistancing2.
		  self socialDistancing3.
		  self socialDistancing4.
		  self socialDistancing5.
		  self lockdown.
		  CMIDAIRRPGResourceAction increase1ICU2RB.
		  CMIDAIRRPGResourceAction increase2ICU4RB } asSortedCollection: [ 
		  :less 
		  :more | less name <= more name ]
]

{ #category : #constants }
CMIDAIRRPGSocialAction class >> closeBorder [

	^ self name: 'ID:34 Close the border' transientFactor: 0.7
]

{ #category : #constants }
CMIDAIRRPGSocialAction class >> facemask [

	^ self name: 'ID:35 Wear a facemask' transientFactor: 0.8
]

{ #category : #constants }
CMIDAIRRPGSocialAction class >> lockdown [

	^ self name: 'ID:32 Lockdown' transientFactor: 0.5
]

{ #category : #'instance creation' }
CMIDAIRRPGSocialAction class >> name: aString cummulativeFactor: aNumber [

	^ (self name: aString)
		  cummulativeFactor: aNumber;
		  yourself
]

{ #category : #'instance creation' }
CMIDAIRRPGSocialAction class >> name: aString transientFactor: aNumber [

	^ (self name: aString)
		  transientFactor: aNumber;
		  yourself
]

{ #category : #'instance creation' }
CMIDAIRRPGSocialAction class >> name: aString transientFactor: aNumber cummulativeFactor: anotherNumber [

	^ (self name: aString)
		  transientFactor: aNumber;
		  cummulativeFactor: anotherNumber;
		  yourself
]

{ #category : #constants }
CMIDAIRRPGSocialAction class >> openQuarrantineCamp [

	^ self name: 'ID:33 Quarantine' cummulativeFactor: 0.8
]

{ #category : #constants }
CMIDAIRRPGSocialAction class >> socialDistancing1 [

	^ self name: 'ID:27 Social distancing level 1' transientFactor: 0.9
]

{ #category : #constants }
CMIDAIRRPGSocialAction class >> socialDistancing2 [

	^ self name: 'ID:28 Social distancing level 2' transientFactor: 0.8
]

{ #category : #constants }
CMIDAIRRPGSocialAction class >> socialDistancing3 [

	^ self name: 'ID:29 Social distancing level 3' transientFactor: 0.75
]

{ #category : #constants }
CMIDAIRRPGSocialAction class >> socialDistancing4 [

	^ self name: 'ID:30 Social distancing level 4' transientFactor: 0.7
]

{ #category : #constants }
CMIDAIRRPGSocialAction class >> socialDistancing5 [

	^ self name: 'ID:31 Social distancing level 5' transientFactor: 0.65
]

{ #category : #constants }
CMIDAIRRPGSocialAction class >> treatmentGuideline [

	^ self name: 'ID:22 Issue treatment guidelines' cummulativeFactor: 0.8
]

{ #category : #constants }
CMIDAIRRPGSocialAction class >> vaccination100 [

	^ self name: 'ID:26 Provide vaccine to 100% of population' cummulativeFactor: 0.01
]

{ #category : #constants }
CMIDAIRRPGSocialAction class >> vaccination25 [

	^ self name: 'ID:23 Provide vaccine to 25% of population' cummulativeFactor: 0.75
]

{ #category : #constants }
CMIDAIRRPGSocialAction class >> vaccination50 [

	^ self name: 'ID:24 Provide vaccine to 50% of population' cummulativeFactor: 0.5
]

{ #category : #constants }
CMIDAIRRPGSocialAction class >> vaccination75 [

	^ self name: 'ID:25 Provide vaccine to 75% of population' cummulativeFactor: 0.25
]

{ #category : #accessing }
CMIDAIRRPGSocialAction >> askEffectiveRate: anInteger [

	((UIManager default
		  request: 'Complient citizens'
		  initialAnswer: anInteger printString) ifNotNil: #asInteger) 
		ifNotNil: [ :answer | 
			| rate |
			rate := answer asFloat / anInteger.
			(rate between: 0.0 and: 1.0) ifTrue: [ ^ rate ] ].
	^ nil
]

{ #category : #accessing }
CMIDAIRRPGSocialAction >> cummulativeFactor [

	^ cummulativeFactor
]

{ #category : #accessing }
CMIDAIRRPGSocialAction >> cummulativeFactor: aNumber [

	cummulativeFactor := aNumber
]

{ #category : #execution }
CMIDAIRRPGSocialAction >> execute: aCMIDAIRContactModel [

	(self askEffectiveRate: aCMIDAIRContactModel players size) ifNotNil: [ 
		:rate | 
		aCMIDAIRContactModel socialProfile transientFactor:
			self transientFactor ** rate.
		aCMIDAIRContactModel socialProfile multiplyCummulativeFactor:
			self cummulativeFactor ** rate.
		aCMIDAIRContactModel cormasModel recordHistory:
			(self name , '(' , (self printRate: rate) , ')') asText ]
]

{ #category : #initialization }
CMIDAIRRPGSocialAction >> initialize [

	super initialize.
	transientFactor := 1.0.
	cummulativeFactor := 1.0
]

{ #category : #testing }
CMIDAIRRPGSocialAction >> isSocialAction [

	^ true
]

{ #category : #private }
CMIDAIRRPGSocialAction >> printRate: aFloat [

	| str |
	str := aFloat printString.
	^ str first: (5 min: str size)
]

{ #category : #accessing }
CMIDAIRRPGSocialAction >> transientFactor [

	^ transientFactor
]

{ #category : #accessing }
CMIDAIRRPGSocialAction >> transientFactor: aNumber [

	transientFactor := aNumber
]
