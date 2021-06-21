Class {
	#name : #MenuSuscripcion,
	#superclass : #SubMenuView,
	#instVars : [
		'table',
		'subMenu',
		'addSuscription',
		'options'
	],
	#category : #'TiendaOnline-View'
}

{ #category : #'as yet unclassified' }
MenuSuscripcion class >> createMenuSuscripcionIn:aContent [
|temp|
temp := self new.
^temp initialize:aContent.
]

{ #category : #initialization }
MenuSuscripcion >> addOptions [ 
|temp|
temp :=#('Aplicar Promocion')asOrderedCollection .
options:=(Helper createPanel: temp aLogic:self routes).
subMenu addMorph:options
 
]

{ #category : #initialization }
MenuSuscripcion >> addSuscription [
addSuscription :=ModalSuscripcion call.
subMenu addMorph:addSuscription.
]

{ #category : #initialization }
MenuSuscripcion >> initialize:aContent [
super initialize.
subMenu :=aContent.
self addSuscription.
self loadTable.
self addOptions.
self style.

]

{ #category : #initialization }
MenuSuscripcion >> loadTable [ 
| aNamesColumnTable temp|
temp  :=Control modelFuntionReturn:[:tienda| tienda getSuscripciones].
aNamesColumnTable:= #( 'Nombre' 'Descuento Libro' 'Descuento Pelicula' 'Descuento Aplicacion')asOrderedCollection.
table := Table create: (Descuento elements:(temp)) aCollums: aNamesColumnTable  aSize:(800@200).
"Style"
Helper addCenterMorph: table in:subMenu.
Helper border: table aColor:table color.
table headerBorder:0.95. 
]

{ #category : #initialization }
MenuSuscripcion >> routes [
	"Inspirate in concept IONIC Framework"
	^ [ :id | 
	  | logicReturn |
	id = 'Peliculas' ifTrue: [ logicReturn := [|a|.a:=Button create:'Funco'.a openInHand] ].
	id = 'Aplicaciones' ifTrue: [ logicReturn := [|a|.a:=Button create:'OMG'.a openInHand] ].
	id = 'Nueva' ifTrue: [ logicReturn := [ModalSuscripcion call] ].
	id ='actualizar' ifTrue:[logicReturn :=table delete.self loadTable.].
	logicReturn.
	].
]

{ #category : #initialization }
MenuSuscripcion >> style [ 
addSuscription left:subMenu left+10.
addSuscription top:subMenu top.
table left:addSuscription right +10.
table top:subMenu  top.
options top:table bottom+10.
options left:table left.
]
