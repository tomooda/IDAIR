Class {
	#name : #CMIDAIRVietnamDiseaseS,
	#superclass : #CMIDAIRVietnamDiseaseDynamics,
	#category : #'Cormas-Model-IDAIR-Disease-Vietnam'
}

{ #category : #accessing }
CMIDAIRVietnamDiseaseS >> beta [

	^ 0.0
]

{ #category : #accessing }
CMIDAIRVietnamDiseaseS >> color [

	^ Color green
]

{ #category : #accessing }
CMIDAIRVietnamDiseaseS >> inCommunity [

	^ self
]

{ #category : #testing }
CMIDAIRVietnamDiseaseS >> isInCommunity [

	^ true
]

{ #category : #testing }
CMIDAIRVietnamDiseaseS >> isSusceptive [

	^ true
]

{ #category : #transitioning }
CMIDAIRVietnamDiseaseS >> next [

	^ self
]

{ #category : #accessing }
CMIDAIRVietnamDiseaseS >> requiredDuration [

	^ Float infinity
]

{ #category : #actions }
CMIDAIRVietnamDiseaseS >> step [

	self duration: self duration + self daysPerStep
]

{ #category : #accessing }
CMIDAIRVietnamDiseaseS >> tau [

	^ Float infinity
]
