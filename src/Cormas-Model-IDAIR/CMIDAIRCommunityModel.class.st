Class {
	#name : #CMIDAIRCommunityModel,
	#superclass : #CMIDAIRSubmodel,
	#instVars : [
		'visitsPerDay'
	],
	#category : #'Cormas-Model-IDAIR-Community'
}

{ #category : #accessing }
CMIDAIRCommunityModel class >> order [

	^ 0.2
]

{ #category : #accessing }
CMIDAIRCommunityModel class >> submodelCategoryName [

	^ #community
]

{ #category : #initialization }
CMIDAIRCommunityModel >> init [

	
]

{ #category : #initialization }
CMIDAIRCommunityModel >> initialize [

	super initialize.
	visitsPerDay := 10
]

{ #category : #accessing }
CMIDAIRCommunityModel >> initializers [

	^ {  }
]

{ #category : #control }
CMIDAIRCommunityModel >> step: anInteger [

	self cormasModel theLocations do: #clearVisited.
	self cormasModel theCommunityHealthcareWorkers do: #step
]

{ #category : #accessing }
CMIDAIRCommunityModel >> visitsPerDay [

	^ visitsPerDay
]

{ #category : #accessing }
CMIDAIRCommunityModel >> visitsPerDay: aNumber [

	visitsPerDay := aNumber
]
