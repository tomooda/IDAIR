Extension { #name : #String }

{ #category : #'*Cormas-Model-IDAIR' }
String >> copyWithoutFirst: anInteger [

	^ self copyFrom: anInteger + 1 to: self size
]
