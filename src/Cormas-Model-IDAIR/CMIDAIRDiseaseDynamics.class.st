Class {
	#name : #CMIDAIRDiseaseDynamics,
	#superclass : #Object,
	#classInstVars : [
		'randomGenerator'
	],
	#category : #'Cormas-Model-IDAIR'
}

{ #category : #testing }
CMIDAIRDiseaseDynamics class >> isAbstract [

	^ self = CMIDAIRDiseaseDynamics
]

{ #category : #accessing }
CMIDAIRDiseaseDynamics class >> randomGenerator [

	^ randomGenerator ifNil: [ randomGenerator := Random new ]
]

{ #category : #transitioning }
CMIDAIRDiseaseDynamics >> beAsymptomatic [

	^ CMIDAIRAsymptomatic newFrom: self
]

{ #category : #transitioning }
CMIDAIRDiseaseDynamics >> beDead [

	^ CMIDAIRDead newFrom: self
]

{ #category : #transitioning }
CMIDAIRDiseaseDynamics >> beHomeCared [

	^ CMIDAIRHomeCared newFrom: self
]

{ #category : #transitioning }
CMIDAIRDiseaseDynamics >> beHospitalized [

	^ CMIDAIRHospitalized newFrom: self
]

{ #category : #transitioning }
CMIDAIRDiseaseDynamics >> beICUed [

	^ CMIDAIRICUed newFrom: self
]

{ #category : #transitioning }
CMIDAIRDiseaseDynamics >> beIncubative [

	^ CMIDAIRIncubative new
]

{ #category : #transitioning }
CMIDAIRDiseaseDynamics >> beNegative [

	^ CMIDAIRNegative new
]

{ #category : #accessing }
CMIDAIRDiseaseDynamics >> color [

	^ self subclassResponsibility
]

{ #category : #actions }
CMIDAIRDiseaseDynamics >> contact [

	^ self subclassResponsibility
]

{ #category : #actions }
CMIDAIRDiseaseDynamics >> contaminate: aCMIDAIRLocation [

	^ self subclassResponsibility
]

{ #category : #testing }
CMIDAIRDiseaseDynamics >> isActive [

	^ self subclassResponsibility
]

{ #category : #testing }
CMIDAIRDiseaseDynamics >> isDead [

	^ false
]

{ #category : #testing }
CMIDAIRDiseaseDynamics >> isIsolated [

	^ false
]

{ #category : #testing }
CMIDAIRDiseaseDynamics >> isTransmissible [

	^ self subclassResponsibility
]

{ #category : #parameters }
CMIDAIRDiseaseDynamics >> pFalseNegative [

	^ 0.1
]

{ #category : #parameters }
CMIDAIRDiseaseDynamics >> pHospitalized [

	^ 0.2
]

{ #category : #parameters }
CMIDAIRDiseaseDynamics >> pInfection [

	^ 0.3
]

{ #category : #parameters }
CMIDAIRDiseaseDynamics >> pSymptomatic [

	^ 0.5
]

{ #category : #accessing }
CMIDAIRDiseaseDynamics >> random [

	^ self class randomGenerator next
]

{ #category : #actions }
CMIDAIRDiseaseDynamics >> step [

	^ self subclassResponsibility
]

{ #category : #actions }
CMIDAIRDiseaseDynamics >> test [

	^ self subclassResponsibility
]
