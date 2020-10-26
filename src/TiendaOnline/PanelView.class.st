Class {
	#name : #PanelView,
	#superclass : #MenuMorph,
	#instVars : [
		'colComponentes'
	],
	#category : #TiendaOnline
}

{ #category : #'as yet unclassified' }
PanelView class >> create:aNameColeccion [
|temp|.
temp := self new.
temp initialize:aNameColeccion.
^temp.
]

{ #category : #initialization }
PanelView >> initialize:aNameColection [
|temp|
colComponentes := OrderedCollection new.
aNameColection   do:[ :aName|temp:=(Button create:aName size:(200@100)).
	colComponentes add: temp.
	self addMenuItem:temp
	].
]
