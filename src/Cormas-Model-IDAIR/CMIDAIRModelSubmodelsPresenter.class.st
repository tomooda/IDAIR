Class {
	#name : #CMIDAIRModelSubmodelsPresenter,
	#superclass : #SpPresenterWithModel,
	#instVars : [
		'dropLists'
	],
	#category : #'Cormas-Model-IDAIR-UI'
}

{ #category : #specs }
CMIDAIRModelSubmodelsPresenter class >> defaultSpec [

	^ SpGridLayout new
]

{ #category : #initialization }
CMIDAIRModelSubmodelsPresenter >> initializePresenters [

	super initializePresenters.
	dropLists := OrderedDictionary new.
	((CMIDAIRSubmodel subclasses select: #isAbstract) 
		 asSortedCollection: [ :less :more | less order <= more order ]) 
		do: [ :abstractSubmodelClass | 
			dropLists
				at: abstractSubmodelClass submodelCategoryName
				put: (self newDropList
						 items:
							 ((abstractSubmodelClass allSubclasses reject: #isAbstract) 
								  collect: [ :class | class submodelName ]);
						 selectItem: (self model ifNotNil: [ :model | 
									  model
										  submodelAt: abstractSubmodelClass submodelCategoryName
										  do: [ :submodel | submodel submodelName ] ]);
						 whenSelectedItemChangedDo: [ :submodelName | 
							 self model addSubmodel:
									 ((abstractSubmodelClass allSubclasses detect: [ :class | 
											   class submodelName = submodelName ]) on: self model) ];
						 yourself) ]
]

{ #category : #initialization }
CMIDAIRModelSubmodelsPresenter >> initializeWindow: aWindowPresenter [

	super initializeWindow: aWindowPresenter.
	aWindowPresenter initialExtent: 300 @ 200
]

{ #category : #initialization }
CMIDAIRModelSubmodelsPresenter >> layout [

	| newLayout rowIndex |
	newLayout := SpGridLayout new
		             beColumnNotHomogeneous;
		             beRowNotHomogeneous;
		             yourself.
	rowIndex := 1.
	dropLists keysAndValuesDo: [ :categoryName :dropList | 
		newLayout
			add: (categoryName , ' model') asPresenter at: 1 @ rowIndex;
			add: dropList at: 2 @ rowIndex.
		rowIndex := rowIndex + 1 ].
	^ newLayout
]

{ #category : #accessing }
CMIDAIRModelSubmodelsPresenter >> title [

	^ 'I-DAIR ABM Launcher'
]
