Class {
	#name : #CMIDAIRSimpleTimeModel,
	#superclass : #CMIDAIRTimeModel,
	#instVars : [
		'daysPerStep'
	],
	#category : #'Cormas-Model-IDAIR-Time-Simple'
}

{ #category : #accessing }
CMIDAIRSimpleTimeModel class >> submodelName [

	^ 'simple'
]

{ #category : #converting }
CMIDAIRSimpleTimeModel >> asPresenter [

	^ CMIDAIRSimpleTimeModelPresenter on: self
]

{ #category : #accessing }
CMIDAIRSimpleTimeModel >> daysPerStep [

	^ daysPerStep ifNil: [ daysPerStep := 0.25 ]
]

{ #category : #accessing }
CMIDAIRSimpleTimeModel >> daysPerStep: aNumber [

	daysPerStep := aNumber
]

{ #category : #accessing }
CMIDAIRSimpleTimeModel >> initializers [

	^ {  }
]

{ #category : #'user interfaces' }
CMIDAIRSimpleTimeModel >> openGUI [

	^ self asPresenter openWithSpec
]

{ #category : #control }
CMIDAIRSimpleTimeModel >> step: anInteger [

	
]
