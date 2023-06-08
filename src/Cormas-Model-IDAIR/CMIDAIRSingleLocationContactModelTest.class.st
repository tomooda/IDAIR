Class {
	#name : #CMIDAIRSingleLocationContactModelTest,
	#superclass : #TestCase,
	#instVars : [
		'cormasModel',
		'timeModel',
		'contactModel'
	],
	#category : #'Cormas-Model-IDAIR-Tests'
}

{ #category : #running }
CMIDAIRSingleLocationContactModelTest >> setUp [

	super setUp.
	cormasModel := CMIDAIRModel new.
	timeModel := CMIDAIRSimpleTimeModel on: cormasModel.
	cormasModel addSubmodel: timeModel.
	contactModel := CMIDAIRSingleLocationContactModel on: cormasModel.
	cormasModel addSubmodel: contactModel
]

{ #category : #tests }
CMIDAIRSingleLocationContactModelTest >> testDaysPerStep [

	timeModel daysPerStep: 0.1.
	self assert: timeModel daysPerStep closeTo: 0.1.
	self assert: contactModel daysPerStep closeTo: 0.1.
	timeModel daysPerStep: 2.0.
	self assert: timeModel daysPerStep closeTo: 2.0.
	self assert: contactModel daysPerStep closeTo: 2.0
]
