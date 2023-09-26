Class {
	#name : #CMIDAIRRPGHospitalAction,
	#superclass : #CMIDAIRRPGAction,
	#instVars : [
		'block'
	],
	#category : #'Cormas-Model-IDAIR-RPG-Actions'
}

{ #category : #constants }
CMIDAIRRPGHospitalAction class >> all [

	^ { 
		  self assignRegularBed.
		  self assignICU }
]

{ #category : #constants }
CMIDAIRRPGHospitalAction class >> assignICU [

	^ self name: 'Take ICU beds' block: [ :resourceModel | 
		  (UIManager default
			   request: 'Number of ICU beds?'
			   initialAnswer: '1') ifNotNil: [ :answer | 
			  answer asInteger ifNotNil: [ :num | resourceModel occupyICU: num ] ] ]
]

{ #category : #constants }
CMIDAIRRPGHospitalAction class >> assignRegularBed [

	^ self name: 'Take regular beds' block: [ :resourceModel | 
		  (UIManager default
			   request: 'Number of regular beds?'
			   initialAnswer: '1') ifNotNil: [ :answer | 
			  answer asInteger ifNotNil: [ :num | resourceModel occupyBed: num ] ] ]
]

{ #category : #constants }
CMIDAIRRPGHospitalAction class >> increase1ICU2RB [

	^ self
		  name: 'Increase treatment capacity(1ICU+2RB)'
		  block: [ :resourceModel | resourceModel increaseBeds: 2 ICUs: 1 ]
]

{ #category : #constants }
CMIDAIRRPGHospitalAction class >> increase2ICU4RB [

	^ self
		  name: 'Increase treatment capacity(2ICU+4RB)'
		  block: [ :resourceModel | resourceModel increaseBeds: 4 ICUs: 2 ]
]

{ #category : #'instance creation' }
CMIDAIRRPGHospitalAction class >> name: aString block: aBlock [

	^ (self name: aString)
		  block: aBlock;
		  yourself
]

{ #category : #accessing }
CMIDAIRRPGHospitalAction >> block [

	^ block
]

{ #category : #accessing }
CMIDAIRRPGHospitalAction >> block: aBlock [

	block := aBlock
]

{ #category : #execution }
CMIDAIRRPGHospitalAction >> execute: aCMIDAIRRPGResourceModel [

	block value: aCMIDAIRRPGResourceModel
]
