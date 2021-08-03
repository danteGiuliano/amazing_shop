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
		'menuSuscripcion',
		'menuCliente',
		'menuContenido',
		'exit',
		'options',
		'changeTheme',
		'suspension',
		'fonde'
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
exit := Button create:'CERRAR' size:100@30.
suspension :=Button create:'SUSPENSION' size:100@30.
self addMorphCentered: exit.
self addMorphCentered:suspension.
suspension mouseAction:[subMenu update.self addFondoAnimado.].
exit mouseAction:[exit close:self].

exit center:menuCliente center;bottom:self bottom-10.
suspension left:exit left;bottom:exit top-5.
suspension color:Color transparent;textColor:Color white.
Helper border:suspension  aColor:Color white rad:3.
exit color:Color transparent;textColor:Color white.
Helper border:exit  aColor:Color white rad:3.

]

{ #category : #initialization }
Menu >> addFondoAnimado [
fonde :=MorphGIF gifFromString:'recursos/fondo.gif'.
fonde fullBounds.
self addMorph:fonde.
fonde center:self center.


]

{ #category : #initialization }
Menu >> addPanelOptions [
menuSuscripcion :=CircleButton new extent:128@128.
menuCliente :=CircleButton new extent:128@128.
menuContenido :=CircleButton new extent:128@128.

menuSuscripcion icon:(Icon stringRoute:'recursos/suscripcion.png').
menuCliente icon:(Icon stringRoute:'recursos/cliente.png').
menuContenido icon:(Icon stringRoute:'recursos/contenido-pagado.png').
menuSuscripcion color:Theme morph.
menuCliente  color:Theme morph.
menuContenido color:Theme morph.

Helper border:menuCliente  aColor:(Color white)  rad:7. 
Helper border:menuContenido   aColor:(Color white)  rad:7. 
Helper border:menuSuscripcion   aColor:(Color white)  rad:7. 
 
menuSuscripcion mouseAction:[self loadSuscripcion.].
menuCliente mouseAction:[self loadCliente.].
menuContenido mouseAction:[self loadContenido.].
self addMorph:menuSuscripcion;addMorph:menuCliente;addMorph:menuContenido.

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
self addThemes.
self addBotons.
self style.
self logic.
"self addCalendar."
"image:=(Form fromFileNamed: 'amazingShop/background.jpg') asMorph.
image basicExtent:self extent.
self addMorphBack: image."
"Inicializar las opciones."

]

{ #category : #initialization }
Menu >> loadCliente [
self update.
MenuCliente createMenuClienteIn: subMenu. 
]

{ #category : #initialization }
Menu >> loadContenido [
self update.
MenuContenido createMenuContenidoIn:subMenu.
]

{ #category : #initialization }
Menu >> loadSuscripcion [
self update.
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
	self color: Color black.
	menuCliente left:self left+10;top:self top+10.
	menuContenido center:menuCliente center;top:menuCliente bottom+10.
	menuSuscripcion center:menuCliente center;top:menuContenido bottom+10.
	changeTheme center:menuCliente  center;top:menuSuscripcion  bottom+20.
]

{ #category : #initialization }
Menu >> update [
fonde isNotNil ifTrue:[fonde delete].
subMenu update.
self addSubMenu.
]
