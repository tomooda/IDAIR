Class {
	#name : #CMIDAIRModelInitializationPresenter,
	#superclass : #SpPresenterWithModel,
	#instVars : [
		'list',
		'populationField',
		'dropLists',
		'addButton'
	],
	#category : #'Cormas-Model-IDAIR-UI'
}

{ #category : #specs }
CMIDAIRModelInitializationPresenter class >> defaultSpec [

	^ SpBoxLayout newHorizontal
]

{ #category : #operations }
CMIDAIRModelInitializationPresenter >> add [

	self model ifNotNil: [ :model | 
		list items: (list items copyWith: { 
					 populationField number.
					 (dropLists
						  ifNotNil: [ 
						  dropLists collect: [ :dropList | dropList selectedItem ] ]
						  ifNil: [ {  } ]) }) ]
]

{ #category : #initialization }
CMIDAIRModelInitializationPresenter >> initializePresenters [

	super initializePresenters.
	list := self newTable
		        addColumn: (SpStringTableColumn
				         title: 'population'
				         evaluated: [ :array | array first ]);
		        addColumn: (SpStringTableColumn
				         title: 'state'
				         evaluated: [ :array | 
					         ', ' join:
							         (array second collect: [ :assoc | assoc key ]) ]);
		        yourself.
	populationField := self newNumberInput
		                   beInteger;
		                   number: 1;
		                   yourself.
	addButton := self newButton
		             icon: (Smalltalk ui iconNamed: #add);
		             action: [ self add ]
]

{ #category : #initialization }
CMIDAIRModelInitializationPresenter >> initializeWindow: aWindowPresenter [

	super initializeWindow: aWindowPresenter.
	aWindowPresenter initialExtent: 500 @ 400
]

{ #category : #layouting }
CMIDAIRModelInitializationPresenter >> layout [

	| newLayout |
	newLayout := SpBoxLayout newHorizontal
		             vAlignCenter;
		             add: (SpBoxLayout newVertical
				              add: populationField
				              height: self class buttonHeight)
		             width: 100;
		             yourself.
	dropLists ifNotNil: [ 
		dropLists do: [ :dropList | 
			newLayout
				add:
				(SpBoxLayout newVertical
					 add: dropList
					 height: self class buttonHeight)
				width: 100 ] ].
	newLayout add: addButton width: self class buttonHeight.
	^ SpBoxLayout newVertical
		  add: 'Initial condition' expand: false;
		  add: list expand: true;
		  add: newLayout height: self class buttonHeight
]

{ #category : #initialization }
CMIDAIRModelInitializationPresenter >> modelChanged [

	self model ifNotNil: [ :model | 
		dropLists := Array streamContents: [ :stream | 
			             model initializers do: [ :initializers | 
				             initializers ifNotEmpty: [ 
					             stream nextPut: (self newDropList
							              display: [ :assoc | assoc key ];
							              items: initializers) ] ] ] ]
]

{ #category : #accessing }
CMIDAIRModelInitializationPresenter >> title [

	^ 'ABM Initial Condition'
]

{ #category : #evaluating }
CMIDAIRModelInitializationPresenter >> value: aCMIDAIRModel [

	list items do: [ :array | 
		| newCitizens |
		newCitizens := aCMIDAIRModel
			               createN: array first
			               randomlyLocatedEntities: CMIDAIRCitizen.
		array second do: [ :assoc | 
			newCitizens do: [ :citizen | assoc value value: citizen ] ] ]
]
