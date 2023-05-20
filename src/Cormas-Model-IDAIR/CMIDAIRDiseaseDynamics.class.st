Class {
	#name : #CMIDAIRDiseaseDynamics,
	#superclass : #Object,
	#instVars : [
		'citizen'
	],
	#classInstVars : [
		'randomGenerator'
	],
	#category : #'Cormas-Model-IDAIR'
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
CMIDAIRDiseaseDynamics >> name [

	^ self subclassResponsibility
]

{ #category : #parameters }
CMIDAIRDiseaseDynamics >> pAsymptomaticOdm [

	^ 0.5
]

{ #category : #parameters }
CMIDAIRDiseaseDynamics >> pCrit [

	^ 0.95
]

{ #category : #parameters }
CMIDAIRDiseaseDynamics >> pDeath [
	^ 0.5
]

{ #category : #parameters }
CMIDAIRDiseaseDynamics >> pFalseNegative [

	^ 0.1
]

{ #category : #parameters }
CMIDAIRDiseaseDynamics >> pHosp [

	^ 0.1
]

{ #category : #parameters }
CMIDAIRDiseaseDynamics >> pICU [

	^ 0.1
]

{ #category : #parameters }
CMIDAIRDiseaseDynamics >> pInfection [

	^ 0.3
]

{ #category : #parameters }
CMIDAIRDiseaseDynamics >> pPreSymptomaticMildOdm [

	^ 0.3
]

{ #category : #parameters }
CMIDAIRDiseaseDynamics >> pPreSymptomaticSevereOdm [

	^ 1.0 - self pAsymptomaticOdm - self pPreSymptomaticMildOdm
]

{ #category : #parameters }
CMIDAIRDiseaseDynamics >> pSurvivalInHospital [

	^ 0.05
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
	^ 15
]

{ #category : #parameters }
CMIDAIRDiseaseDynamics >> tauCrit [
	^ 4.25
]

{ #category : #parameters }
CMIDAIRDiseaseDynamics >> tauCritSurv [
	^ 6.0
]

{ #category : #parameters }
CMIDAIRDiseaseDynamics >> tauDeath [
	^ 3.0
]

{ #category : #parameters }
CMIDAIRDiseaseDynamics >> tauHosp [
	^ 5
]

{ #category : #parameters }
CMIDAIRDiseaseDynamics >> tauHospRec [
	^ 3.25
]

{ #category : #parameters }
CMIDAIRDiseaseDynamics >> tauRec [
	^ 12
]

{ #category : #parameters }
CMIDAIRDiseaseDynamics >> tauSym [
	^ 6
]

{ #category : #actions }
CMIDAIRDiseaseDynamics >> test [

	^ self subclassResponsibility
]
