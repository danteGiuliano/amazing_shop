Class {
	#name : #MenuSuscripcion,
	#superclass : #SubMenuView,
	#instVars : [
		'table',
		'subMenu'
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
temp :=#(Nueva Borrar Buscar actualizar)asOrderedCollection .
Helper addLeftTopMorphic:(Helper createPanel: temp aLogic:self routes)  in:subMenu. 
 
]

{ #category : #initialization }
MenuSuscripcion >> initialize:aContent [
super initialize.
subMenu :=aContent.
model:=aContent getModel.
aContent addDependent: self.
self loadTable.
self addOptions.
]

{ #category : #initialization }
MenuSuscripcion >> loadTable [ 
| aNamesColumnTable temp|
temp  :=Control modelFuntionReturn:[:tienda| tienda getSuscripciones].
aNamesColumnTable:= #( 'Nombre' 'Descuento Libro' 'Descuento Pelicula' 'Descuento Aplicacion')asOrderedCollection.
table := Table create: (Descuento elements:(temp)) aCollums: aNamesColumnTable  aSize:(700@600).
"Style"
table color:(table color alpha:0.85).
Helper addCenterMorph: table in:subMenu. 
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
