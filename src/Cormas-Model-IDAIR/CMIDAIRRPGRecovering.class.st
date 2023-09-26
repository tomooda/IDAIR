Class {
	#name : #CMIDAIRRPGRecovering,
	#superclass : #CMIDAIRRPGIll,
	#category : #'Cormas-Model-IDAIR-Disease-RPG'
}

{ #category : #'instance creation' }
CMIDAIRRPGRecovering class >> newFrom: aCMIDAIRSEIRDiseaseDynamics [

	aCMIDAIRSEIRDiseaseDynamics citizen cormasModel
		submodelAt: #disease
		do: [ :diseaseModel | diseaseModel incrementNewRecovering ].
	^ super newFrom: aCMIDAIRSEIRDiseaseDynamics
]

{ #category : #accessing }
CMIDAIRRPGRecovering >> beta [

	^ self modelParameterAt: #beta_recovering
]

{ #category : #accessing }
CMIDAIRRPGRecovering >> color [

	^ Color red mixed: 0.5 with: Color blue
]

{ #category : #accessing }
CMIDAIRRPGRecovering >> name [

	^ 'recovering'
]

{ #category : #accessing }
CMIDAIRRPGRecovering >> next [

	^ CMIDAIRRPGRecovered newFrom: self
]

{ #category : #accessing }
CMIDAIRRPGRecovering >> tau [

	^ self modelParameterAt: #tau_recovering
]
