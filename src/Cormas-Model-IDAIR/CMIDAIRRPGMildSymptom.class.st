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

	^ self modelParameterAt: #p_severe
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
