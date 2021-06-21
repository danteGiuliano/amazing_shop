Class {
	#name : #MenuContenido,
	#superclass : #SubMenuView,
	#instVars : [
		'addContenido',
		'componetSearch',
		'panel',
		'subMenu',
		'panelContenido',
		'table',
		'columns',
		'dataCompraCollect'
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
addContenido :=ComponentContenidoMenu call.
Helper addLeftBottomMorph:addContenido  in:subMenu. 


]

{ #category : #initialization }
MenuContenido >> addLogic [
componetSearch table:table.


]

{ #category : #initialization }
MenuContenido >> addTable [ 
columns :=#('Nombre Cliente' 'Fecha' 'Suscripcion').
dataCompraCollect :=DataCompra elements:nil.
table :=Table create:dataCompraCollect  aCollums:columns  aSize:500@480.
Helper border: table aColor:table color rad:8. 
table headerBorder.
subMenu addMorph:table.

]

{ #category : #initialization }
MenuContenido >> initialize:aContent [
super initialize.
subMenu :=aContent.
self addContenido.
self searchContenido.
self addTable.
self viewContenido.
self style.
self addLogic.


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
MenuContenido >> searchContenido [
componetSearch :=ComponenetContenidoBusqueda call.
Helper addCenterBottomMorph: componetSearch  in:subMenu.



]

{ #category : #initialization }
MenuContenido >> style [.

panelContenido left:subMenu left.
panelContenido top:subMenu top.

componetSearch left:panelContenido left.

table left:componetSearch right +10.
table bottom: componetSearch bottom.

addContenido left:table left.
addContenido bottom:table top-10.
]

{ #category : #initialization }
MenuContenido >> updateTable [
table :=Table create:dataCompraCollect  aCollums:columns  aSize:500@480.
subMenu addMorph:table.

]

{ #category : #initialization }
MenuContenido >> viewContenido [
panelContenido :=PanelContenido call:table.
Helper addRightCenterMorph:panelContenido  in:subMenu. 

]
