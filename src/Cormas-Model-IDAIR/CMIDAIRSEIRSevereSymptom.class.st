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
CMIDAIRSEIRSevereSymptom >> tau [

	^ self modelParameterAt: #tau_severe
]
