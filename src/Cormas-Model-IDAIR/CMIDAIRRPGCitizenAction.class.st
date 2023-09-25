Class {
	#name : #CMIDAIRRPGCitizenAction,
	#superclass : #CMIDAIRRPGAction,
	#instVars : [
		'contactFactor',
		'locationsForYes',
		'locationsForNo',
		'wellbeingPoints'
	],
	#category : #'Cormas-Model-IDAIR-RPG-Actions'
}

{ #category : #constants }
CMIDAIRRPGCitizenAction class >> all [

	^ { 
		  self goToBar.
		  self goToWedding.
		  self goToCeremony.
		  self goToHospital.
		  self earnLiving.
		  self buyBasic.
		  self businessTrip.
		  self travelAbroad.
		  self workout.
		  self bringFamilyToHospital.
		  self goToSchool.
		  self fieldTrip.
		  self faceToFace.
		  self shopping.
		  self regularHealthCheckup.
		  self gettingMonthlyMedication.
		  self seekHealthcare.
		  self gettingFacemask }
]

{ #category : #constants }
CMIDAIRRPGCitizenAction class >> bringFamilyToHospital [

	^ self
		  name: 'Bring family to the hospital'
		  contactFactor: 1.5
		  wellbeingPoints: 5
		  locationsForYes: { #hospital }
		  locationsForNo: { #suburban }
]

{ #category : #constants }
CMIDAIRRPGCitizenAction class >> businessTrip [

	^ self
		  name: 'Business trip'
		  contactFactor: 2.0
		  wellbeingPoints: 10
		  locationsForYes: { #out }
		  locationsForNo: { #suburban . #urban}
]

{ #category : #constants }
CMIDAIRRPGCitizenAction class >> buyBasic [

	^ self
		  name: 'Buy basic living necessities'
		  contactFactor: 1.5
		  wellbeingPoints: 15
		  locationsForYes: { #suburban . #urban }
		  locationsForNo: { #suburban }
]

{ #category : #constants }
CMIDAIRRPGCitizenAction class >> earnLiving [

	^ self
		  name: 'Earn a living'
		  contactFactor: 1.5
		  wellbeingPoints: 15
		  locationsForYes: { #urban }
		  locationsForNo: { #suburban }
]

{ #category : #constants }
CMIDAIRRPGCitizenAction class >> faceToFace [

	^ self
		  name: 'Face to face chat'
		  contactFactor: 2.0
		  wellbeingPoints: 5
		  locationsForYes: { #urban. #suburban }
		  locationsForNo: { #urban. #suburban }
]

{ #category : #constants }
CMIDAIRRPGCitizenAction class >> fieldTrip [

	^ self
		  name: 'Field trip'
		  contactFactor: 1.0
		  wellbeingPoints: 5
		  locationsForYes: { #out }
		  locationsForNo: { #urban. #suburban }
]

{ #category : #constants }
CMIDAIRRPGCitizenAction class >> gettingFacemask [

	^ self
		  name: 'Getting facemask to wear'
		  contactFactor: 0.5
		  wellbeingPoints: 5
		  locationsForYes: { #urban. #suburban }
		  locationsForNo: { #urban. #suburban }
]

{ #category : #constants }
CMIDAIRRPGCitizenAction class >> gettingMonthlyMedication [

	^ self
		  name: 'Getting monthly medication'
		  contactFactor: 1.5
		  wellbeingPoints: 5
		  locationsForYes: { #hospital . #urban . #suburban }
		  locationsForNo: { #urban . #suburban }
]

{ #category : #constants }
CMIDAIRRPGCitizenAction class >> goToBar [

	^ self
		  name: 'Go to bar'
		  contactFactor: 2.5
		  wellbeingPoints: 15
		  locationsForYes: { #urban }
		  locationsForNo: { #suburban }
]

{ #category : #constants }
CMIDAIRRPGCitizenAction class >> goToCeremony [

	^ self
		  name: 'Go to a ceremony'
		  contactFactor: 2.5
		  wellbeingPoints: 10
		  locationsForYes: { #urban }
		  locationsForNo: { #suburban }
]

{ #category : #constants }
CMIDAIRRPGCitizenAction class >> goToHospital [

	^ self
		  name: 'Go to the hospital'
		  contactFactor: 1.5
		  wellbeingPoints: 5
		  locationsForYes: { #hospital }
		  locationsForNo: { #suburban }
]

{ #category : #constants }
CMIDAIRRPGCitizenAction class >> goToSchool [

	^ self
		  name: 'Go to school'
		  contactFactor: 1.0
		  wellbeingPoints: 5
		  locationsForYes: { #suburban }
		  locationsForNo: { #suburban }
]

{ #category : #constants }
CMIDAIRRPGCitizenAction class >> goToWedding [

	^ self
		  name: 'Go to a wedding'
		  contactFactor: 2.5
		  wellbeingPoints: 15
		  locationsForYes: { #urban }
		  locationsForNo: { #suburban }
]

{ #category : #'instance creation' }
CMIDAIRRPGCitizenAction class >> name: aString contactFactor: aNumber wellbeingPoints: anInteger locationsForYes: aCollectionOfSymbol locationsForNo: anotherCollectionOfSymbol [

	^ (self name: aString)
		  contactFactor: aNumber;
		  wellbeingPoints: anInteger;
		  locationsForYes: aCollectionOfSymbol;
		  locationsForNo: anotherCollectionOfSymbol;
		  yourself
]

{ #category : #constants }
CMIDAIRRPGCitizenAction class >> regularHealthCheckup [

	^ self
		  name: 'Regular health checkup'
		  contactFactor: 1.5
		  wellbeingPoints: 5
		  locationsForYes: { #hospital }
		  locationsForNo: { #suburban . #urban }
]

{ #category : #constants }
CMIDAIRRPGCitizenAction class >> seekHealthcare [

	^ self
		  name: 'Seek health care'
		  contactFactor: 1.5
		  wellbeingPoints: 5
		  locationsForYes: { #hospital  }
		  locationsForNo: { #suburban }
]

{ #category : #constants }
CMIDAIRRPGCitizenAction class >> shopping [

	^ self
		  name: 'Shopping'
		  contactFactor: 2.0
		  wellbeingPoints: 5
		  locationsForYes: { #urban }
		  locationsForNo: { #suburban }
]

{ #category : #constants }
CMIDAIRRPGCitizenAction class >> travelAbroad [

	^ self
		  name: 'Travel abroad to study'
		  contactFactor: 1.5
		  wellbeingPoints: 15
		  locationsForYes: { #out }
		  locationsForNo: { #suburban . #urban}
]

{ #category : #constants }
CMIDAIRRPGCitizenAction class >> workout [

	^ self
		  name: 'Work out at a gym'
		  contactFactor: 1.5
		  wellbeingPoints: 5
		  locationsForYes: { #urban }
		  locationsForNo: { #suburban }
]

{ #category : #accessing }
CMIDAIRRPGCitizenAction >> contactFactor [

	^ contactFactor
]

{ #category : #accessing }
CMIDAIRRPGCitizenAction >> contactFactor: aNumber [

	contactFactor := aNumber
]

{ #category : #converting }
CMIDAIRRPGCitizenAction >> forNo [

	^ CMIDAIRRPGCitizenActionWrapperForNo on: self
]

{ #category : #converting }
CMIDAIRRPGCitizenAction >> forYes [

	^ CMIDAIRRPGCitizenActionWrapperForYes on: self
]

{ #category : #accessing }
CMIDAIRRPGCitizenAction >> locationsForNo [

	^ locationsForNo
]

{ #category : #accessing }
CMIDAIRRPGCitizenAction >> locationsForNo: aCollectionOfSymbol [

	locationsForNo := aCollectionOfSymbol
]

{ #category : #accessing }
CMIDAIRRPGCitizenAction >> locationsForYes [

	^ locationsForYes
]

{ #category : #accessing }
CMIDAIRRPGCitizenAction >> locationsForYes: aCollectionOfSymbol [

	locationsForYes := aCollectionOfSymbol
]

{ #category : #accessing }
CMIDAIRRPGCitizenAction >> wellbeingPoints [

	^ wellbeingPoints
]

{ #category : #accessing }
CMIDAIRRPGCitizenAction >> wellbeingPoints: aNumber [

	wellbeingPoints := aNumber
]
