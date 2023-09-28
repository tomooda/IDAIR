Class {
	#name : #CMIDAIRRPGMedicalChartPresenter,
	#superclass : #SpPresenterWithModel,
	#instVars : [
		'newMild',
		'newSevere',
		'newRecovering',
		'newRecovered',
		'newDead',
		'occupiedBeds',
		'numBeds',
		'occupiedICUs',
		'numICUs',
		'newWorsened'
	],
	#category : #'Cormas-Model-IDAIR-RPG-UI'
}

{ #category : #specs }
CMIDAIRRPGMedicalChartPresenter class >> defaultSpec [

	^ SpBoxLayout newHorizontal
		  add: (SpBoxLayout newVertical
				   add: (SpBoxLayout newHorizontal
						    add: 'new mild symptoms' asPresenter width: 200;
						    add: #newMild width: 100;
						    yourself)
				   expand: false;
				   add: (SpBoxLayout newHorizontal
						    add: 'new severe symptoms' asPresenter width: 200;
						    add: #newSevere width: 100;
						    yourself)
				   expand: false;
				   add: (SpBoxLayout newHorizontal
						    add: 'new worsened symptoms' asPresenter width: 200;
						    add: #newWorsened width: 100;
						    yourself)
				   expand: false;
				   add: (SpBoxLayout newHorizontal
						    add: 'new recovering to mild' asPresenter width: 200;
						    add: #newRecovering width: 100;
						    yourself)
				   expand: false;
				   add: (SpBoxLayout newHorizontal
						    add: 'new recovered patients' asPresenter width: 200;
						    add: #newRecovered width: 100;
						    yourself)
				   expand: false;
				   add: (SpBoxLayout newHorizontal
						    add: 'new deaths' asPresenter width: 200;
						    add: #newDead width: 100;
						    yourself)
				   expand: false;
				   yourself)
		  expand: true;
		  add: (SpBoxLayout newVertical
				   add: (SpBoxLayout newHorizontal
						    add: 'Regular Beds ' width: 100;
						    add: #occupiedBeds expand: false;
						    add: ' / ' expand: false;
						    add: #numBeds expand: false;
						    yourself)
				   expand: false;
				   add: (SpBoxLayout newHorizontal
						    add: 'ICU Beds   ' width: 100;
						    add: #occupiedICUs expand: false;
						    add: ' / ' expand: false;
						    add: #numICUs expand: false;
						    yourself)
				   expand: false;
				   yourself)
		  expand: true;
		  yourself
]

{ #category : #initialization }
CMIDAIRRPGMedicalChartPresenter >> initializePresenters [

	super initializePresenters.
	newMild := self newNumberInput
		           disable;
		           beInteger;
		           number: 0;
		           yourself.
	newSevere := self newNumberInput
		             disable;
		             beInteger;
		             number: 0;
		             yourself.
	newWorsened := self newNumberInput
		               disable;
		               beInteger;
		               number: 0;
		               yourself.
	newRecovering := self newNumberInput
		                 disable;
		                 beInteger;
		                 number: 0;
		                 yourself.
	newRecovered := self newNumberInput
		                disable;
		                beInteger;
		                number: 0;
		                yourself.
	newDead := self newNumberInput
		           disable;
		           beInteger;
		           number: 0;
		           yourself.
	numBeds := self newLabel
		           label: '?';
		           yourself.
	occupiedBeds := self newLabel
		                label: '0';
		                yourself.
	numICUs := self newLabel
		           label: '?';
		           yourself.
	occupiedICUs := self newLabel
		                label: '0';
		                yourself
]

{ #category : #initialization }
CMIDAIRRPGMedicalChartPresenter >> modelChanged [

	super modelChanged.
	self updateNewPatients.
	self updateResources
]

{ #category : #enumerating }
CMIDAIRRPGMedicalChartPresenter >> playersDo: aBlock [

	self model ifNotNil: [ :contactModel | 
		contactModel namesAndPlayersDo: [ :name :player | 
			aBlock value: player ] ]
]

{ #category : #accessing }
CMIDAIRRPGMedicalChartPresenter >> refresh [

	self
		updateNewPatients;
		updateResources
]

{ #category : #initialization }
CMIDAIRRPGMedicalChartPresenter >> updateNewPatients [

	self model cormasModel submodelAt: #disease do: [ :diseaseModel | 
		newMild number: diseaseModel numberOfNewMild.
		newSevere number: diseaseModel numberOfNewSevere.
		newWorsened number: diseaseModel numberOfNewWorsened.
		newRecovering number: diseaseModel numberOfNewRecovering.
		newRecovered number: diseaseModel numberOfNewRecovered.
		newDead number: diseaseModel numberOfNewDead ]
]

{ #category : #initialization }
CMIDAIRRPGMedicalChartPresenter >> updateResources [

	self model cormasModel submodelAt: #resource do: [ :resourceModel | 
		numBeds label: resourceModel numBeds printString.
		occupiedBeds label: resourceModel occupiedBeds printString.
		numICUs label: resourceModel numICUs printString.
		occupiedICUs label: resourceModel occupiedICUs printString ]
]
