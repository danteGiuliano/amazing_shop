Class {
	#name : #Pago,
	#superclass : #Object,
	#instVars : [
		'fechaPago',
		'precio',
		'item',
		'suscripcion'
	],
	#category : #'TiendaOnline-Model'
}

{ #category : #'as yet unclassified' }
Pago class >> crearPago:unPrecio deItem:unItem ySuscripcion:unaSuscripcion [
^self new crearConPrecio:unPrecio deItem:unItem ySuscripcion:unaSuscripcion.
]

{ #category : #'as yet unclassified' }
Pago >> crearConPrecio:unPrecio deItem:unItem ySuscripcion:unaSuscripcion [
precio :=unPrecio.
item:=unItem.
suscripcion:=unaSuscripcion.
fechaPago:=Date today yyyymmdd.
]

{ #category : #'as yet unclassified' }
Pago >> equals:unContenido [
^((item name) = (unContenido )) .
]

{ #category : #'as yet unclassified' }
Pago >> getFecha [
^fechaPago asString.
]

{ #category : #'as yet unclassified' }
Pago >> getSuscripcion [
^suscripcion getTipo.
]
