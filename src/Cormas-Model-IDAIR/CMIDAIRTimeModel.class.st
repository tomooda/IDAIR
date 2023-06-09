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
CMIDAIRTimeModel class >> order [

	^ 0.9
]

{ #category : #accessing }
CMIDAIRTimeModel class >> submodelCategoryName [

	^ #time
]

{ #category : #accessing }
CMIDAIRTimeModel >> daysPerStep [

	^ self subclassResponsibility
]
