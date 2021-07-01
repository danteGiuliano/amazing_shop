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
		'options',
		'changeTheme'
	],
	#category : #'TiendaOnline-View'
}

{ #category : #'as yet unclassified' }
Menu class >> create [
|temp|.
"El menu principal solo se encarga de posicionar las ventanas."
temp := self new.
temp initialize.
^temp openInWorld.

]

{ #category : #initialization }
Menu >> addBotons [
exit := Button create:'exit' size:60@30.
self addMorphCentered: exit.
exit mouseAction:[exit close:self].
Helper positionLeftBotton:exit in:self.
exit left:4.
exit top:620.
"Style"
Helper border: exit aColor:(exit color). 


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
Menu >> addFondoAnimado [
|gif|
gif :=Theme fonde.
gif fullBounds.
self addMorphBack:gif.



]

{ #category : #initialization }
Menu >> addPanelOptions [
|colNameOptions|
colNameOptions := #(Clientes Subscripciones Contenido ).
options :=Helper createPanel:colNameOptions aLogic:self routes.
Helper addLeftTopMorphic:options in:self.
]

{ #category : #initialization }
Menu >> addSubMenu [
subMenu := SubMenuView  create:self.
subMenu addDependent: self.
self addMorphCentered:subMenu .
subMenu right: self right-5.


]

{ #category : #initialization }
Menu >> addThemes [
changeTheme :=ModalTheme call:self.
self addMorph:changeTheme.

]

{ #category : #initialization }
Menu >> initialize [
|image|
super initialize.
self addPanelOptions.
self addSubMenu.
self addBotons.
self addThemes.
self style.
self logic.
self addFondoAnimado.
"self addCalendar."
"image:=(Form fromFileNamed: 'amazingShop/background.jpg') asMorph.
image basicExtent:self extent.
self addMorphBack: image."
"Inicializar las opciones."

]

{ #category : #initialization }
Menu >> loadCliente [
MenuCliente createMenuClienteIn: subMenu. 
]

{ #category : #initialization }
Menu >> loadContenido [
MenuContenido createMenuContenidoIn:subMenu.
]

{ #category : #initialization }
Menu >> loadPagos [
]

{ #category : #initialization }
Menu >> loadSuscripcion [
MenuSuscripcion  createMenuSuscripcionIn:subMenu.
]

{ #category : #initialization }
Menu >> logic [ 

]

{ #category : #initialization }
Menu >> routes [
	"Inspirate in concept IONIC Framework"
	^ [ :id | 
	  | logicReturn |
	logicReturn :=nil.
	id = 'Clientes' ifTrue: [ logicReturn:=[self update;loadCliente ] ].
	id = 'Subscripciones' ifTrue: [ logicReturn := [self update;loadSuscripcion ] ].
	id = 'Contenido' ifTrue: [ logicReturn :=[self update; loadContenido]].
	id = 'Pagos' ifTrue: [ logicReturn := [self update;loadPagos ]].
	logicReturn
	].
]

{ #category : #initialization }
Menu >> style [
	"self color: Color transparent."
	changeTheme
		center: options center;
		top: options bottom + 10
]

{ #category : #initialization }
Menu >> update [
subMenu update.
self addSubMenu.
]
