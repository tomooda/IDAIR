Class {
	#name : #CMIDAIRSimpleTimeModel,
	#superclass : #CMIDAIRTimeModel,
	#category : #'Cormas-Model-IDAIR-Time-Simple'
}

{ #category : #converting }
CMIDAIRSimpleTimeModel >> asPresenter [

	^ CMIDAIRSimpleTimeModelPresenter on: self
]

{ #category : #'user interfaces' }
CMIDAIRSimpleTimeModel >> openGUI [

	^ self asPresenter openWithSpec
]
