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
		  self coffeeWithFriends.
		  self dineWithFriends.
		  self goToBar.
		  self goToCeremony.
		  self goToWedding.
		  self shopping.
		  self workout.
		  self faceToFace.
		  self buyBasic.
		  self earnLiving.
		  self goToSchool.
		  self fieldTrip.
		  self businessTrip.
		  self travelAbroad.
		  self vacation.
		  self seekHealthcare.
		  self goToHospital.
		  self useHerbal.
		  self getMonthlyMedication.
		  self regularHealthCheckup.
		  self bringFamilyToHospital.
		  CMIDAIRRPGFacemaskAction facemasked.
		  CMIDAIRRPGVaccinationAction vaccinated } asSortedCollection: [ 
		  :less 
		  :more | less name <= more name ]
]

{ #category : #constants }
CMIDAIRRPGCitizenAction class >> bringFamilyToHospital [

	^ self
		  name: 'ID:21 Bring family to the hospital'
		  contactFactor: 1.5
		  wellbeingPoints: 5
		  locationsForYes: { #hospital }
		  locationsForNo: { #suburban }
]

{ #category : #constants }
CMIDAIRRPGCitizenAction class >> businessTrip [

	^ self
		  name: 'ID:13 Business trip'
		  contactFactor: 2.0
		  wellbeingPoints: 10
		  locationsForYes: { #out }
		  locationsForNo: { #suburban . #urban}
]

{ #category : #constants }
CMIDAIRRPGCitizenAction class >> buyBasic [

	^ self
		  name: 'ID:09 Buy basic living necessities'
		  contactFactor: 1.5
		  wellbeingPoints: 15
		  locationsForYes: { #suburban . #urban }
		  locationsForNo: { #suburban }
]

{ #category : #constants }
CMIDAIRRPGCitizenAction class >> coffeeWithFriends [

	^ self
		  name: 'ID:01 Coffee with friends'
		  contactFactor: 2.0
		  wellbeingPoints: 5
		  locationsForYes: { #urban }
		  locationsForNo: { #urban. #suburban }
]

{ #category : #constants }
CMIDAIRRPGCitizenAction class >> dineWithFriends [

	^ self
		  name: 'ID:02 Dine with friends'
		  contactFactor: 2.0
		  wellbeingPoints: 5
		  locationsForYes: { #urban }
		  locationsForNo: { #urban. #suburban }
]

{ #category : #constants }
CMIDAIRRPGCitizenAction class >> earnLiving [

	^ self
		  name: 'ID:10 Earn a living'
		  contactFactor: 1.5
		  wellbeingPoints: 15
		  locationsForYes: { #urban }
		  locationsForNo: { #suburban }
]

{ #category : #constants }
CMIDAIRRPGCitizenAction class >> faceToFace [

	^ self
		  name: 'ID:08 Face to face chat'
		  contactFactor: 2.0
		  wellbeingPoints: 5
		  locationsForYes: { #urban }
		  locationsForNo: { #urban. #suburban }
]

{ #category : #constants }
CMIDAIRRPGCitizenAction class >> fieldTrip [

	^ self
		  name: 'ID:12 Field trip'
		  contactFactor: 1.0
		  wellbeingPoints: 5
		  locationsForYes: { #out }
		  locationsForNo: { #urban. #suburban }
]

{ #category : #constants }
CMIDAIRRPGCitizenAction class >> getMonthlyMedication [

	^ self
		  name: 'ID:19 Get monthly medication'
		  contactFactor: 1.5
		  wellbeingPoints: 5
		  locationsForYes: { #hospital . #urban . #suburban }
		  locationsForNo: { #urban . #suburban }
]

{ #category : #constants }
CMIDAIRRPGCitizenAction class >> goToBar [

	^ self
		  name: 'ID:03 Go to a bar'
		  contactFactor: 2.5
		  wellbeingPoints: 15
		  locationsForYes: { #urban }
		  locationsForNo: { #suburban }
]

{ #category : #constants }
CMIDAIRRPGCitizenAction class >> goToCeremony [

	^ self
		  name: 'ID:04 Go to a ceremony'
		  contactFactor: 2.5
		  wellbeingPoints: 10
		  locationsForYes: { #urban }
		  locationsForNo: { #suburban }
]

{ #category : #constants }
CMIDAIRRPGCitizenAction class >> goToHospital [

	^ self
		  name: 'ID:17 Go to the hospital'
		  contactFactor: 1.5
		  wellbeingPoints: 5
		  locationsForYes: { #hospital }
		  locationsForNo: { #suburban }
]

{ #category : #constants }
CMIDAIRRPGCitizenAction class >> goToSchool [

	^ self
		  name: 'ID:11 Go to school'
		  contactFactor: 1.0
		  wellbeingPoints: 5
		  locationsForYes: { #suburban }
		  locationsForNo: { #suburban }
]

{ #category : #constants }
CMIDAIRRPGCitizenAction class >> goToWedding [

	^ self
		  name: 'ID:05 Go to a wedding'
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
		  name: 'ID:20 Regular health checkup'
		  contactFactor: 1.5
		  wellbeingPoints: 5
		  locationsForYes: { #hospital }
		  locationsForNo: { #suburban . #urban }
]

{ #category : #constants }
CMIDAIRRPGCitizenAction class >> seekHealthcare [

	^ self
		  name: 'ID:16 Seek health care'
		  contactFactor: 1.5
		  wellbeingPoints: 5
		  locationsForYes: { #hospital  }
		  locationsForNo: { #suburban }
]

{ #category : #constants }
CMIDAIRRPGCitizenAction class >> shopping [

	^ self
		  name: 'ID:06 Shopping'
		  contactFactor: 2.0
		  wellbeingPoints: 5
		  locationsForYes: { #urban }
		  locationsForNo: { #suburban }
]

{ #category : #constants }
CMIDAIRRPGCitizenAction class >> travelAbroad [

	^ self
		  name: 'ID:14 Travel abroad to study'
		  contactFactor: 1.5
		  wellbeingPoints: 15
		  locationsForYes: { #out }
		  locationsForNo: { #suburban . #urban}
]

{ #category : #constants }
CMIDAIRRPGCitizenAction class >> useHerbal [

	^ self
		  name: 'ID:18 Use herbal treatment'
		  contactFactor: 1.0
		  wellbeingPoints: 5
		  locationsForYes: { #hospital . #urban . #suburban }
		  locationsForNo: { #urban . #suburban }
]

{ #category : #constants }
CMIDAIRRPGCitizenAction class >> vacation [

	^ self
		  name: 'ID:15 Go on a vacation'
		  contactFactor: 1.5
		  wellbeingPoints: 15
		  locationsForYes: { #out }
		  locationsForNo: { #suburban . #urban}
]

{ #category : #constants }
CMIDAIRRPGCitizenAction class >> workout [

	^ self
		  name: 'ID:07 Work out at a gym'
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

{ #category : #execution }
CMIDAIRRPGCitizenAction >> executeNo: aCMIDAIRCitizen [

	aCMIDAIRCitizen contactProfile
		actionFactor: 1.0;
		addToWellbeingPoints: self wellbeingPoints negated.
	aCMIDAIRCitizen locationDynamics locationDesignators:
		self locationsForNo.
	aCMIDAIRCitizen contactProfile isMuppetContactProfile ifFalse: [ 
		aCMIDAIRCitizen cormasModel recordHistory:
			(aCMIDAIRCitizen contactProfile playerName , ': ') asText allBold
			, (self name , ' - NO') asText.
		aCMIDAIRCitizen cormasModel recordCitizenActionNo ]
]

{ #category : #execution }
CMIDAIRRPGCitizenAction >> executeYes: aCMIDAIRCitizen [

	aCMIDAIRCitizen contactProfile
		actionFactor: self contactFactor;
		addToWellbeingPoints: self wellbeingPoints.
	aCMIDAIRCitizen locationDynamics locationDesignators:
		self locationsForYes.
	aCMIDAIRCitizen contactProfile isMuppetContactProfile ifFalse: [ 
		aCMIDAIRCitizen cormasModel recordHistory:
			(aCMIDAIRCitizen contactProfile playerName , ': ') asText allBold
			, (self name , ' - YES') asText.
		aCMIDAIRCitizen cormasModel recordCitizenActionYes ]
]

{ #category : #converting }
CMIDAIRRPGCitizenAction >> forNo [

	^ CMIDAIRRPGCitizenActionWrapperForNo on: self
]

{ #category : #converting }
CMIDAIRRPGCitizenAction >> forYes [

	^ CMIDAIRRPGCitizenActionWrapperForYes on: self
]

{ #category : #testing }
CMIDAIRRPGCitizenAction >> isCitizenAction [

	^ true
]

{ #category : #testing }
CMIDAIRRPGCitizenAction >> isImmediateAction [

	^ false
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
