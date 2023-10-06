Class {
	#name : #CMIDAIRRPGMildSymptom,
	#superclass : #CMIDAIRRPGIll,
	#category : #'Cormas-Model-IDAIR-Disease-RPG'
}

{ #category : #'instance creation' }
CMIDAIRRPGMildSymptom class >> newFrom: aCMIDAIRSEIRDiseaseDynamics [

	aCMIDAIRSEIRDiseaseDynamics citizen cormasModel
		submodelAt: #disease
		do: [ :diseaseModel | diseaseModel incrementNewMild ].
	^ super newFrom: aCMIDAIRSEIRDiseaseDynamics
]

{ #category : #accessing }
CMIDAIRRPGMildSymptom >> beta [

	^ self modelParameterAt: #beta_mild
]

{ #category : #accessing }
CMIDAIRRPGMildSymptom >> color [

	^ Color red mixed: 0.5 with: Color yellow
]

{ #category : #testing }
CMIDAIRRPGMildSymptom >> isMildSymptom [

	^ true
]

{ #category : #accessing }
CMIDAIRRPGMildSymptom >> name [

	^ 'mild'
]

{ #category : #accessing }
CMIDAIRRPGMildSymptom >> next [

	^ CMIDAIRRPGRecovered newFrom: self
]

{ #category : #accessing }
CMIDAIRRPGMildSymptom >> p_severe [

	| p |
	p := self modelParameterAt: #p_severe.
	self citizen cormasModel
		submodelAt: #resource
		do: [ :resourceModel | 
			(resourceModel isInICU: self citizen) ifTrue: [ ^ p * 0.2 ].
			(resourceModel isInBed: self citizen) ifTrue: [ ^ p * 0.5 ] ].
	^ p
]

{ #category : #stepping }
CMIDAIRRPGMildSymptom >> step [

	1.0 - (1.0 - self p_severe ** self daysPerStep) >= self random 
		ifTrue: [ ^ CMIDAIRRPGSevereSymptom newFrom: self ].
	^ super step
]

{ #category : #accessing }
CMIDAIRRPGMildSymptom >> tau [

	^ self modelParameterAt: #tau_mild
]
