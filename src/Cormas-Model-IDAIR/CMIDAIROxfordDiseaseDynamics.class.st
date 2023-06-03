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
CMIDAIROxfordDiseaseDynamics >> beRecovered [

	^ CMIDAIROxfordRecovered newFrom: self
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

{ #category : #parameters }
CMIDAIROxfordDiseaseDynamics >> betaAsymptomatic [

	^ self modelParameter
]

{ #category : #parameters }
CMIDAIROxfordDiseaseDynamics >> betaPreSymptomaticMild [

	^ self modelParameter
]

{ #category : #parameters }
CMIDAIROxfordDiseaseDynamics >> betaPreSymptomaticSevere [

	^ self modelParameter
]

{ #category : #parameters }
CMIDAIROxfordDiseaseDynamics >> betaSymptomaticMild [

	^ self modelParameter
]

{ #category : #parameters }
CMIDAIROxfordDiseaseDynamics >> betaSymptomaticSevere [

	^ self modelParameter
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
CMIDAIROxfordDiseaseDynamics >> isRecovered [

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
