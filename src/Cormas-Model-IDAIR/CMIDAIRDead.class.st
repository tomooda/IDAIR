Class {
	#name : #CMIDAIRDead,
	#superclass : #CMIDAIRDiseaseDynamics,
	#category : #'Cormas-Model-IDAIR-Disease-Oxford'
}

{ #category : #'initialize - release' }
CMIDAIRDead >> beInfected [

	^ self
]

{ #category : #accessing }
CMIDAIRDead >> color [

	^ self modelParameterAt: #deadColor
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
