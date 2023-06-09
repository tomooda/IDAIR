Class {
	#name : #CMIDAIRTimeModel,
	#superclass : #CMIDAIRSubmodel,
	#category : #'Cormas-Model-IDAIR-Time'
}

{ #category : #testing }
CMIDAIRTimeModel class >> isAbstract [

	^ self = CMIDAIRTimeModel
]

{ #category : #accessing }
CMIDAIRTimeModel >> daysPerStep [

	^ self subclassResponsibility
]

{ #category : #accessing }
CMIDAIRTimeModel >> name [

	^ #time
]

{ #category : #accessing }
CMIDAIRTimeModel >> order [

	^ 0.9
]
