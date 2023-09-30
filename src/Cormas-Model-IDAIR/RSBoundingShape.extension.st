Extension { #name : #RSBoundingShape }

{ #category : #'*Cormas-Model-IDAIR' }
RSBoundingShape >> translateMiddleLeftTo: aPositionAsPoint [
	"Translate the shape to make the middle right position at a given position

```
c := RSCanvas new.

center := RSEllipse new size: 2; color: Color red.
c add: center.
center translateTo: 0 @ 0.

lbl := RSLabel text: 'Middle right corner'.
c add: lbl.
lbl translateMiddleRightTo: 0 @ 0.
c @ RSCanvasController.
c open
```
	
"
	self translateTo: aPositionAsPoint + ((self extent x / 2) @ 0)
]
