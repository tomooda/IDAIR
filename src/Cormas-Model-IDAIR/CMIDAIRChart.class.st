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
		          (100 -> { #'start school closure' }).
		          (120 -> { #'start traffic limit' }).
		          (150 -> { #'end school closure'. #'end traffic limit' }) }
		          asOrderedDictionary.
	amountsByDay := (1 to: 200) collect: [ :t | 
		                { 
			                (#'new patients'
			                 -> (1.0 - (t / 120.0 * 3.14) cos * 1000)).
			                (#'public transport' -> ((t between: 120 and: 150)
				                  ifTrue: [ 30 ]
				                  ifFalse: [ 100 ])).
			                (#'commodities' -> (t < 100
				                  ifTrue: [ 100 ]
				                  ifFalse: [ 
				                  1 - (t - 100 / 100 * 3.14) sin * 25 + 25 ])).
			                (#'medications' -> (t < 100
				                  ifTrue: [ 100 ]
				                  ifFalse: [ 1 - (t - 100 / 100 * 3.14) sin * 50 ])) }
			                asDictionary ].
	enabledItems := { #'new patients'. #'public transport'. #'commodities'. #'medications' }
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
