Class {
	#name : #CMIDAIRLocationDynamics,
	#superclass : #Object,
	#instVars : [
		'citizen'
	],
	#category : #'Cormas-Model-IDAIR-Location'
}

{ #category : #accessing }
CMIDAIRLocationDynamics >> citizen [

	^ citizen
]

{ #category : #accessing }
CMIDAIRLocationDynamics >> citizen: aCMIDAIRCitizen [

	citizen := aCMIDAIRCitizen
]

{ #category : #accessing }
CMIDAIRLocationDynamics >> locationDesignators: aCollectionOfSymbol [

	^ self subclassResponsibility
]
