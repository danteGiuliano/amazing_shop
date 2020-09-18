Class {
	#name : #Menu,
	#superclass : #BorderedMorph,
	#instVars : [
		'name',
		'resources'
	],
	#category : #TiendaOnline
}

{ #category : #initialization }
Menu class >> create [
| a |
a := self new.
a initializeShop.
^a
]

{ #category : #'as yet unclassified' }
Menu >> initializeButtons [ 
|close login create|

close := Button create:'close'. self addMorphCentered: close.
login := Button create:'login '. self addMorphCentered: login.
create := Button create:'create shop'. self addMorphCentered: create.
"Posiciono los botones en la ventana."
"I position the buttons of the entrance"
login bottom:400.
close bottom:450.







]

{ #category : #'as yet unclassified' }
Menu >> initializeShop [
super initialize.
self  extent:320@480.
self initializeButtons.
self openInHand.

]
