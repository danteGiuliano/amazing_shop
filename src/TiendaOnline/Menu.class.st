"
para crear una tienda.
|a|
a := Menu create:'tienda'.

"
Class {
	#name : #Menu,
	#superclass : #FullscreenMorph,
	#instVars : [
		'contenido',
		'suscripcion',
		'subMenu'
	],
	#category : #TiendaOnline
}

{ #category : #'as yet unclassified' }
Menu class >> create [
|temp|.
"El menu principal solo se encarga de posicionar las ventanas."
temp := self new.
^temp openInWorld.

]

{ #category : #initialization }
Menu >> addBotons [
|logout exit|
logout := Button create:'Logout' size:60@30.
exit := Button create:'exit' size:60@30.

self addMorphCentered:logout.
self addMorphCentered: exit.
exit mouseAction:[exit close:self].
Helper positionLeftBotton:exit and:self.
Helper positionRigthMorp: logout  and:exit. 
]

{ #category : #initialization }
Menu >> addPanelOptions [
|colNameOptions|
colNameOptions := #(Clientes Subscripciones Contenido Promociones).
Helper addLeftTopMorphic:(Helper createPanel:colNameOptions)in:self.
]

{ #category : #initialization }
Menu >> addSubMenu [
subMenu := (Helper createSubMenu:(self extent) and:(self width)).
self addMorphCentered:subMenu .
subMenu left:210.


]

{ #category : #initialization }
Menu >> initialize [ 
super initialize.
self addPanelOptions.
self addSubMenu.
self addBotons.


"Inicializar las opciones."
contenido :=MenuContenido createMenuContenido.
suscripcion :=MenuSuscripcion createMenuSuscripcion.
Helper addLeftTopMorphic: suscripcion  in:subMenu. 
contenido visible: false.
Helper addLeftTopMorphic:contenido in:subMenu. 
]
