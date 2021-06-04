Class {
	#name : #MenuPromocion,
	#superclass : #SubMenuView,
	#instVars : [
		'subMenu'
	],
	#category : #'TiendaOnline-View'
}

{ #category : #'as yet unclassified' }
MenuPromocion class >> createMenuPromocionIn:aContent [
|temp|
temp := self new.
^temp initialize:aContent.
]

{ #category : #initialization }
MenuPromocion >> addOptions [ 
|temp|
temp := #(Rangos Crear Aplicar Eliminar)asOrderedCollection .
Helper addLeftTopMorphic:(Helper createPanel: temp aLogic:self routes) in:subMenu.
]

{ #category : #initialization }
MenuPromocion >> initialize:aContent [
super initialize.
subMenu:=aContent.
self addOptions.

]

{ #category : #initialization }
MenuPromocion >> routes [
	"Inspirate in concept IONIC Framework"
	^ [ :id | 
	  | logicReturn |
	id = 'Peliculas' ifTrue: [ logicReturn := [|a|.a:=Button create:'Funco'.a openInHand] ].
	id = 'Aplicaciones' ifTrue: [ logicReturn := [|a|.a:=Button create:'OMG'.a openInHand] ].
	id = 'Juegos' ifTrue: [ logicReturn := [|a|.a:=Button create:'Amazing'.a openInHand] ].
	id = 'Libros' ifTrue: [ logicReturn := [|a|.a:=Button create:'beautiful'.a openInHand] ].
	logicReturn.
	].
]
