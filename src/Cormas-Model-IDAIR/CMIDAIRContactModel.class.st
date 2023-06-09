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
CMIDAIRContactModel >> name [

	^ #contact
]

{ #category : #accessing }
CMIDAIRContactModel >> order [

	^ 0.5
]
