Class {
	#name : #CMIDAIRResourceModel,
	#superclass : #CMIDAIRSubmodel,
	#category : #'Cormas-Model-IDAIR-Resource'
}

{ #category : #testing }
CMIDAIRResourceModel class >> isAbstract [

	^ self = CMIDAIRResourceModel
]

{ #category : #accessing }
CMIDAIRResourceModel class >> order [

	^ 0.8
]

{ #category : #accessing }
CMIDAIRResourceModel class >> submodelCategoryName [

	^ #resource
]

{ #category : #control }
CMIDAIRResourceModel >> consume: anInteger [

	^ self subclassResponsibility
]

{ #category : #accessing }
CMIDAIRResourceModel >> daysPerStep [

	^ self cormasModel daysPerStep
]

{ #category : #defaults }
CMIDAIRResourceModel >> defaultCitizenResourceDynamicsClass [

	^ self subclassResponsibility
]

{ #category : #'round management' }
CMIDAIRResourceModel >> finalizeRound [
]

{ #category : #accessing }
CMIDAIRResourceModel >> socialPreventionResourceFactor [

	^ self subclassResponsibility
]

{ #category : #control }
CMIDAIRResourceModel >> step: anInteger [

	^ self
		  supply: anInteger;
		  consume: anInteger
]

{ #category : #control }
CMIDAIRResourceModel >> supply: anInteger [

	^ self subclassResponsibility
]
