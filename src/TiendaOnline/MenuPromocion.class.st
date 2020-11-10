Class {
	#name : #MenuPromocion,
	#superclass : #SubMenuView,
	#category : #'TiendaOnline-View'
}

{ #category : #'as yet unclassified' }
MenuPromocion class >> createMenuPromocion [
|temp|
temp := self new.
^temp initialize.
]

{ #category : #initialization }
MenuPromocion >> initialize [
|temp |
temp := #(Rangos Crear Aplicar Eliminar)asOrderedCollection .
super initialize. 
self addMorphCentered: (Helper createPanel: temp aLogic:self routes).
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
