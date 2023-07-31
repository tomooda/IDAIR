Class {
	#name : #CMIDAIRSnapshotChart,
	#superclass : #CMIDAIRChart,
	#instVars : [
		'eventList',
		'dateList'
	],
	#category : #'Cormas-Model-IDAIR-UI-Prototype'
}

{ #category : #testing }
CMIDAIRSnapshotChart class >> isAbstract [

	^ self = CMIDAIRSnapshotChart
]

{ #category : #accessing }
CMIDAIRSnapshotChart >> amounts [

	self date ifNotNil: [ :date | 
		(amountsByDay at: date ifAbsent: [ nil ]) ifNotNil: [ :amounts | 
			^ (enabledItems collect: [ :resource | 
				   amounts at: resource ifAbsent: [ 0 ] ]) asOrderedDictionary ] ]
]

{ #category : #accessing }
CMIDAIRSnapshotChart >> date [

	dateList selectedItem
]

{ #category : #updating }
CMIDAIRSnapshotChart >> dateListItemChanged [
]

{ #category : #updating }
CMIDAIRSnapshotChart >> eventListItemChanged [

	eventList selectedItem ifNotNil: [ :selection | 
		dateList selectItem: selection value ]
]

{ #category : #initialization }
CMIDAIRSnapshotChart >> initializePresenters [

	super initializePresenters.
	eventList := self newList
		             items: (Array streamContents: [ :stream | 
					              events do: [ :assoc | 
							              assoc value do: [ :event | 
									              stream nextPutAll: event -> assoc key ] ] ]);
		             display: [ :item | item key ];
		             whenSelectedItemChangedDo: [ self eventListItemChanged ];
		             yourself.
	dateList := self newList
		            items: (1 to: 200) asArray;
		            whenSelectedItemChangedDo: [ self dateListItemChanged ];
		            yourself
]
