"
para crear una tienda.
|a|
a := Menu create:'tienda'.

"
Class {
	#name : #Menu,
	#superclass : #FullscreenMorph,
	#instVars : [
		'subMenu',
		'calendar',
		'exit',
		'logout',
		'model'
	],
	#category : #'TiendaOnline-View'
}

{ #category : #'as yet unclassified' }
Menu class >> create:aModel [
|temp|.
"El menu principal solo se encarga de posicionar las ventanas."
temp := self new.
temp initialize.
temp initializeModel:aModel.
^temp openInWorld.

]

{ #category : #initialization }
Menu >> addBotons [
logout := Button create:'Logout' size:60@30.
exit := Button create:'exit' size:60@30.

self addMorphCentered:logout.
self addMorphCentered: exit.
exit mouseAction:[exit close:self].
Helper positionLeftBotton:exit in:self.
exit left:4.
exit top:620.
Helper positionOutsideRigthMorp: logout  in:exit. 
logout left:100.


]

{ #category : #initialization }
Menu >> addCalendar [
calendar := CalendarMorph openOn: (Date today).
self addMorphFront: calendar.
Helper positionAboveContent: calendar in:exit. 
calendar left:5.
calendar top:450

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
subMenu addDependent: self.
subMenu setModel:model.
self addMorphCentered:subMenu .
subMenu left:210.


]

{ #category : #initialization }
Menu >> initialize [
super initialize.
self addPanelOptions.
self addSubMenu.
self addBotons.
self addCalendar.

"Inicializar las opciones."

]

{ #category : #initialization }
Menu >> initializeModel:aModel [
model:=aModel.

]

{ #category : #initialization }
Menu >> loadCliente [
MenuCliente createMenuClienteIn: subMenu. 
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
	id = 'Clientes' ifTrue: [ logicReturn:=[self update;loadCliente ] ].
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
