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
CMIDAIRSEIRMildSymptom >> tau [

	^ self modelParameterAt: #tau_mild
]
