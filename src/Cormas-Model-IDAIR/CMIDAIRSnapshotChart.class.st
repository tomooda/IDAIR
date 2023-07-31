Class {
	#name : #CMIDAIRSnapshotChart,
	#superclass : #CMIDAIRChart,
	#instVars : [
		'groups',
		'eventList',
		'dateList'
	],
	#category : #'Cormas-Model-IDAIR-UI-Prototype'
}

{ #category : #layout }
CMIDAIRSnapshotChart class >> defaultLayout [

	^ SpBoxLayout newHorizontal
		  add: (SpBoxLayout newVertical
				   add: 'Events' expand: false;
				   add: #eventList)
		  expand: false;
		  add: (SpBoxLayout newVertical
				   add: 'Day' expand: false;
				   add: #dateList)
		  expand: false;
		  add: #roassal;
		  yourself
]

{ #category : #testing }
CMIDAIRSnapshotChart class >> isAbstract [

	^ self = CMIDAIRSnapshotChart
]

{ #category : #accessing }
CMIDAIRSnapshotChart >> amounts [

	^ self date ifNotNil: [ :date | 
		  (amountsByDay at: date ifAbsent: [ nil ]) ifNotNil: [ :amounts | 
			  (enabledItems collect: [ :resource | 
				   resource -> (amounts at: resource ifAbsent: [ 0 ]) ])
				  asOrderedDictionary ] ]
]

{ #category : #accessing }
CMIDAIRSnapshotChart >> date [

	^ dateList selectedItem
]

{ #category : #updating }
CMIDAIRSnapshotChart >> dateListItemChanged [

	dateList selectedItem
		ifNotNil: [ :t | 
			eventList selectItems:
				(eventList items select: [ :assoc | assoc value = t ]) ]
		ifNil: [ eventList selectItem: nil ].
	eventList selection selectedIndexes ifNotEmpty: [ :indices | 
		eventList withAdapterDo: [ :a | 
			a widgetDo: [ :w | w scrollToIndex: indices min ] ] ].
	roassal refresh
]

{ #category : #updating }
CMIDAIRSnapshotChart >> eventListItemChanged [

	eventList selectedItem ifNotNil: [ :selection | 
		dateList selectItem: selection value.
		dateList withAdapterDo: [ :a | 
			a widgetDo: [ :w | 
				w scrollToIndex: dateList selection selectedIndex ] ] ]
]

{ #category : #initialization }
CMIDAIRSnapshotChart >> initialize [

	groups := #( #( #'new patients' ) #( #'public transport' )
	             #( #commodities ) #( #medication ) #( #'go to bar'
	                #'go to restaurant' ) ).
	enabledItems ifNil: [ 
		enabledItems := { #'public transport'.
		                #commodities. #oxygen. #medications. #'masks (hospitals)'.
		                #'masks (community)'. #vaccines. #'traditional medicines'.
		                #PPEs. #'body bags'. #'go to bar'. #'go to restaurant' } ].

	super initialize
]

{ #category : #initialization }
CMIDAIRSnapshotChart >> initializePresenters [

	super initializePresenters.
	eventList := self newList
		             beMultipleSelection;
		             items: (Array streamContents: [ :stream | 
					              events keysAndValuesDo: [ :t :es | 
							              es do: [ :event | stream nextPut: event -> t ] ] ]);
		             display: [ :item | item key ];
		             whenSelectionChangedDo: [ self eventListItemChanged ];
		             yourself.
	dateList := self newList
		            items: (1 to: 200) asArray;
		            whenSelectionChangedDo: [ self dateListItemChanged ];
		            yourself
]
