Class {
	#name : #CMIDAIRLocation,
	#superclass : #CMSpatialEntityElement,
	#instVars : [
		'name',
		'isContaminated',
		'pTransDisease'
	],
	#category : #'Cormas-Model-IDAIR-Core'
}

{ #category : #accessing }
CMIDAIRLocation >> name [

	^ name ifNil: [ #NA ]
]

{ #category : #accessing }
CMIDAIRLocation >> name: aSymbol [

	name := aSymbol asSymbol
]
