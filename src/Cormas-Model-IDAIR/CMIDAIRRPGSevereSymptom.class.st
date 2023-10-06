Class {
	#name : #CMIDAIRRPGSevereSymptom,
	#superclass : #CMIDAIRRPGIll,
	#category : #'Cormas-Model-IDAIR-Disease-RPG'
}

{ #category : #'instance creation' }
CMIDAIRRPGSevereSymptom class >> newFrom: aCMIDAIRSEIRDiseaseDynamics [

	aCMIDAIRSEIRDiseaseDynamics citizen cormasModel
		submodelAt: #disease
		do: [ :diseaseModel | 
			aCMIDAIRSEIRDiseaseDynamics isMildSymptom
				ifTrue: [ diseaseModel incrementNewWorsened ]
				ifFalse: [ diseaseModel incrementNewSevere ] ].
	^ super newFrom: aCMIDAIRSEIRDiseaseDynamics
]

{ #category : #accessing }
CMIDAIRRPGSevereSymptom >> beta [

	^ self modelParameterAt: #beta_severe
]

{ #category : #accessing }
CMIDAIRRPGSevereSymptom >> color [

	^ Color red
]

{ #category : #testing }
CMIDAIRRPGSevereSymptom >> isSevereSymptom [

	^ true
]

{ #category : #accessing }
CMIDAIRRPGSevereSymptom >> name [

	^ 'severe'
]

{ #category : #accessing }
CMIDAIRRPGSevereSymptom >> next [

	^ CMIDAIRRPGRecovering newFrom: self
]

{ #category : #accessing }
CMIDAIRRPGSevereSymptom >> p_dead [

	| p |
	p := self modelParameterAt: #p_dead.
	self citizen cormasModel
		submodelAt: #resource
		do: [ :resourceModel | 
			(resourceModel isInICU: self citizen) ifTrue: [ ^ p * 0.2 ].
			(resourceModel isInBed: self citizen) ifTrue: [ ^ p * 0.5 ] ].
	^ p
]

{ #category : #stepping }
CMIDAIRRPGSevereSymptom >> step [

	1.0 - (1.0 - self p_dead ** self daysPerStep) >= self random ifTrue: [ 
		^ CMIDAIRRPGDead newFrom: self ].
	^ super step
]

{ #category : #accessing }
CMIDAIRRPGSevereSymptom >> tau [

	^ self modelParameterAt: #tau_severe
]
