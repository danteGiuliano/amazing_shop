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
		'model',
		'inputFechaInicio',
		'inputFechaExpira'
	],
	#category : #'TiendaOnline-components'
}

{ #category : #'ffi-calls' }
ModalSuscripcion class >> call:aModel [
|temp|
temp :=self new.
temp initialize:aModel.
temp extent:300@200.
temp color:(Color lightGray alpha:0.50).
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
|aux auxDiccionary block|

block :=[:val| (val text)asString].

auxDiccionary :=Dictionary newFrom:{'Pelicula' ->(block value:inputDescuentoPelicula).'Aplicacion' ->(block value:inputDescuentoAplicacion). 'Libro' ->(block value:inputDescuentoLibro) }.

aux :=Suscripcion conDescuentos:auxDiccionary fechaInicio:(block value:inputFechaInicio) fechaFinal: (block value:inputFechaExpira) deNombre:(block value:inputNombre).
model addSuscription:aux.
DataBase updateSuscriptions: model.
self success.
]

{ #category : #initialization }
ModalSuscripcion >> addTextBox [
inputDescuentoAplicacion :=TextBox create:'Descuento Aplicacion' size:200@30.
inputDescuentoLibro :=TextBox create:'Descuento Libro' size:200@30.
inputDescuentoPelicula :=TextBox create:'Descuento pelicula' size:200@30.
inputNombre :=TextBox create:'Nombre de suscripcion' size:200@30.
inputFechaInicio :=TextBox create:'Fecha de inicio.' size:100@30.
inputFechaExpira :=TextBox create:'Fecha de Fin' size:100@30.

Helper addCenterMorph:inputDescuentoAplicacion   in:self. 
Helper addCenterMorph:inputNombre in:self.
Helper addCenterMorph:inputDescuentoLibro in:self.
Helper addCenterMorph:inputDescuentoPelicula in:self.
Helper addCenterMorph: inputFechaInicio  in: self.
Helper addCenterMorph: inputFechaExpira  in:self. 
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

inputFechaInicio left: borderLeftPadding.
inputFechaInicio top:inputDescuentoPelicula bottom+10.
inputFechaExpira left:inputFechaInicio right+10.
inputFechaExpira top:inputFechaInicio top.

botonExit left:borderLeftPadding +10.
botonExit top:inputFechaInicio  bottom+10.

botonCreate right:inputDescuentoPelicula right.
botonCreate top:botonExit top.

"Style border."
self borderStyle:(RoundedBorder new cornerRadius:5; width:5; color:Color gray).
botonCreate borderStyle:(RoundedBorder new cornerRadius:3; width:3; color:Color lightGreen).
botonExit borderStyle:(RoundedBorder new cornerRadius:3; width:3; color:(Color r:0.3 g:0.3 b:0.3))

]

{ #category : #initialization }
ModalSuscripcion >> success [ 
inputDescuentoAplicacion setText:''.
inputDescuentoLibro setText:''.
inputDescuentoPelicula setText:''.
inputNombre setText:''.
inputFechaInicio setText:''.
inputFechaExpira setText:''.
]
