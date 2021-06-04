Class {
	#name : #MenuContenido,
	#superclass : #SubMenuView,
	#instVars : [
		'panel',
		'subMenu',
		'panelContenido'
	],
	#category : #'TiendaOnline-View'
}

{ #category : #'as yet unclassified' }
MenuContenido class >> createMenuContenido [
|temp|
temp := self new.
^temp initialize.
]

{ #category : #'as yet unclassified' }
MenuContenido class >> createMenuContenidoIn:aContent [
|temp|
temp := self new.
^temp initialize:aContent.
]

{ #category : #initialization }
MenuContenido >> addContenido [
|addContenido|
addContenido :=ComponentContenidoMenu call.
Helper addLeftBottomMorph:addContenido  in:subMenu. 
addContenido bottom:subMenu bottom-30.

]

{ #category : #adding }
MenuContenido >> addOptions [
|temp| 
temp := #(Peliculas Aplicaciones Libros)asOrderedCollection .
Helper addLeftTopMorphic:(Helper createPanel: temp aLogic:self routes)  in:subMenu. 
]

{ #category : #initialization }
MenuContenido >> initialize:aContent [
super initialize.
subMenu :=aContent.
self addOptions.
self addContenido.
self viewContenido.


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

{ #category : #initialization }
MenuContenido >> viewContenido [
panelContenido :=PanelContenido call.
Helper addRightCenterMorph:panelContenido  in:subMenu. 
panelContenido right:subMenu right-60.
panelContenido top:subMenu top+100.
]
