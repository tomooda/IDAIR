Class {
	#name : #CMIDAIRDiseaseDynamics,
	#superclass : #Object,
	#instVars : [
		'citizen'
	],
	#classInstVars : [
		'randomGenerator'
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

	^ randomGenerator ifNil: [ randomGenerator := Random new ]
]

{ #category : #transitioning }
CMIDAIRDiseaseDynamics >> beAsymptomatic [

	^ CMIDAIRAsymptomatic newFrom: self
]

{ #category : #transitioning }
CMIDAIRDiseaseDynamics >> beDead [

	^ CMIDAIRDead newFrom: self
]

{ #category : #transitioning }
CMIDAIRDiseaseDynamics >> beHealthy [

	^ CMIDAIRHealthy newFrom: self
]

{ #category : #transitioning }
CMIDAIRDiseaseDynamics >> beHospitalized [

	^ CMIDAIRHospitalized newFrom: self
]

{ #category : #transitioning }
CMIDAIRDiseaseDynamics >> beHospitalizedRecovering [

	^ CMIDAIRHospitalizedRecovering newFrom: self
]

{ #category : #transitioning }
CMIDAIRDiseaseDynamics >> beICUed [

	^ CMIDAIRICUed newFrom: self
]

{ #category : #transitioning }
CMIDAIRDiseaseDynamics >> bePreSymptomaticMild [

	^ CMIDAIRPreSymptomaticMild newFrom: self
]

{ #category : #transitioning }
CMIDAIRDiseaseDynamics >> bePreSymptomaticSevere [

	^ CMIDAIRPreSymptomaticSevere newFrom: self
]

{ #category : #transitioning }
CMIDAIRDiseaseDynamics >> beSusceptible [

	^ self subclassResponsibility
]

{ #category : #transitioning }
CMIDAIRDiseaseDynamics >> beSymptomsMild [

	^ CMIDAIRSymptomsMild newFrom: self
]

{ #category : #transitioning }
CMIDAIRDiseaseDynamics >> beSymptomsSevere [

	^ CMIDAIRSymptomsSevere newFrom: self
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

{ #category : #actions }
CMIDAIRDiseaseDynamics >> contact [

	^ self subclassResponsibility
]

{ #category : #actions }
CMIDAIRDiseaseDynamics >> contaminate: aCMIDAIRLocation [

	^ self subclassResponsibility
]

{ #category : #testing }
CMIDAIRDiseaseDynamics >> isActive [

	^ self subclassResponsibility
]

{ #category : #testing }
CMIDAIRDiseaseDynamics >> isDead [

	^ false
]

{ #category : #testing }
CMIDAIRDiseaseDynamics >> isIsolated [

	^ false
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

{ #category : #parameters }
CMIDAIRDiseaseDynamics >> pAsymptomaticOdm [

	^ self modelParameter
]

{ #category : #parameters }
CMIDAIRDiseaseDynamics >> pCrit [

	^ self modelParameter
]

{ #category : #parameters }
CMIDAIRDiseaseDynamics >> pDeath [

	^ self modelParameter
]

{ #category : #parameters }
CMIDAIRDiseaseDynamics >> pFalseNegative [

	^ self modelParameter
]

{ #category : #parameters }
CMIDAIRDiseaseDynamics >> pHosp [

	^ self modelParameter
]

{ #category : #parameters }
CMIDAIRDiseaseDynamics >> pICU [

	^ self modelParameter
]

{ #category : #parameters }
CMIDAIRDiseaseDynamics >> pInfection [

	^ self modelParameter
]

{ #category : #parameters }
CMIDAIRDiseaseDynamics >> pPreSymptomaticMildOdm [

	^ self modelParameter
]

{ #category : #accessing }
CMIDAIRDiseaseDynamics >> random [

	^ self class randomGenerator next
]

{ #category : #actions }
CMIDAIRDiseaseDynamics >> step [

	^ self subclassResponsibility
]

{ #category : #parameters }
CMIDAIRDiseaseDynamics >> tauARec [

	^ self modelParameter
]

{ #category : #parameters }
CMIDAIRDiseaseDynamics >> tauCrit [

	^ self modelParameter
]

{ #category : #parameters }
CMIDAIRDiseaseDynamics >> tauCritSurv [

	^ self modelParameter
]

{ #category : #parameters }
CMIDAIRDiseaseDynamics >> tauDeath [

	^ self modelParameter
]

{ #category : #parameters }
CMIDAIRDiseaseDynamics >> tauHosp [

	^ self modelParameter
]

{ #category : #parameters }
CMIDAIRDiseaseDynamics >> tauHospRec [

	^ self modelParameter
]

{ #category : #parameters }
CMIDAIRDiseaseDynamics >> tauRec [

	^ self modelParameter
]

{ #category : #parameters }
CMIDAIRDiseaseDynamics >> tauSym [

	^ self modelParameter
]

{ #category : #actions }
CMIDAIRDiseaseDynamics >> test [

	^ self subclassResponsibility
]
