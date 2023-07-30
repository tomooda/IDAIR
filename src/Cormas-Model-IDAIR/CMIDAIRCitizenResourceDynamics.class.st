Class {
	#name : #CMIDAIRCitizenResourceDynamics,
	#superclass : #Object,
	#instVars : [
		'citizen'
	],
	#category : #'Cormas-Model-IDAIR-Resource'
}

{ #category : #testing }
CMIDAIRCitizenResourceDynamics class >> isAbstract [

	^ self = CMIDAIRCitizenResourceDynamics
]

{ #category : #'instance creation' }
CMIDAIRCitizenResourceDynamics class >> on: aCMIDAIRCitizen [

	^ self new
		  citizen: aCMIDAIRCitizen;
		  yourself
]

{ #category : #accessing }
CMIDAIRCitizenResourceDynamics >> citizen [

	^ citizen
]

{ #category : #accessing }
CMIDAIRCitizenResourceDynamics >> citizen: aCMIDAIRCitizen [

	citizen := aCMIDAIRCitizen
]

{ #category : #operations }
CMIDAIRCitizenResourceDynamics >> citizenDead [

	^ self subclassResponsibility
]

{ #category : #operations }
CMIDAIRCitizenResourceDynamics >> citizenHospitalized [

	^ self subclassResponsibility
]

{ #category : #operations }
CMIDAIRCitizenResourceDynamics >> citizenICUed [

	^ self subclassResponsibility
]

{ #category : #operations }
CMIDAIRCitizenResourceDynamics >> citizenQuarrantined [

	^ self subclassResponsibility
]

{ #category : #operations }
CMIDAIRCitizenResourceDynamics >> citizenReleased [

	^ self subclassResponsibility
]

{ #category : #testing }
CMIDAIRCitizenResourceDynamics >> hasIsolation [

	^ self citizen diseaseDynamics isHospitalized
]

{ #category : #accessing }
CMIDAIRCitizenResourceDynamics >> personalPreventionFactor [

	^ self subclassResponsibility
]

{ #category : #accessing }
CMIDAIRCitizenResourceDynamics >> resourceModel [

	(citizen ifNotNil: #cormasModel) ifNotNil: [ :model | 
		model submodelAt: #resource do: [ :resourceModel | ^ resourceModel ] ].
	^ nil
]

{ #category : #controlling }
CMIDAIRCitizenResourceDynamics >> step [

	^ self subclassResponsibility
]
