Class {
	#name : #CMIDAIRContactModel,
	#superclass : #CMIDAIRSubmodel,
	#category : #'Cormas-Model-IDAIR-Contact'
}

{ #category : #testing }
CMIDAIRContactModel class >> isAbstract [

	^ self = CMIDAIRContactModel
]

{ #category : #accessing }
CMIDAIRContactModel class >> order [

	^ 0.5
]

{ #category : #accessing }
CMIDAIRContactModel class >> submodelCategoryName [

	^ #contact
]
