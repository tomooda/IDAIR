Class {
	#name : #CMIDAIRRPGContactModel,
	#superclass : #CMIDAIRContactModel,
	#instVars : [
		'socialProfile',
		'factors'
	],
	#category : #'Cormas-Model-IDAIR-Contact-RPG'
}

{ #category : #accessing }
CMIDAIRRPGContactModel class >> submodelName [

	^ 'RPG'
]

{ #category : #'accessing-contact' }
CMIDAIRRPGContactModel >> defaultContactProfileClass [

	^ CMIDAIRRPGContactProfile
]

{ #category : #'initialize-release' }
CMIDAIRRPGContactModel >> init [

	
]

{ #category : #'initialize-release' }
CMIDAIRRPGContactModel >> initialize [

	super initialize.
	socialProfile := CMIDAIRRPGSocialProfile new.
	factors := Dictionary new
]

{ #category : #accessing }
CMIDAIRRPGContactModel >> initializers [

	^ Array new
]
