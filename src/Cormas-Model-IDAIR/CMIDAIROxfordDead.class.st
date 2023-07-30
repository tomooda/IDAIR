Class {
	#name : #CMIDAIROxfordDead,
	#superclass : #CMIDAIROxfordDiseaseDynamics,
	#category : #'Cormas-Model-IDAIR-Disease-Oxford'
}

{ #category : #'initialize - release' }
CMIDAIROxfordDead >> beExposed [

	^ self
]

{ #category : #accessing }
CMIDAIROxfordDead >> beta [

	^ 0.0
]

{ #category : #accessing }
CMIDAIROxfordDead >> color [

	^ self modelParameterAt: #deadColor
]

{ #category : #accessing }
CMIDAIROxfordDead >> estimatedTransmissibleDuration [

	^ 0.0
]

{ #category : #accessing }
CMIDAIROxfordDead >> inCommunity [

	^ self
]

{ #category : #testing }
CMIDAIROxfordDead >> isActive [

	^ false
]

{ #category : #testing }
CMIDAIROxfordDead >> isDead [

	^ true
]

{ #category : #testing }
CMIDAIROxfordDead >> isTransmissible [

	^ false
]

{ #category : #accessing }
CMIDAIROxfordDead >> name [

	^ 'dead'
]

{ #category : #actions }
CMIDAIROxfordDead >> step [

	^ self
]

{ #category : #accessing }
CMIDAIROxfordDead >> tau [

	^ Float infinity
]
