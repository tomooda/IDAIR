Class {
	#name : #CMIDAIROxfordPreSymptomatic,
	#superclass : #CMIDAIROxfordInfected,
	#category : #'Cormas-Model-IDAIR-Disease-Oxford'
}

{ #category : #testing }
CMIDAIROxfordPreSymptomatic class >> isAbstract [

	^ self = CMIDAIROxfordPreSymptomatic
]

{ #category : #testing }
CMIDAIROxfordPreSymptomatic >> isActive [

	^ true
]

{ #category : #testing }
CMIDAIROxfordPreSymptomatic >> isInCommunity [

	^ true
]

{ #category : #testing }
CMIDAIROxfordPreSymptomatic >> isPreSymptomatic [

	^ true
]

{ #category : #testing }
CMIDAIROxfordPreSymptomatic >> isTransmissible [

	^ true
]

{ #category : #accessing }
CMIDAIROxfordPreSymptomatic >> tau [

	^ self tauSym
]
