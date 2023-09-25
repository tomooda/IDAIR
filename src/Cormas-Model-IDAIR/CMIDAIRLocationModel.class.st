Class {
	#name : #CMIDAIRLocationModel,
	#superclass : #CMIDAIRSubmodel,
	#category : #'Cormas-Model-IDAIR-Location'
}

{ #category : #accessing }
CMIDAIRLocationModel class >> order [

	^ 0.6
]

{ #category : #accessing }
CMIDAIRLocationModel class >> submodelCategoryName [

	^ #location
]

{ #category : #accessing }
CMIDAIRLocationModel >> baseColorFor: aCMIDAIRLocation [

	^ self subclassResponsibility
]

{ #category : #'class access' }
CMIDAIRLocationModel >> defaultLocationDynamicsClass [

	^ self subclassResponsibility
]

{ #category : #'initialize-release' }
CMIDAIRLocationModel >> init [

	
]

{ #category : #accessing }
CMIDAIRLocationModel >> initializers [

	^ {  }
]
