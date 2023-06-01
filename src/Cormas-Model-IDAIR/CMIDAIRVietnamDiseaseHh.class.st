Class {
	#name : #CMIDAIRVietnamDiseaseHh,
	#superclass : #CMIDAIRVietnamDiseaseH,
	#category : #'Cormas-Model-IDAIR-Disease-Vietnam'
}

{ #category : #accessing }
CMIDAIRVietnamDiseaseHh >> next [

	^ CMIDAIRVietnamDiseaseR newFrom: self
]
