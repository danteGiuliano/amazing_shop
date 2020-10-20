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
temp := self new.
^temp addLeftMorphic:(Helper createPanel).



]

{ #category : #'as yet unclassified' }
Menu class >> create:title [
|temp|.
temp := self new.
temp initialize:title.
^temp addLeftMorphic:(Helper createPanel).



]

{ #category : #adding }
Menu >> addLeftMorphic:aContent [
"Posiciona el panel en el origen del menu."
self addMorphCentered:aContent.
aContent position:(self innerBounds origin).

]

{ #category : #initialization }
Menu >> initialize:title [
super initialize.
self initializeButtons.
self openInWorld.


]

{ #category : #initialization }
Menu >> initializeButtons [
|shops subscriptions clients contents|.
"Inicializo el panel de opciones."
"initialize this panel of options."

shops := Button create:'Tiendas'.
subscriptions := Button create:'Suscripciones'.
clients := Button create:'Clientes'.
contents := Button create:'Contenidos'.

shops extent: 400@500.
contents  extent: 400@500.
subscriptions  extent: 400@500.
clients  extent: 400@500.

self addMorphCentered: shops.
self addMorphCentered: clients.
self addMorphCentered: contents.
]
