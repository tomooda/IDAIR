Class {
	#name : #CMIDAIRSEIRMildSymptom,
	#superclass : #CMIDAIRSEIRIll,
	#category : #'Cormas-Model-IDAIR-Disease-SEIR'
}

{ #category : #accessing }
CMIDAIRSEIRMildSymptom >> beta [

	^ self modelParameterAt: #beta_mild
]

{ #category : #accessing }
CMIDAIRSEIRMildSymptom >> color [

	^ Color red mixed: 0.5 with: Color yellow
]

{ #category : #accessing }
CMIDAIRSEIRMildSymptom >> name [

	^ 'mild'
]

{ #category : #accessing }
CMIDAIRSEIRMildSymptom >> next [

	^ CMIDAIRSEIRRecovered newFrom: self
]

{ #category : #accessing }
CMIDAIRSEIRMildSymptom >> p_severe [

	^ self modelParameterAt: #p_severe
]

{ #category : #stepping }
CMIDAIRSEIRMildSymptom >> step [

	1.0 - (1.0 - self p_severe ** self daysPerStep) >= self random 
		ifTrue: [ ^ CMIDAIRSEIRSevereSymptom newFrom: self ].
	^ super step
]

{ #category : #accessing }
CMIDAIRSEIRMildSymptom >> tau [

	^ self modelParameterAt: #tau_mild
]
