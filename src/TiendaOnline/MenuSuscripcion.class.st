Class {
	#name : #MenuSuscripcion,
	#superclass : #SubMenuView,
	#instVars : [
		'menu'
	],
	#category : #'TiendaOnline-View'
}

{ #category : #'as yet unclassified' }
MenuSuscripcion class >> createMenuSuscripcion [
|temp|
temp := self new.
^temp initialize.
]

{ #category : #initialization }
MenuSuscripcion >> initialize [
|temp|
temp :=#(Nueva Borrar Buscar)asOrderedCollection .
super initialize.
self addMorphCentered:(Helper createPanel: temp aLogic:self routes). 
]

{ #category : #initialization }
MenuSuscripcion >> routes [
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