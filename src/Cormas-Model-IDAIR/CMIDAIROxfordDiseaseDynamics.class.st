Class {
	#name : #CMIDAIROxfordDiseaseDynamics,
	#superclass : #CMIDAIRDiseaseDynamics,
	#category : #'Cormas-Model-IDAIR-Disease-Oxford'
}

{ #category : #testing }
CMIDAIROxfordDiseaseDynamics class >> isAbstract [

	^ self = CMIDAIROxfordDiseaseDynamics
]

{ #category : #transitioning }
CMIDAIROxfordDiseaseDynamics >> beAsymptomatic [

	^ CMIDAIROxfordAsymptomatic newFrom: self
]

{ #category : #transitioning }
CMIDAIROxfordDiseaseDynamics >> beDead [

	^ CMIDAIROxfordDead newFrom: self
]

{ #category : #transitioning }
CMIDAIROxfordDiseaseDynamics >> beHospitalized [

	^ CMIDAIROxfordHospitalized newFrom: self
]

{ #category : #transitioning }
CMIDAIROxfordDiseaseDynamics >> beHospitalizedRecovering [

	^ CMIDAIROxfordHospitalizedRecovering newFrom: self
]

{ #category : #transitioning }
CMIDAIROxfordDiseaseDynamics >> beICUed [

	^ CMIDAIROxfordICUed newFrom: self
]

{ #category : #transitioning }
CMIDAIROxfordDiseaseDynamics >> bePreSymptomaticMild [

	^ CMIDAIROxfordPreSymptomaticMild newFrom: self
]

{ #category : #transitioning }
CMIDAIROxfordDiseaseDynamics >> bePreSymptomaticSevere [

	^ CMIDAIROxfordPreSymptomaticSevere newFrom: self
]

{ #category : #transitioning }
CMIDAIROxfordDiseaseDynamics >> beSusceptive [

	^ CMIDAIROxfordSusceptive newFrom: self
]

{ #category : #transitioning }
CMIDAIROxfordDiseaseDynamics >> beSymptomsMild [

	^ CMIDAIROxfordSymptomsMild newFrom: self
]

{ #category : #transitioning }
CMIDAIROxfordDiseaseDynamics >> beSymptomsSevere [

	^ CMIDAIROxfordSymptomsSevere newFrom: self
]

{ #category : #testing }
CMIDAIROxfordDiseaseDynamics >> isAsymptomatic [

	^ false
]

{ #category : #testing }
CMIDAIROxfordDiseaseDynamics >> isDead [

	^ false
]

{ #category : #testing }
CMIDAIROxfordDiseaseDynamics >> isHospitalized [

	^ false
]

{ #category : #testing }
CMIDAIROxfordDiseaseDynamics >> isHospitalizedRecovering [

	^ false
]

{ #category : #testing }
CMIDAIROxfordDiseaseDynamics >> isICUed [

	^ false
]

{ #category : #testing }
CMIDAIROxfordDiseaseDynamics >> isInfected [

	^ false
]

{ #category : #testing }
CMIDAIROxfordDiseaseDynamics >> isMildSymptom [

	^ false
]

{ #category : #testing }
CMIDAIROxfordDiseaseDynamics >> isPreSymptomatic [

	^ false
]

{ #category : #testing }
CMIDAIROxfordDiseaseDynamics >> isSevereSymptom [

	^ false
]

{ #category : #testing }
CMIDAIROxfordDiseaseDynamics >> isSusceptive [

	^ false
]

{ #category : #testing }
CMIDAIROxfordDiseaseDynamics >> isSymptomatic [

	^ false
]

{ #category : #accessing }
CMIDAIROxfordDiseaseDynamics >> modelParameter [

	^ self modelParameterAt: thisContext sender selector
]

{ #category : #accessing }
CMIDAIROxfordDiseaseDynamics >> modelParameterAt: aSymbol [

	^ citizen cormasModel submodelAt: #disease do: aSymbol
]

{ #category : #accessing }
CMIDAIROxfordDiseaseDynamics >> name [

	^ self subclassResponsibility
]

{ #category : #parameters }
CMIDAIROxfordDiseaseDynamics >> pAsymptomaticOdm [

	^ self modelParameter
]

{ #category : #parameters }
CMIDAIROxfordDiseaseDynamics >> pCrit [

	^ self modelParameter
]

{ #category : #parameters }
CMIDAIROxfordDiseaseDynamics >> pDeath [

	^ self modelParameter
]

{ #category : #parameters }
CMIDAIROxfordDiseaseDynamics >> pFalseNegative [

	^ self modelParameter
]

{ #category : #parameters }
CMIDAIROxfordDiseaseDynamics >> pHosp [

	^ self modelParameter
]

{ #category : #parameters }
CMIDAIROxfordDiseaseDynamics >> pICU [

	^ self modelParameter
]

{ #category : #parameters }
CMIDAIROxfordDiseaseDynamics >> pInfection [

	^ self modelParameter
]

{ #category : #parameters }
CMIDAIROxfordDiseaseDynamics >> pPreSymptomaticMildOdm [

	^ self modelParameter
]

{ #category : #accessing }
CMIDAIROxfordDiseaseDynamics >> random [

	^ self class randomGenerator next
]

{ #category : #actions }
CMIDAIROxfordDiseaseDynamics >> step [

	^ self subclassResponsibility
]

{ #category : #parameters }
CMIDAIROxfordDiseaseDynamics >> tauARec [

	^ self modelParameter
]

{ #category : #parameters }
CMIDAIROxfordDiseaseDynamics >> tauCrit [

	^ self modelParameter
]

{ #category : #parameters }
CMIDAIROxfordDiseaseDynamics >> tauCritSurv [

	^ self modelParameter
]

{ #category : #parameters }
CMIDAIROxfordDiseaseDynamics >> tauDeath [

	^ self modelParameter
]

{ #category : #parameters }
CMIDAIROxfordDiseaseDynamics >> tauHosp [

	^ self modelParameter
]

{ #category : #parameters }
CMIDAIROxfordDiseaseDynamics >> tauHospRec [

	^ self modelParameter
]

{ #category : #parameters }
CMIDAIROxfordDiseaseDynamics >> tauRec [

	^ self modelParameter
]

{ #category : #parameters }
CMIDAIROxfordDiseaseDynamics >> tauSym [

	^ self modelParameter
]

{ #category : #actions }
CMIDAIROxfordDiseaseDynamics >> test [

	^ self subclassResponsibility
]
