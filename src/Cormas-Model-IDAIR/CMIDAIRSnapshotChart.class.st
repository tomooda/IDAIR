Class {
	#name : #CMIDAIRSnapshotChart,
	#superclass : #CMIDAIRChart,
	#instVars : [
		'eventList'
	],
	#category : #'Cormas-Model-IDAIR-UI-Prototype'
}

{ #category : #testing }
CMIDAIRSnapshotChart class >> isAbstract [

	^ self = CMIDAIRSnapshotChart
]
