Class {
	#name : #ModalSuscripcion,
	#superclass : #BorderedMorph,
	#instVars : [
		'inputNombre',
		'inputDescuentoLibro',
		'inputDescuentoAplicacion',
		'inputDescuentoPelicula',
		'botonCreate',
		'botonExit',
		'model'
	],
	#category : #'TiendaOnline-components'
}

{ #category : #'ffi-calls' }
ModalSuscripcion class >> call:aModel [
|temp|
temp :=self new.
temp initialize:aModel.
temp extent:300@200.
temp color:(Color lightGray alpha:0.85).
temp openCenteredInWorld.
]

{ #category : #initialization }
ModalSuscripcion >> addButtoms [
botonExit :=Button create: 'EXIT' size:40@30.
botonCreate :=Button create: 'Create' size:50@30.

Helper addRightCenterMorph: botonCreate  in:self.
Helper addLeftBottomMorph: botonExit   in:self.

botonExit mouseAction:[self delete.].
botonCreate mouseAction: [ self addSuscription].
    
]

{ #category : #initialization }
ModalSuscripcion >> addSuscription [




]

{ #category : #initialization }
ModalSuscripcion >> addTextBox [
inputDescuentoAplicacion :=TextBox create:'Descuento Aplicacion' size:200@30.
inputDescuentoLibro :=TextBox create:'Descuento Libro' size:200@30.
inputDescuentoPelicula :=TextBox create:'Descuento pelicula' size:200@30.
inputNombre :=TextBox create:'Nombre de suscripcion' size:200@30.


Helper addCenterMorph:inputDescuentoAplicacion   in:self. 
Helper addCenterMorph:inputNombre in:self.
Helper addCenterMorph:inputDescuentoLibro in:self.
Helper addCenterMorph:inputDescuentoPelicula in:self.

]

{ #category : #initialization }
ModalSuscripcion >> initialize:aModel [
model :=aModel.
self addTextBox.
self addButtoms.
self style.
]

{ #category : #initialization }
ModalSuscripcion >> style [
|borderLeftPadding borderTopPadding|
borderLeftPadding  :=self left+10.
borderTopPadding :=self top +10.

inputNombre left:borderLeftPadding. 
inputNombre top:borderTopPadding.

inputDescuentoAplicacion left:borderLeftPadding.
inputDescuentoAplicacion top:inputNombre bottom+10.

inputDescuentoLibro left:borderLeftPadding.
inputDescuentoLibro  top:inputDescuentoAplicacion bottom+10.

inputDescuentoPelicula left:borderLeftPadding.
inputDescuentoPelicula top:inputDescuentoLibro bottom+10.

botonExit left:borderLeftPadding +10.
botonExit top:inputDescuentoPelicula bottom+10.

botonCreate right:inputDescuentoPelicula right.
botonCreate top:botonExit top.




]
