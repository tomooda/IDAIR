Class {
	#name : #CMIDAIRSEIRRecoveringSymptom,
	#superclass : #CMIDAIRSEIRIll,
	#category : #'Cormas-Model-IDAIR-Disease-SEIR'
}

{ #category : #accessing }
CMIDAIRSEIRRecoveringSymptom >> beta [

	^ self modelParameterAt: #beta_recovering
]

{ #category : #accessing }
CMIDAIRSEIRRecoveringSymptom >> color [

	^ Color red mixed: 0.5 with: Color blue
]

{ #category : #accessing }
CMIDAIRSEIRRecoveringSymptom >> tau [

	^ self modelParameterAt: #tau_recovering
]
