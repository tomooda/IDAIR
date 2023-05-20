Class {
	#name : #CMIDAIRLocation,
	#superclass : #CMSpatialEntityElement,
	#instVars : [
		'name',
		'isContaminated',
		'pTransDisease'
	],
	#category : #'Cormas-Model-IDAIR'
}

{ #category : #accessing }
CMIDAIRLocation >> clearContamination [

	self isContaminated: false
]

{ #category : #pov }
CMIDAIRLocation >> contaminationPov [

	<pov>
	^ self isContaminated
		  ifTrue: [ Color red alpha: 0.2 ]
		  ifFalse: [ Color transparent ]
]

{ #category : #defaults }
CMIDAIRLocation >> defaultPTransDisease [

	^ 0.5
]

{ #category : #accessing }
CMIDAIRLocation >> isContaminated [

	^ isContaminated ifNil: [ isContaminated := false ]
]

{ #category : #accessing }
CMIDAIRLocation >> isContaminated: aBoolean [

	isContaminated := aBoolean
]

{ #category : #accessing }
CMIDAIRLocation >> name [

	^ name ifNil: [ #NA ]
]

{ #category : #accessing }
CMIDAIRLocation >> name: aSymbol [

	name := aSymbol asSymbol
]

{ #category : #accessing }
CMIDAIRLocation >> pTransDisease [

	^ pTransDisease ifNil: [ pTransDisease := self defaultPTransDisease ]
]

{ #category : #accessing }
CMIDAIRLocation >> pTransDisease: aNumber [

	pTransDisease := aNumber
]
