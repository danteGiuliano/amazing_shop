Class {
	#name : #ComponenetPromocion,
	#superclass : #BorderedMorph,
	#instVars : [
		'inputSuscripcion',
		'cantidad',
		'inputOtraSuscripcion',
		'descuento',
		'cantidadMeses',
		'aplicar'
	],
	#category : #'TiendaOnline-components'
}

{ #category : #initialization }
ComponenetPromocion >> addButtom [
aplicar :=Button create:'APLICAR' size:60@30. 
self addMorph:aplicar.
aplicar color:Color transparent;borderColor:Color transparent.
]

{ #category : #adding }
ComponenetPromocion >> addInputs [
inputSuscripcion :=TextBox create:'Suscripcion' size: 200@30.
cantidad :=TextBox create:'Cantidad Articulos' size:200@30.
inputOtraSuscripcion :=TextBox create:'Otra suscripcipon' size:200@30.
descuento :=TextBox create:'Descuento promo' size:200@30.
cantidadMeses :=TextBox create:'Cantidad meses' size:200@30.

self addMorph:inputSuscripcion;addMorph:cantidad;addMorph:inputOtraSuscripcion;addMorph:descuento
;addMorph:cantidadMeses
]

{ #category : #initialization }
ComponenetPromocion >> defineMorph [
self extent:300@350.
self color:Theme morph.
Helper border:self aColor:self color  rad:8. 
]

{ #category : #initialization }
ComponenetPromocion >> initialize [ 
super initialize.
self defineMorph.
self addInputs.
self addButtom.
self style.
]

{ #category : #initialization }
ComponenetPromocion >> style [
inputSuscripcion top:self top+20;left:self left+15.
cantidad top:inputSuscripcion bottom+20;left:inputSuscripcion left.
inputOtraSuscripcion top:cantidad bottom+40;left: cantidad left.
descuento top:inputOtraSuscripcion bottom+20;left:inputOtraSuscripcion left.
cantidadMeses top:descuento bottom+20;left:descuento left.
aplicar right:self right -10;bottom:self bottom-10.
]
