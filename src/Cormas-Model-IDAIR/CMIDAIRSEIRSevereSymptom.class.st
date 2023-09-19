Class {
	#name : #CMIDAIRSEIRSevereSymptom,
	#superclass : #CMIDAIRSEIRIll,
	#category : #'Cormas-Model-IDAIR-Disease-SEIR'
}

{ #category : #accessing }
CMIDAIRSEIRSevereSymptom >> beta [

	^ self modelParameterAt: #beta_severe
]

{ #category : #accessing }
CMIDAIRSEIRSevereSymptom >> color [

	^ Color red
]

{ #category : #accessing }
CMIDAIRSEIRSevereSymptom >> name [

	^ 'severe'
]

{ #category : #accessing }
CMIDAIRSEIRSevereSymptom >> next [

	^ CMIDAIRSEIRRecovering newFrom: self
]

{ #category : #accessing }
CMIDAIRSEIRSevereSymptom >> p_dead [

	^ self modelParameterAt: #p_dead
]

{ #category : #stepping }
CMIDAIRSEIRSevereSymptom >> step [

	1.0 - (1.0 - self p_dead ** self daysPerStep) >= self random ifTrue: [ 
		^ CMIDAIRSEIRDead newFrom: self ].
	^ super step
]

{ #category : #accessing }
CMIDAIRSEIRSevereSymptom >> tau [

	^ self modelParameterAt: #tau_severe
]
