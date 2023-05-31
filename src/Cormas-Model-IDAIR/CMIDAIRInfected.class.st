Class {
	#name : #CMIDAIRInfected,
	#superclass : #CMIDAIRDiseaseDynamics,
	#instVars : [
		'duration'
	],
	#category : #'Cormas-Model-IDAIR-Disease-Oxford'
}

{ #category : #testing }
CMIDAIRInfected class >> isAbstract [

	^ self = CMIDAIRInfected
]

{ #category : #'instance creation' }
CMIDAIRInfected class >> newFrom: anObject [

	^ (super newFrom: anObject)
		  duration: 0.0;
		  yourself
]

{ #category : #transitioning }
CMIDAIRInfected >> beInfected [

	^ self
]

{ #category : #actions }
CMIDAIRInfected >> contact [

	^ self
]

{ #category : #accessing }
CMIDAIRInfected >> duration [

	^ duration ifNil: [ duration := 0.0 ]
]

{ #category : #accessing }
CMIDAIRInfected >> duration: aNumber [

	duration := aNumber
]

{ #category : #testing }
CMIDAIRInfected >> isInfected [

	^ true
]
