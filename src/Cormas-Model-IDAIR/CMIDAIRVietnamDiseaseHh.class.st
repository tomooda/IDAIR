Class {
	#name : #CMIDAIRVietnamDiseaseHh,
	#superclass : #CMIDAIRVietnamDiseaseH,
	#category : #'Cormas-Model-IDAIR-Disease-Vietnam'
}

{ #category : #accessing }
CMIDAIRVietnamDiseaseHh >> inCommunity [

	^ CMIDAIRVietnamDiseaseIh newFrom: self
]

{ #category : #transitioning }
CMIDAIRVietnamDiseaseHh >> next [

	^ CMIDAIRVietnamDiseaseR newFrom: self
]

{ #category : #accessing }
CMIDAIRVietnamDiseaseHh >> requiredDuration [

	^ self tHh
]

{ #category : #accessing }
CMIDAIRVietnamDiseaseHh >> tau [

	^ self tHh
]
