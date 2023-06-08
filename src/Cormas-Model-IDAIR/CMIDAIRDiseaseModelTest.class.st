Class {
	#name : #CMIDAIRDiseaseModelTest,
	#superclass : #TestCase,
	#instVars : [
		'cormasModel',
		'timeModel',
		'diseaseModel',
		'citizen'
	],
	#category : #'Cormas-Model-IDAIR-Tests'
}

{ #category : #running }
CMIDAIRDiseaseModelTest >> setUp [

	super setUp.
	cormasModel := CMIDAIRModel new.
	timeModel := CMIDAIRSimpleTimeModel on: cormasModel.
	cormasModel addSubmodel: timeModel.
	diseaseModel := CMIDAIRVietnamDiseaseModel on: cormasModel.
	cormasModel addSubmodel: diseaseModel.
	citizen := cormasModel newEntity: CMIDAIRCitizen.
	citizen init
]

{ #category : #tests }
CMIDAIRDiseaseModelTest >> testDaysPerStep [

	timeModel daysPerStep: 0.1.
	self assert: timeModel daysPerStep closeTo: 0.1.
	self assert: citizen diseaseDynamics daysPerStep closeTo: 0.1.
	timeModel daysPerStep: 2.0.
	self assert: timeModel daysPerStep closeTo: 2.0.
	self assert: citizen diseaseDynamics daysPerStep closeTo: 2.0
]
