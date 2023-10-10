Class {
	#name : #CMIDAIRRPGMedicalAction,
	#superclass : #CMIDAIRRPGAction,
	#instVars : [
		'block'
	],
	#category : #'Cormas-Model-IDAIR-RPG-Actions'
}

{ #category : #constants }
CMIDAIRRPGMedicalAction class >> all [

	^ { 
		  self assignRegularBed.
		  self assignICU } asSortedCollection: [ :less :more | 
		  less name <= more name ]
]

{ #category : #constants }
CMIDAIRRPGMedicalAction class >> assignICU [

	^ self name: 'ID:18 Occupy ICU bed' block: [ :resourceModel | 
		  (UIManager default
			   request: 'Number of ICU beds?'
			   initialAnswer: '1') ifNotNil: [ :answer | 
			  answer asInteger ifNotNil: [ :num | 
				  resourceModel occupyICU: num.
				  ' (' , num printString , ')' ] ] ]
]

{ #category : #constants }
CMIDAIRRPGMedicalAction class >> assignRegularBed [

	^ self name: 'ID:19 Occupy regular bed' block: [ :resourceModel | 
		  (UIManager default
			   request: 'Number of regular beds?'
			   initialAnswer: '1') ifNotNil: [ :answer | 
			  answer asInteger ifNotNil: [ :num | 
				  resourceModel occupyBed: num.
				  ' (' , num printString , ')' ] ] ]
]

{ #category : #constants }
CMIDAIRRPGMedicalAction class >> facemask [

	^ self name: 'ID:35 Wear a facemask' block: [ :resourceModel | 
		  resourceModel facemaskPolicy: true.
		  '' ]
]

{ #category : #constants }
CMIDAIRRPGMedicalAction class >> increase1ICU2RB [

	^ self
		  name: 'ID:20 Increase bed capacity(1ICU+2RB)'
		  block: [ :resourceModel | 
			  resourceModel increaseBeds: 2 ICUs: 1.
			  '' ]
]

{ #category : #constants }
CMIDAIRRPGMedicalAction class >> increase2ICU4RB [

	^ self
		  name: 'ID:21 Increase bed capacity(2ICU+4RB)'
		  block: [ :resourceModel | 
			  resourceModel increaseBeds: 4 ICUs: 2.
			  '' ]
]

{ #category : #'instance creation' }
CMIDAIRRPGMedicalAction class >> name: aString block: aBlock [

	^ (self name: aString)
		  block: aBlock;
		  yourself
]

{ #category : #constants }
CMIDAIRRPGMedicalAction class >> treatmentGuideline [

	^ self
		  name: 'ID:22 Issue treatment guidelines'
		  block: [ :resourceModel | 
			  resourceModel cormasModel
				  submodelAt: #contact
				  do: [ :contactModel | 
					  contactModel socialProfile multiplyCummulativeFactor: 0.8 ].
			  '' ]
]

{ #category : #constants }
CMIDAIRRPGMedicalAction class >> vaccination100 [

	^ self
		  name: 'ID:26 Provide vaccine to 100% of population'
		  block: [ :resourceModel | '' ]
]

{ #category : #constants }
CMIDAIRRPGMedicalAction class >> vaccination25 [

	^ self
		  name: 'ID:23 Provide vaccine to 25% of population'
		  block: [ :resourceModel | '' ]
]

{ #category : #constants }
CMIDAIRRPGMedicalAction class >> vaccination50 [

	^ self
		  name: 'ID:24 Provide vaccine to 50% of population'
		  block: [ :resourceModel | '' ]
]

{ #category : #constants }
CMIDAIRRPGMedicalAction class >> vaccination75 [

	^ self
		  name: 'ID:25 Provide vaccine to 75% of population'
		  block: [ :resourceModel | '' ]
]

{ #category : #accessing }
CMIDAIRRPGMedicalAction >> block [

	^ block
]

{ #category : #accessing }
CMIDAIRRPGMedicalAction >> block: aBlock [

	block := aBlock
]

{ #category : #execution }
CMIDAIRRPGMedicalAction >> execute: aCMIDAIRRPGResourceModel [

	(block value: aCMIDAIRRPGResourceModel) ifNotNil: [ :string | 
		aCMIDAIRRPGResourceModel cormasModel recordHistory:
			(self name , string) asText ]
]
