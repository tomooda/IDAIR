Class {
	#name : #CMIDAIRSimpleTimeModel,
	#superclass : #CMIDAIRTimeModel,
	#instVars : [
		'daysPerStep'
	],
	#category : #'Cormas-Model-IDAIR-Time-Simple'
}

{ #category : #converting }
CMIDAIRSimpleTimeModel >> asPresenter [

	^ CMIDAIRSimpleTimeModelPresenter on: self
]

{ #category : #accessing }
CMIDAIRSimpleTimeModel >> daysPerStep [

	^ daysPerStep ifNil: [ daysPerStep := 1.0 ]
]

{ #category : #accessing }
CMIDAIRSimpleTimeModel >> daysPerStep: aNumber [

	daysPerStep := aNumber
]

{ #category : #'user interfaces' }
CMIDAIRSimpleTimeModel >> openGUI [

	^ self asPresenter openWithSpec
]

{ #category : #control }
CMIDAIRSimpleTimeModel >> step: anInteger [

	
]
