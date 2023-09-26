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

	^ self
		  name: 'Take 1 ICU bed'
		  block: [ :resourceModel | resourceModel occupyICU ]
]

{ #category : #constants }
CMIDAIRRPGHospitalAction class >> assignRegularBed [

	^ self
		  name: 'Take 1 regular bed'
		  block: [ :resourceModel | resourceModel occupyBed ]
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
