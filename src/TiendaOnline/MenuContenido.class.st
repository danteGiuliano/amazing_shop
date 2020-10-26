Class {
	#name : #MenuContenido,
	#superclass : #SubMenuView,
	#category : #TiendaOnline
}

{ #category : #'as yet unclassified' }
MenuContenido class >> createMenuContenido [
|temp|
temp := self new.
^temp initialize.
]

{ #category : #initialization }
MenuContenido >> initialize [
|temp|
temp := #(Peliculas Aplicaciones Juegos Libros)asOrderedCollection .
super initialize. 
self addMorphCentered: (Helper createPanel: temp).
]
