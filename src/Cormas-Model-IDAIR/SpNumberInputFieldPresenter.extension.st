Extension { #name : #SpNumberInputFieldPresenter }

{ #category : #'*Cormas-Model-IDAIR' }
SpNumberInputFieldPresenter >> number [

	"Answer the number ingressed."

	^ self text trimmed
		  ifNotEmpty: [ :aString | 
			  [ aString asNumber ]
				  on: Error
				  do: [ :ex | 0 ] ]
		  ifEmpty: [ 0 ]
]
