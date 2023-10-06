Class {
	#name : #CMIDAIRDiseaseDynamics,
	#superclass : #Object,
	#instVars : [
		'citizen'
	],
	#classVars : [
		'RandomGenerator'
	],
	#category : #'Cormas-Model-IDAIR-Disease'
}

{ #category : #testing }
CMIDAIRDiseaseDynamics class >> isAbstract [

	^ self = CMIDAIRDiseaseDynamics
]

{ #category : #'instance creation' }
CMIDAIRDiseaseDynamics class >> on: aCMIDAIRCitizen [

	^ self new
		  citizen: aCMIDAIRCitizen;
		  yourself
]

{ #category : #accessing }
CMIDAIRDiseaseDynamics class >> randomGenerator [

	^ RandomGenerator ifNil: [ RandomGenerator := Random new ]
]

{ #category : #actions }
CMIDAIRDiseaseDynamics >> beAsymptomatic [

	^ self subclassResponsibility
]

{ #category : #testing }
CMIDAIRDiseaseDynamics >> beDead [

	^ self subclassResponsibility
]

{ #category : #actions }
CMIDAIRDiseaseDynamics >> beExposed [

	^ self subclassResponsibility
]

{ #category : #actions }
CMIDAIRDiseaseDynamics >> beHospitalized [

	^ self subclassResponsibility
]

{ #category : #actions }
CMIDAIRDiseaseDynamics >> beMildSymptom [

	^ self subclassResponsibility
]

{ #category : #actions }
CMIDAIRDiseaseDynamics >> beSevereSymptom [

	^ self subclassResponsibility
]

{ #category : #testing }
CMIDAIRDiseaseDynamics >> beSusceptible [

	^ self subclassResponsibility
]

{ #category : #accessing }
CMIDAIRDiseaseDynamics >> beta [

	^ self subclassResponsibility
]

{ #category : #accessing }
CMIDAIRDiseaseDynamics >> betaPerStep [

	^ self beta * self daysPerStep / self tau
]

{ #category : #accessing }
CMIDAIRDiseaseDynamics >> citizen [

	^ citizen
]

{ #category : #accessing }
CMIDAIRDiseaseDynamics >> citizen: aCMIDAIRCitizen [

	citizen := aCMIDAIRCitizen
]

{ #category : #accessing }
CMIDAIRDiseaseDynamics >> color [

	^ self subclassResponsibility
]

{ #category : #accessing }
CMIDAIRDiseaseDynamics >> cormasModel [

	^ citizen ifNotNil: #cormasModel
]

{ #category : #accessing }
CMIDAIRDiseaseDynamics >> daysPerStep [

	^ self citizen cormasModel daysPerStep
]

{ #category : #accessing }
CMIDAIRDiseaseDynamics >> inCommunity [

	^ self subclassResponsibility
]

{ #category : #testing }
CMIDAIRDiseaseDynamics >> isAsymptomatic [

	^ self subclassResponsibility
]

{ #category : #testing }
CMIDAIRDiseaseDynamics >> isDead [

	^ self subclassResponsibility
]

{ #category : #testing }
CMIDAIRDiseaseDynamics >> isHospitalized [

	^ self subclassResponsibility
]

{ #category : #testing }
CMIDAIRDiseaseDynamics >> isICUed [

	^ self subclassResponsibility
]

{ #category : #testing }
CMIDAIRDiseaseDynamics >> isInCommunity [

	^ self subclassResponsibility
]

{ #category : #testing }
CMIDAIRDiseaseDynamics >> isInfected [

	^ self subclassResponsibility
]

{ #category : #testing }
CMIDAIRDiseaseDynamics >> isQuarrantined [

	^ self subclassResponsibility
]

{ #category : #testing }
CMIDAIRDiseaseDynamics >> isRecovered [

	^ self subclassResponsibility
]

{ #category : #testing }
CMIDAIRDiseaseDynamics >> isSusceptible [

	^ self subclassResponsibility
]

{ #category : #testing }
CMIDAIRDiseaseDynamics >> isSymptomatic [

	^ self subclassResponsibility
]

{ #category : #testing }
CMIDAIRDiseaseDynamics >> isTransmissible [

	^ self subclassResponsibility
]

{ #category : #accessing }
CMIDAIRDiseaseDynamics >> modelParameter [

	^ self modelParameterAt: thisContext sender selector
]

{ #category : #accessing }
CMIDAIRDiseaseDynamics >> modelParameterAt: aSymbol [

	^ citizen cormasModel submodelAt: #disease do: aSymbol
]

{ #category : #accessing }
CMIDAIRDiseaseDynamics >> name [

	^ self subclassResponsibility
]

{ #category : #accessing }
CMIDAIRDiseaseDynamics >> random [

	^ self class randomGenerator next
]

{ #category : #actions }
CMIDAIRDiseaseDynamics >> randomDuration [

	^ self subclassResponsibility
]

{ #category : #actions }
CMIDAIRDiseaseDynamics >> step [

	^ self subclassResponsibility
]

{ #category : #accessing }
CMIDAIRDiseaseDynamics >> tau [

	^ self subclassResponsibility
]
