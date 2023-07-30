Class {
	#name : #CMIDAIRContactProfile,
	#superclass : #Object,
	#instVars : [
		'citizen'
	],
	#category : #'Cormas-Model-IDAIR-Contact'
}

{ #category : #'instance creation' }
CMIDAIRContactProfile class >> on: aCMIDAIRCitizen [

	^ self new
		  citizen: aCMIDAIRCitizen;
		  yourself
]

{ #category : #accessing }
CMIDAIRContactProfile >> citizen [

	^ citizen
]

{ #category : #accessing }
CMIDAIRContactProfile >> citizen: aCMIDAIRCitizen [

	citizen := aCMIDAIRCitizen
]

{ #category : #accessing }
CMIDAIRContactProfile >> modelParameterAt: aSymbol [

	^ citizen cormasModel submodelAt: #contact do: aSymbol
]

{ #category : #accessing }
CMIDAIRContactProfile >> probabilityFromPrior: aNumber [

	^ self subclassResponsibility
]
