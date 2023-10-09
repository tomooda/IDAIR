Class {
	#name : #CMIDAIRRPGAction,
	#superclass : #Object,
	#instVars : [
		'name'
	],
	#category : #'Cormas-Model-IDAIR-RPG-Actions'
}

{ #category : #'instance creation' }
CMIDAIRRPGAction class >> name: aString [

	^ self new
		  name: aString;
		  yourself
]

{ #category : #accessing }
CMIDAIRRPGAction >> actionName [

	^ name
]

{ #category : #accessing }
CMIDAIRRPGAction >> icon [

	^ Cursor blank
]

{ #category : #testing }
CMIDAIRRPGAction >> isSocialAction [

	^ false
]

{ #category : #accessing }
CMIDAIRRPGAction >> name [

	^ name
]

{ #category : #accessing }
CMIDAIRRPGAction >> name: aString [

	name := aString
]

{ #category : #accessing }
CMIDAIRRPGAction >> postfix [

	^ ''
]

{ #category : #accessing }
CMIDAIRRPGAction >> printOn: aStream [

	aStream nextPutAll: name
]
