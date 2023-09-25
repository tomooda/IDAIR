Class {
	#name : #CMIDAIRRPGMapPresenter,
	#superclass : #SpPresenterWithModel,
	#instVars : [
		'roassal'
	],
	#category : #'Cormas-Model-IDAIR-RPG-UI'
}

{ #category : #specs }
CMIDAIRRPGMapPresenter class >> defaultSpec [

	^ SpBoxLayout newVertical add: #roassal
]

{ #category : #drawing }
CMIDAIRRPGMapPresenter >> drawMap: aCanvas [

	aCanvas color: Color transparent.
	self model theLocations do: [ :location | 
		aCanvas addShape: (RSBox new
				 position: location coordinates;
				 color: location color;
				 extent: 1 @ 1;
				 yourself) ].
	self model theCitizens do: [ :citizen | 
		aCanvas addShape: (RSBox new
				 position: citizen locationDynamics position;
				 color: citizen diseaseDynamics color;
				 extent: 0.1 @ 0.1;
				 yourself) ].
	RSZoomToFitCanvasInteraction new zoomToFitOnStart: aCanvas
]

{ #category : #initialization }
CMIDAIRRPGMapPresenter >> initializePresenters [

	super initializePresenters.
	roassal := self newRoassal script: [ :canvas | self drawMap: canvas ]
]

{ #category : #accessing }
CMIDAIRRPGMapPresenter >> refresh [

	roassal refresh
]
