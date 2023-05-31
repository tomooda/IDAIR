Class {
	#name : #CMIDAIROxfordDead,
	#superclass : #CMIDAIROxfordDiseaseDynamics,
	#category : #'Cormas-Model-IDAIR-Disease-Oxford'
}

{ #category : #'initialize - release' }
CMIDAIROxfordDead >> beInfected [

	^ self
]

{ #category : #accessing }
CMIDAIROxfordDead >> color [

	^ self modelParameterAt: #deadColor
]

{ #category : #actions }
CMIDAIROxfordDead >> contact [

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

{ #category : #actions }
CMIDAIROxfordDead >> test [

	^ self
]
