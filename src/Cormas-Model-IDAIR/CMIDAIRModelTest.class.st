Class {
	#name : #CMIDAIRModelTest,
	#superclass : #TestCase,
	#instVars : [
		'cormasModel',
		'timeModel',
		'contactModel',
		'diseaseModel'
	],
	#category : #'Cormas-Model-IDAIR-Tests'
}

{ #category : #running }
CMIDAIRModelTest >> setUp [

	super setUp.
	cormasModel := CMIDAIRModel new.
	timeModel := CMIDAIRSimpleTimeModel on: cormasModel.
	cormasModel addSubmodel: timeModel.
	contactModel := CMIDAIRSingleLocationContactModel on: cormasModel.
	cormasModel addSubmodel: contactModel.
	diseaseModel := CMIDAIRVietnamDiseaseModel on: cormasModel.
	cormasModel addSubmodel: diseaseModel
]

{ #category : #tests }
CMIDAIRModelTest >> testDaysPerStep [

	timeModel daysPerStep: 0.1.
	self assert: timeModel daysPerStep closeTo: 0.1.
	self assert: cormasModel daysPerStep closeTo: 0.1.
	timeModel daysPerStep: 2.0.
	self assert: timeModel daysPerStep closeTo: 2.0.
	self assert: cormasModel daysPerStep closeTo: 2.0
]
