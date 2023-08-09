Class {
	#name : #CMIDAIRSingleLocationContactModel,
	#superclass : #CMIDAIRContactModel,
	#category : #'Cormas-Model-IDAIR-Contact-SingleLocation'
}

{ #category : #accessing }
CMIDAIRSingleLocationContactModel class >> submodelName [

	^ 'single location'
]

{ #category : #converting }
CMIDAIRSingleLocationContactModel >> asPresenter [

	^ CMIDAIRSingleLocationContactModelPresenter on: self
]

{ #category : #'accessing-contact' }
CMIDAIRSingleLocationContactModel >> defaultContactProfileClass [

	^ CMIDAIRSingleLocationContactProfile
]

{ #category : #initialization }
CMIDAIRSingleLocationContactModel >> init [

	
]

{ #category : #accessing }
CMIDAIRSingleLocationContactModel >> initializers [

	^ {  }
]

{ #category : #converting }
CMIDAIRSingleLocationContactModel >> openGUI [

	^ self asPresenter openWithSpec
]
