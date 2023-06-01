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
CMIDAIROxfordRecovered >> color [

	^ Color cyan
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

{ #category : #actions }
CMIDAIROxfordRecovered >> test [

	^ self
]
