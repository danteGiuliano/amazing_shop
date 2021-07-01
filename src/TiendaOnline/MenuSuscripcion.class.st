Class {
	#name : #MenuSuscripcion,
	#superclass : #SubMenuView,
	#instVars : [
		'subMenu',
		'addSuscription',
		'promocion',
		'tablePromocion',
		'tableSuscripcion'
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
MenuSuscripcion >> addPromocion [
promocion:=ComponenetPromocion new.
subMenu addMorph:promocion.
 
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
self loadTableSuscripcions.
self loadTablePromociones.
self addPromocion.
self style.

]

{ #category : #initialization }
MenuSuscripcion >> loadTablePromociones [
| aNamesColumnTable |
aNamesColumnTable:= #( 'Suscripcion' 'Cantidad Articulos' 'Nueva suscripcion' 'Descuento Promocion' ' meses')asOrderedCollection.
tablePromocion := Table create: (Descuento elements:(nil)) aCollums: aNamesColumnTable  aSize:(800@200).
"Style"
Helper addCenterMorph: tablePromocion in:subMenu.
Helper border: tablePromocion aColor:tablePromocion color.
tablePromocion headerBorder:0.95. 
]

{ #category : #initialization }
MenuSuscripcion >> loadTableSuscripcions [
| aNamesColumnTable temp|
temp  :=Control modelFuntionReturn:[:tienda| tienda getSuscripciones].
aNamesColumnTable:= #( 'Nombre' 'Descuento Libro' 'Descuento Pelicula' 'Descuento Aplicacion')asOrderedCollection.
tableSuscripcion := Table create: (Descuento elements:(temp)) aCollums: aNamesColumnTable  aSize:(800@200).
"Style"
Helper addCenterMorph: tableSuscripcion in:subMenu.
Helper border: tableSuscripcion aColor: tableSuscripcion color.
tableSuscripcion headerBorder:0.95. 
]

{ #category : #initialization }
MenuSuscripcion >> style [ 
addSuscription left:subMenu left+10;top:subMenu top.
tableSuscripcion left:addSuscription right +10;top:subMenu  top.
promocion top:addSuscription bottom+10;left:addSuscription left.
tablePromocion top:promocion top;left:promocion right+10. 
]
