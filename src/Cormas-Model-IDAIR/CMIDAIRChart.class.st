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

{ #category : #specs }
CMIDAIRChart class >> defaultLayout [

	^ self subclassResponsibility
]

{ #category : #specs }
CMIDAIRChart class >> defaultSpec [

	^ self defaultLayout
]

{ #category : #examples }
CMIDAIRChart class >> example [

	| notebook |
	notebook := SpNotebookPresenter new.
	notebook
		addPage: (notebook newNotebookPage
				 title: 'Overview';
				 presenterProvider: [ CMIDAIRTimeChart new ];
				 yourself);
		addPage: (notebook newNotebookPage
				 title: 'By Days';
				 presenterProvider: [ CMIDAIRBarsChart new ];
				 yourself).
	notebook openWithSpec title: 'I-DAIR ABM Visualization Prototype'
]

{ #category : #testing }
CMIDAIRChart class >> isAbstract [

	^ self = CMIDAIRChart
]

{ #category : #initialization }
CMIDAIRChart >> initialize [

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
			                (#commodities -> (t < 100
				                  ifTrue: [ 100 ]
				                  ifFalse: [ 
				                  1 - (t - 100 / 100 * 3.14) sin * 25 + 25 ])).
			                (#'go to bar' -> (t < 100
				                  ifTrue: [ 10 ]
				                  ifFalse: [ 
				                  1 - (t - 100 / 100 * 3.14) sin * 2 + 5 ])).
			                (#'go to restaurant' -> (t < 100
				                  ifTrue: [ 30 ]
				                  ifFalse: [ 
				                  1 - (t - 100 / 100 * 3.14) sin * 5 + 25 ])).
			                (#oxygen -> (t < 100
				                  ifTrue: [ 100 ]
				                  ifFalse: [ 
				                  1 - (t - 100 / 100 * 3.14) sin * 40 + 20 ])).
			                (#medications -> (t < 100
				                  ifTrue: [ 100 ]
				                  ifFalse: [ 1 - (t - 100 / 100 * 3.14) sin * 50 ])).
			                (#'masks (hospitals)' -> (t < 100
				                  ifTrue: [ 100 ]
				                  ifFalse: [ 
				                  1 - (t - 100 / 100 * 3.14) sin * 40 + 20 ])).
			                (#'masks (community)' -> (t < 50
				                  ifTrue: [ 100 ]
				                  ifFalse: [ 
				                  1 - (t - 50 / 100 * 3.14) sin * 40 + 20 ])).
			                (#vaccines -> (t < 150
				                  ifTrue: [ 100 ]
				                  ifFalse: [ 
				                  1 - (t - 150 / 100 * 3.14) sin * 40 + 20 ])).
			                (#'traditional medicines' -> (t < 10
				                  ifTrue: [ 100 ]
				                  ifFalse: [ 
				                  1 - (t - 10 / 100 * 3.14) sin * 40 + 20 ])).
			                (#PPEs -> (t < 130
				                  ifTrue: [ 100 ]
				                  ifFalse: [ 
				                  1 - (t - 130 / 100 * 3.14) sin * 40 + 20 ])).
			                (#'body bags' -> (t < 180
				                  ifTrue: [ 100 ]
				                  ifFalse: [ 
				                  1 - (t - 180 / 100 * 3.14) sin * 40 + 20 ])) }
			                asDictionary ].
	enabledItems ifNil: [ 
		enabledItems := { #'new patients'. #'public transport'.
		                #commodities. #oxygen. #medications. #'masks (hospitals)'.
		                #'masks (community)'. #vaccines. #'traditional medicines'.
		                #PPEs. #'body bags'. #'go to bar'. #'go to restaurant' } ].
	super initialize
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
