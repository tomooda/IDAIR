Class {
	#name : #CMIDAIRRPGPolicymakerAction,
	#superclass : #CMIDAIRRPGAction,
	#instVars : [
		'transientFactor',
		'cummulativeFactor'
	],
	#category : #'Cormas-Model-IDAIR-RPG-Actions'
}

{ #category : #constants }
CMIDAIRRPGPolicymakerAction class >> all [

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
		  CMIDAIRRPGHospitalAction increase1ICU2RB.
		  CMIDAIRRPGHospitalAction increase2ICU4RB } asSortedCollection: [ 
		  :less 
		  :more | less name <= more name ]
]

{ #category : #constants }
CMIDAIRRPGPolicymakerAction class >> closeBorder [

	^ self name: 'ID:34 Close the border' transientFactor: 0.7
]

{ #category : #constants }
CMIDAIRRPGPolicymakerAction class >> facemask [

	^ self name: 'ID:35 Wear a facemask' transientFactor: 0.8
]

{ #category : #constants }
CMIDAIRRPGPolicymakerAction class >> lockdown [

	^ self name: 'ID:32 Lockdown' transientFactor: 0.5
]

{ #category : #'instance creation' }
CMIDAIRRPGPolicymakerAction class >> name: aString cummulativeFactor: aNumber [

	^ (self name: aString)
		  cummulativeFactor: aNumber;
		  yourself
]

{ #category : #'instance creation' }
CMIDAIRRPGPolicymakerAction class >> name: aString transientFactor: aNumber [

	^ (self name: aString)
		  transientFactor: aNumber;
		  yourself
]

{ #category : #'instance creation' }
CMIDAIRRPGPolicymakerAction class >> name: aString transientFactor: aNumber cummulativeFactor: anotherNumber [

	^ (self name: aString)
		  transientFactor: aNumber;
		  cummulativeFactor: anotherNumber;
		  yourself
]

{ #category : #constants }
CMIDAIRRPGPolicymakerAction class >> openQuarrantineCamp [

	^ self name: 'ID:33 Quarantine' cummulativeFactor: 0.8
]

{ #category : #constants }
CMIDAIRRPGPolicymakerAction class >> socialDistancing1 [

	^ self name: 'ID:27 Social distancing level 1' transientFactor: 0.9
]

{ #category : #constants }
CMIDAIRRPGPolicymakerAction class >> socialDistancing2 [

	^ self name: 'ID:28 Social distancing level 2' transientFactor: 0.8
]

{ #category : #constants }
CMIDAIRRPGPolicymakerAction class >> socialDistancing3 [

	^ self name: 'ID:29 Social distancing level 3' transientFactor: 0.75
]

{ #category : #constants }
CMIDAIRRPGPolicymakerAction class >> socialDistancing4 [

	^ self name: 'ID:30 Social distancing level 4' transientFactor: 0.7
]

{ #category : #constants }
CMIDAIRRPGPolicymakerAction class >> socialDistancing5 [

	^ self name: 'ID:31 Social distancing level 5' transientFactor: 0.65
]

{ #category : #constants }
CMIDAIRRPGPolicymakerAction class >> treatmentGuideline [

	^ self name: 'ID:22 Issue treatment guidelines' cummulativeFactor: 0.8
]

{ #category : #constants }
CMIDAIRRPGPolicymakerAction class >> vaccination100 [

	^ self name: 'ID:26 Provide vaccine to 100% of population' cummulativeFactor: 0.01
]

{ #category : #constants }
CMIDAIRRPGPolicymakerAction class >> vaccination25 [

	^ self name: 'ID:23 Provide vaccine to 25% of population' cummulativeFactor: 0.75
]

{ #category : #constants }
CMIDAIRRPGPolicymakerAction class >> vaccination50 [

	^ self name: 'ID:24 Provide vaccine to 50% of population' cummulativeFactor: 0.5
]

{ #category : #constants }
CMIDAIRRPGPolicymakerAction class >> vaccination75 [

	^ self name: 'ID:25 Provide vaccine to 75% of population' cummulativeFactor: 0.25
]

{ #category : #accessing }
CMIDAIRRPGPolicymakerAction >> askEffectiveRate [

	(UIManager default
		 request: 'Effective rate among citizens?'
		 initialAnswer: '1.0') ifNotNil: [ :answer | 
		[ 
		| rate |
		rate := answer asFloat.
		(rate between: 0.0 and: 1.0) ifTrue: [ ^ rate ] ] ].
	^ nil
]

{ #category : #accessing }
CMIDAIRRPGPolicymakerAction >> cummulativeFactor [

	^ cummulativeFactor
]

{ #category : #accessing }
CMIDAIRRPGPolicymakerAction >> cummulativeFactor: aNumber [

	cummulativeFactor := aNumber
]

{ #category : #execution }
CMIDAIRRPGPolicymakerAction >> execute: aCMIDAIRContactModel [

	self askEffectiveRate ifNotNil: [ :rate | 
		aCMIDAIRContactModel socialProfile transientFactor:
			self transientFactor ** rate.
		aCMIDAIRContactModel socialProfile multiplyCummulativeFactor:
			self cummulativeFactor ** rate ]
]

{ #category : #initialization }
CMIDAIRRPGPolicymakerAction >> initialize [

	super initialize.
	transientFactor := 1.0.
	cummulativeFactor := 1.0
]

{ #category : #testing }
CMIDAIRRPGPolicymakerAction >> isContactAction [

	^ true
]

{ #category : #accessing }
CMIDAIRRPGPolicymakerAction >> transientFactor [

	^ transientFactor
]

{ #category : #accessing }
CMIDAIRRPGPolicymakerAction >> transientFactor: aNumber [

	transientFactor := aNumber
]
