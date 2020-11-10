Class {
	#name : #MenuCliente,
	#superclass : #SubMenuView,
	#category : #'TiendaOnline-View'
}

{ #category : #'as yet unclassified' }
MenuCliente class >> createMenuCliente [
|temp|
temp := self new.
^temp initialize.
]

{ #category : #initialization }
MenuCliente >> initialize [
|temp |
temp := #(Buscar cliente Crear Comprar)asOrderedCollection .
super initialize. 
self addMorphCentered:(Helper createPanel: temp aLogic:self routes).
]

{ #category : #initialization }
MenuCliente >> routes [
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
