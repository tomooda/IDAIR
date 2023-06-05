Class {
	#name : #CMIDAIROxfordRecovered,
	#superclass : #CMIDAIROxfordDiseaseDynamics,
	#category : #'Cormas-Model-IDAIR-Disease-Oxford'
}

{ #category : #actions }
CMIDAIROxfordRecovered >> beExposed [

	^ self
]

{ #category : #accessing }
CMIDAIROxfordRecovered >> beta [

	^ 0.0
]

{ #category : #accessing }
CMIDAIROxfordRecovered >> color [

	^ Color cyan
]

{ #category : #accessing }
CMIDAIROxfordRecovered >> estimatedTransmissibleDuration [

	^ 0.0
]

{ #category : #testing }
CMIDAIROxfordRecovered >> isInCommunity [

	^ true
]

{ #category : #testing }
CMIDAIROxfordRecovered >> isRecovered [

	^ true
]

{ #category : #testing }
CMIDAIROxfordRecovered >> isTransmissible [

	^ false
]

{ #category : #accessing }
CMIDAIROxfordRecovered >> name [

	^ 'recovered'
]

{ #category : #actions }
CMIDAIROxfordRecovered >> step [

	^ self
]

{ #category : #accessing }
CMIDAIROxfordRecovered >> tau [

	^ Float infinity
]
