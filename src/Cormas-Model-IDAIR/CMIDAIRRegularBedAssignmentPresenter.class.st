Class {
	#name : #CMIDAIRRegularBedAssignmentPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'mildField',
		'severeField'
	],
	#category : #'Cormas-Model-IDAIR-RPG-UI'
}

{ #category : #specs }
CMIDAIRRegularBedAssignmentPresenter class >> defaultSpec [

	<script: 'self new openDialogWithSpec'>
	^ SpGridLayout new
		  add: 'Number of patients for regular beds?' asPresenter
		  at: 1 @ 1
		  span: 2 @ 1;
		  add: ' mild symptoms: ' asPresenter at: 1 @ 2;
		  add: #mildField at: 2 @ 2;
		  add: ' severe symptoms: ' asPresenter at: 1 @ 3;
		  add: #severeField at: 2 @ 3;
		  yourself
]

{ #category : #initialization }
CMIDAIRRegularBedAssignmentPresenter >> initializePresenters [

	super initializePresenters.
	mildField := self newNumberInput
		             beInteger;
		             text: '0';
		             minimum: 0;
		             yourself.
	severeField := self newNumberInput
		               beInteger;
		               text: '0';
		               minimum: 0;
		               yourself
]

{ #category : #initialization }
CMIDAIRRegularBedAssignmentPresenter >> initializeWindow: aSpWindowPresenter [

	super initializeWindow: aSpWindowPresenter.
	aSpWindowPresenter initialExtent: 300 @ 200
]

{ #category : #accessing }
CMIDAIRRegularBedAssignmentPresenter >> mild [

	^ mildField number
]

{ #category : #accessing }
CMIDAIRRegularBedAssignmentPresenter >> severe [

	^ severeField number
]

{ #category : #accessing }
CMIDAIRRegularBedAssignmentPresenter >> title [

	^ 'Occupy regular bed'
]
