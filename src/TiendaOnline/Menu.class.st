"
para crear una tienda.
|a|
a := Menu create:'tienda'.

"
Class {
	#name : #Menu,
	#superclass : #FullscreenMorph,
	#instVars : [
		'name'
	],
	#category : #TiendaOnline
}

{ #category : #'as yet unclassified' }
Menu class >> create [
|temp|.
"El menu principal solo se encarga de posicionar las ventanas."
temp := self new.
temp addLeftMorphic:(Helper createPanel).
temp addSubMenuView:(Helper createSubMenu:(temp extent) and:(temp width)).
^temp openInWorld.

]

{ #category : #adding }
Menu >> addLeftMorphic:aContent [
"Posiciona el panel en el origen del menu."
self addMorphCentered:aContent.
aContent position:(self innerBounds origin).

]

{ #category : #initialization }
Menu >> addSubMenuView:aContent [
self addMorphCentered:aContent.
aContent left:210.

]
