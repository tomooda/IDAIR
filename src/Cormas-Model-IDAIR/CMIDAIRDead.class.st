Class {
	#name : #CMIDAIRDead,
	#superclass : #CMIDAIRDiseaseDynamics,
	#category : #'Cormas-Model-IDAIR-Disease'
}

{ #category : #'initialize - release' }
CMIDAIRDead >> beSusceptible [

	^ self
]

{ #category : #accessing }
CMIDAIRDead >> color [

	^ Color black
]

{ #category : #actions }
CMIDAIRDead >> contact [

	^ self
]

{ #category : #actions }
CMIDAIRDead >> contaminate: aCMIDAIRLocation [

	
]

{ #category : #testing }
CMIDAIRDead >> isActive [

	^ false
]

{ #category : #testing }
CMIDAIRDead >> isDead [

	^ true
]

{ #category : #testing }
CMIDAIRDead >> isIsolated [

	^ true
]

{ #category : #testing }
CMIDAIRDead >> isTransmissible [

	^ false
]

{ #category : #accessing }
CMIDAIRDead >> name [

	^ 'dead'
]

{ #category : #actions }
CMIDAIRDead >> step [

	^ self
]

{ #category : #actions }
CMIDAIRDead >> test [

	^ self
]
