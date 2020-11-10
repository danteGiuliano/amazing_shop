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
	#category : #'TiendaOnline-View'
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
Helper addLeftTopMorphic:(Helper createPanel:colNameOptions aLogic:self routes)in:self.
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

]

{ #category : #initialization }
Menu >> loadCliennte [
Helper addLeftTopMorphic:(MenuCliente createMenuCliente) in:subMenu. 
]

{ #category : #initialization }
Menu >> loadContenido [
Helper addLeftTopMorphic:(MenuContenido createMenuContenido)in:subMenu. 
]

{ #category : #initialization }
Menu >> loadPromocion [
Helper addLeftTopMorphic:(MenuPromocion createMenuPromocion) in:subMenu.  
]

{ #category : #initialization }
Menu >> loadSuscripcion [
Helper addLeftTopMorphic:(MenuSuscripcion  createMenuSuscripcion) in:subMenu. 
]

{ #category : #initialization }
Menu >> routes [
	"Inspirate in concept IONIC Framework"
	^ [ :id | 
	  | logicReturn |
	logicReturn :=3.
	id = 'Clientes' ifTrue: [ logicReturn:=[self update;loadCliennte ] ].
	id = 'Subscripciones' ifTrue: [ logicReturn := [self update ;loadSuscripcion ] ].
	id = 'Contenido' ifTrue: [ logicReturn :=[self update; loadContenido]].
	id = 'Promociones' ifTrue: [ logicReturn := [self update;loadPromocion ]].
	logicReturn
	].
]

{ #category : #initialization }
Menu >> update [
subMenu update.
self addSubMenu.
]
