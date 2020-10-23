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
^temp openInWorld.

]

{ #category : #initialization }
Menu >> addBotons [
|logout exit|
logout := Button create:'Logout' size:60@30.
exit := Button create:'exit' size:60@30.

self addMorphCentered:logout.
self addMorphCentered: exit.
exit mouseAction:[exit close:self].
Helper positionLeftBotton:exit and:self.
Helper positionRigthMorp: logout  and:exit. 
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

{ #category : #initialization }
Menu >> initialize [ 
super initialize.
self addLeftMorphic:(Helper createPanel).
self addSubMenuView:(Helper createSubMenu:(self extent) and:(self width)).
self addBotons.
]
