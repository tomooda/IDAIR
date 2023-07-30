Class {
	#name : #CMIDAIRChart,
	#superclass : #SpPresenter,
	#instVars : [
		'events',
		'amountsByDay',
		'enabledItems',
		'roassal'
	],
	#category : #'Cormas-Model-IDAIR-UI-Prototype'
}

{ #category : #testing }
CMIDAIRChart class >> isAbstract [

	^ self = CMIDAIRChart
]

{ #category : #initialization }
CMIDAIRChart >> initialize [

	super initialize.
	events := { 
		          (100 -> { #startSchoolClosure }).
		          (120 -> { #startTrafficLimit }).
		          (150 -> { #endSchoolClosure. #endTrafficLimit }) }
		          asOrderedDictionary.
	amountsByDay := (1 to: 200) collect: [ :t | 
		                { 
			                (#newPatients
			                 -> (1.0 - (t / 120.0 * 3.14) cos * 1000)).
			                (#traffic -> ((t between: 120 and: 150)
				                  ifTrue: [ 30 ]
				                  ifFalse: [ 100 ])).
			                (#commodities -> (t < 100
				                  ifTrue: [ 100 ]
				                  ifFalse: [ 
				                  1 - (t - 100 / 100 * 3.14) sin * 25 + 25 ])).
			                (#drugs -> (t < 100
				                  ifTrue: [ 100 ]
				                  ifFalse: [ 1 - (t - 100 / 100 * 3.14) sin * 50 ])) }
			                asDictionary ].
	enabledItems := { #newPatients. #traffic. #commodities. #drugs }
]

{ #category : #initialization }
CMIDAIRChart >> initializePresenters [

	roassal := self newRoassal.
	roassal script: [ :view | self visualize: view ]
]

{ #category : #drawing }
CMIDAIRChart >> visualize: aCanvas [

	^ self subclassResponsibility
]
