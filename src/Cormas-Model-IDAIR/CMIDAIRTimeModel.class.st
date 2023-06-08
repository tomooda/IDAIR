Class {
	#name : #CMIDAIRTimeModel,
	#superclass : #CMIDAIRSubmodel,
	#instVars : [
		'daysPerStep'
	],
	#category : #'Cormas-Model-IDAIR-Time'
}

{ #category : #accessing }
CMIDAIRTimeModel >> daysPerStep [

	^ daysPerStep ifNil: [ daysPerStep := 1.0 ]
]

{ #category : #accessing }
CMIDAIRTimeModel >> daysPerStep: aNumber [

	daysPerStep := aNumber
]

{ #category : #accessing }
CMIDAIRTimeModel >> name [

	^ #time
]

{ #category : #control }
CMIDAIRTimeModel >> step: anInteger [

	
]
