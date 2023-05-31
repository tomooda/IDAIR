Class {
	#name : #CMIDAIROxfordSymptomatic,
	#superclass : #CMIDAIROxfordInfected,
	#category : #'Cormas-Model-IDAIR-Disease-Oxford'
}

{ #category : #testing }
CMIDAIROxfordSymptomatic class >> isAbstract [

	^ self = CMIDAIROxfordSymptomatic
]

{ #category : #testing }
CMIDAIROxfordSymptomatic >> isSymptomatic [

	^ true
]

{ #category : #actions }
CMIDAIROxfordSymptomatic >> test [

	^ self
]
