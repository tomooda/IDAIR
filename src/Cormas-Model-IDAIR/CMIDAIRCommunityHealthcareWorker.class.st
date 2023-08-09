Class {
	#name : #CMIDAIRCommunityHealthcareWorker,
	#superclass : #CMIDAIRAgent,
	#instVars : [
		'homesToVisit',
		'visitsRemainder'
	],
	#category : #'Cormas-Model-IDAIR-Community'
}

{ #category : #accessing }
CMIDAIRCommunityHealthcareWorker >> homesToVisit [

	^ homesToVisit
]

{ #category : #accessing }
CMIDAIRCommunityHealthcareWorker >> homesToVisit: aCollectionOfCMIDAIRLocation [

	homesToVisit := aCollectionOfCMIDAIRLocation
]

{ #category : #initialization }
CMIDAIRCommunityHealthcareWorker >> initialize [

	super initialize.
	homesToVisit := Array new.
	visitsRemainder := 0.0
]

{ #category : #pov }
CMIDAIRCommunityHealthcareWorker >> pov [

	<pov>
	^ Color magenta
]

{ #category : #control }
CMIDAIRCommunityHealthcareWorker >> step [

	homesToVisit ifNotNil: [ 
		visitsRemainder := visitsRemainder + self visitsPerStep.
		[ visitsRemainder >= 1.0 ] whileTrue: [ 
			self visit: homesToVisit atRandom.
			visitsRemainder := visitsRemainder - 1 ] ]
]

{ #category : #actions }
CMIDAIRCommunityHealthcareWorker >> visit: aCMIDAIRHome [

	aCMIDAIRHome setVisited.
	(aCMIDAIRHome occupants: #CMIDAIRCitizen) do: [ :citizen | 
		citizen isSymptomatic ifTrue: [ 
			citizen beHospitalized.
			citizen patch:
				(self cormasModel theLocations select: [ :location | 
					 location isHospital ]) atRandom ] ]
]

{ #category : #accessing }
CMIDAIRCommunityHealthcareWorker >> visitsPerDay [

	self cormasModel
		submodelAt: #community
		do: [ :communityHealthcareModel | 
		^ communityHealthcareModel visitsPerDay ].
	^ 0
]

{ #category : #accessing }
CMIDAIRCommunityHealthcareWorker >> visitsPerStep [

	^ self visitsPerDay * self daysPerStep
]
