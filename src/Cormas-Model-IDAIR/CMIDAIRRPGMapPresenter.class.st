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

	| shapes |
	aCanvas color: Color white.
	self model theLocations do: [ :location | 
		aCanvas addShape: (RSBox new
				 position: location coordinates;
				 color: location color;
				 extent: 1 @ 1;
				 yourself) ].
	shapes := self model theCitizens collect: [ :citizen | 
		          RSCircle new
			          position:
				          (citizen locationDynamics oldPosition ifNil: [ 
						           citizen locationDynamics position ]);
			          color: citizen diseaseDynamics color;
			          radius: 0.05;
			          model: citizen;
			          yourself ].
	aCanvas addAll: shapes.


	aCanvas newAnimation
		duration: 1 second;
		easing: RSEasingInterpolator backOut;
		onStepDo: [ :t | 
			shapes do: [ :shape | 
					shape position: (shape model locationDynamics positionAtT: t) ] ].

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
