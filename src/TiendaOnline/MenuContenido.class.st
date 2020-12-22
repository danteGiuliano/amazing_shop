Class {
	#name : #MenuContenido,
	#superclass : #SubMenuView,
	#instVars : [
		'panel'
	],
	#category : #'TiendaOnline-View'
}

{ #category : #'as yet unclassified' }
MenuContenido class >> createMenuContenido [
|temp|
temp := self new.
^temp initialize.
]

{ #category : #initialization }
MenuContenido >> initialize [
|temp |
temp := #(Peliculas Aplicaciones Juegos Libros Softwares )asOrderedCollection .
super initialize. 
panel := (Helper createPanel: temp aLogic:self routes).
self addMorphCentered: panel.
]

{ #category : #initialization }
MenuContenido >> routes [
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