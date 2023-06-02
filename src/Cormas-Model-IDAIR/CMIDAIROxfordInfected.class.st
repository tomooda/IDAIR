Class {
	#name : #CMIDAIROxfordInfected,
	#superclass : #CMIDAIROxfordDiseaseDynamics,
	#instVars : [
		'duration'
	],
	#category : #'Cormas-Model-IDAIR-Disease-Oxford'
}

{ #category : #testing }
CMIDAIROxfordInfected class >> isAbstract [

	^ self = CMIDAIROxfordInfected
]

{ #category : #'instance creation' }
CMIDAIROxfordInfected class >> newFrom: anObject [

	^ (super newFrom: anObject)
		  duration: 0.0;
		  yourself
]

{ #category : #transitioning }
CMIDAIROxfordInfected >> beExposed [

	^ self
]

{ #category : #accessing }
CMIDAIROxfordInfected >> duration [

	^ duration ifNil: [ duration := 0.0 ]
]

{ #category : #accessing }
CMIDAIROxfordInfected >> duration: aNumber [

	duration := aNumber
]

{ #category : #testing }
CMIDAIROxfordInfected >> isInfected [

	^ true
]
