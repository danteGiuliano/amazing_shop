Class {
	#name : #Promocion,
	#superclass : #Object,
	#instVars : [
		'descuento',
		'fechaInicio',
		'fechaFin',
		'cantidad',
		'nuevaSuscripcion'
	],
	#category : #'TiendaOnline-Model'
}

{ #category : #'as yet unclassified' }
Promocion class >> crearPromoDescuento:unDescuento fechaInicio:unaFechaInicio fechaFin:unaFechaFin deCantidad:unaCantidad yNuevaSuscripcion:nuevaSuscripcion [
^self new crearPromoDescuento:unDescuento fechaInicio:unaFechaInicio fechaFin:unaFechaFin deCantidad:unaCantidad yNuevaSuscripcion:nuevaSuscripcion.
]

{ #category : #'as yet unclassified' }
Promocion >> crearPromoDescuento:unDescuento fechaInicio:unaFechaInicio fechaFin:unaFechaFin deCantidad:unaCantidad yNuevaSuscripcion:unaNuevaSuscripcion [.
descuento :=unDescuento.
fechaInicio:=unaFechaInicio.
fechaFin :=unaFechaFin.
cantidad :=unaCantidad.
nuevaSuscripcion :=unaNuevaSuscripcion.
]
