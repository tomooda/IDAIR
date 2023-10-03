Class {
	#name : #CMIDAIRRPGResourceAction,
	#superclass : #CMIDAIRRPGAction,
	#instVars : [
		'block'
	],
	#category : #'Cormas-Model-IDAIR-RPG-Actions'
}

{ #category : #constants }
CMIDAIRRPGResourceAction class >> all [

	^ { 
		  self assignRegularBed.
		  self assignICU } asSortedCollection: [ :less :more | 
		  less name <= more name ]
]

{ #category : #constants }
CMIDAIRRPGResourceAction class >> assignICU [

	^ self name: 'ID:18 Occupy 1 ICU bed' block: [ :resourceModel | 
		  (UIManager default
			   request: 'Number of ICU beds?'
			   initialAnswer: '1') ifNotNil: [ :answer | 
			  answer asInteger ifNotNil: [ :num | 
				  resourceModel occupyICU: num.
				  ' (' , num printString , ')' ] ] ]
]

{ #category : #constants }
CMIDAIRRPGResourceAction class >> assignRegularBed [

	^ self name: 'ID:19 Occupy 1 regular bed' block: [ :resourceModel | 
		  (UIManager default
			   request: 'Number of regular beds?'
			   initialAnswer: '1') ifNotNil: [ :answer | 
			  answer asInteger ifNotNil: [ :num | 
				  resourceModel occupyBed: num.
				  ' (' , num printString , ')' ] ] ]
]

{ #category : #constants }
CMIDAIRRPGResourceAction class >> increase1ICU2RB [

	^ self
		  name: 'ID:20 Increase bed capacity(1ICU+2RB)'
		  block: [ :resourceModel | 
			  resourceModel increaseBeds: 2 ICUs: 1.
			  '' ]
]

{ #category : #constants }
CMIDAIRRPGResourceAction class >> increase2ICU4RB [

	^ self
		  name: 'ID:21 Increase bed capacity(2ICU+4RB)'
		  block: [ :resourceModel | 
			  resourceModel increaseBeds: 4 ICUs: 2.
			  '' ]
]

{ #category : #'instance creation' }
CMIDAIRRPGResourceAction class >> name: aString block: aBlock [

	^ (self name: aString)
		  block: aBlock;
		  yourself
]

{ #category : #accessing }
CMIDAIRRPGResourceAction >> block [

	^ block
]

{ #category : #accessing }
CMIDAIRRPGResourceAction >> block: aBlock [

	block := aBlock
]

{ #category : #execution }
CMIDAIRRPGResourceAction >> execute: aCMIDAIRRPGResourceModel [

	(block value: aCMIDAIRRPGResourceModel) ifNotNil: [ :string | 
		aCMIDAIRRPGResourceModel cormasModel recordHistory:
			(self name , string) asText ]
]
