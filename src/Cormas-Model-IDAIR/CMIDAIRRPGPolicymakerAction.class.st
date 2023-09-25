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
		  self lockdown }
]

{ #category : #constants }
CMIDAIRRPGPolicymakerAction class >> closeBorder [

	^ self name: 'Close the border' transientFactor: 0.7
]

{ #category : #constants }
CMIDAIRRPGPolicymakerAction class >> facemask [

	^ self name: 'Wear a facemask' transientFactor: 0.8
]

{ #category : #constants }
CMIDAIRRPGPolicymakerAction class >> lockdown [

	^ self name: 'Lockdown' transientFactor: 0.5
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
CMIDAIRRPGPolicymakerAction class >> socialDistancing1 [

	^ self name: 'Social distancing level 1' transientFactor: 0.9
]

{ #category : #constants }
CMIDAIRRPGPolicymakerAction class >> socialDistancing2 [

	^ self name: 'Social distancing level 2' transientFactor: 0.8
]

{ #category : #constants }
CMIDAIRRPGPolicymakerAction class >> socialDistancing3 [

	^ self name: 'Social distancing level 3' transientFactor: 0.75
]

{ #category : #constants }
CMIDAIRRPGPolicymakerAction class >> socialDistancing4 [

	^ self name: 'Social distancing level 4' transientFactor: 0.7
]

{ #category : #constants }
CMIDAIRRPGPolicymakerAction class >> socialDistancing5 [

	^ self name: 'Social distancing level 5' transientFactor: 0.65
]

{ #category : #constants }
CMIDAIRRPGPolicymakerAction class >> treatmentGuideline [

	^ self name: 'Issue treatment guideline' cummulativeFactor: 0.8
]

{ #category : #constants }
CMIDAIRRPGPolicymakerAction class >> vaccination100 [

	^ self name: 'Vaccination to 100% people' cummulativeFactor: 0.01
]

{ #category : #constants }
CMIDAIRRPGPolicymakerAction class >> vaccination25 [

	^ self name: 'Vaccination to 25% people' cummulativeFactor: 0.75
]

{ #category : #constants }
CMIDAIRRPGPolicymakerAction class >> vaccination50 [

	^ self name: 'Vaccination to 50% people' cummulativeFactor: 0.5
]

{ #category : #constants }
CMIDAIRRPGPolicymakerAction class >> vaccination75 [

	^ self name: 'Vaccination to 75% people' cummulativeFactor: 0.25
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
CMIDAIRRPGPolicymakerAction >> execute: aCMIDAIRRPGSocialProfile [

	aCMIDAIRRPGSocialProfile
		transientFactor: transientFactor;
		multiplyCummulativeFactor: cummulativeFactor
]

{ #category : #initialization }
CMIDAIRRPGPolicymakerAction >> initialize [

	super initialize.
	transientFactor := 1.0.
	cummulativeFactor := 1.0
]

{ #category : #accessing }
CMIDAIRRPGPolicymakerAction >> transientFactor [

	^ transientFactor
]

{ #category : #accessing }
CMIDAIRRPGPolicymakerAction >> transientFactor: aNumber [

	transientFactor := aNumber
]
