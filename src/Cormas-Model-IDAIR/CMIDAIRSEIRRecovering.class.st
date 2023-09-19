Class {
	#name : #CMIDAIRSEIRRecovering,
	#superclass : #CMIDAIRSEIRIll,
	#category : #'Cormas-Model-IDAIR-Disease-SEIR'
}

{ #category : #accessing }
CMIDAIRSEIRRecovering >> beta [

	^ self modelParameterAt: #beta_recovering
]

{ #category : #accessing }
CMIDAIRSEIRRecovering >> color [

	^ Color red mixed: 0.5 with: Color blue
]

{ #category : #accessing }
CMIDAIRSEIRRecovering >> name [

	^ 'recovering'
]

{ #category : #accessing }
CMIDAIRSEIRRecovering >> next [

	^ CMIDAIRSEIRRecovered newFrom: self
]

{ #category : #accessing }
CMIDAIRSEIRRecovering >> tau [

	^ self modelParameterAt: #tau_recovering
]
