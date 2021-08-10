Class {
	#name : #ModalSuscripcion,
	#superclass : #BorderedMorph,
	#instVars : [
		'inputNombre',
		'inputDescuentoLibro',
		'inputDescuentoAplicacion',
		'inputDescuentoPelicula',
		'botonCreate',
		'botonExit'
	],
	#category : #'TiendaOnline-components'
}

{ #category : #'ffi-calls' }
ModalSuscripcion class >> call [
^self new .
]

{ #category : #initialization }
ModalSuscripcion >> addButtoms [
botonCreate :=Button create: 'CREAR' size:50@30.

Helper addRightCenterMorph: botonCreate  in:self.

botonCreate mouseAction: [ self addSuscription. {inputDescuentoAplicacion.inputDescuentoLibro.inputDescuentoPelicula.inputNombre}do:[:input|input clear]].
botonCreate addDependent:self.
 
]

{ #category : #initialization }
ModalSuscripcion >> addSuscription [
|colection aDiccionary|
colection :={inputNombre input.inputDescuentoAplicacion input.inputDescuentoLibro input.inputDescuentoPelicula input}.
"Update modelo offline"
aDiccionary:=Dictionary newFrom:{'Pelicula'->(inputDescuentoPelicula input).'Aplicacion'->(inputDescuentoAplicacion input).'Libro'->(inputDescuentoLibro input)}.
Control modelFuntion:[:tienda| tienda addSuscription:(Descuento conDescuentos:aDiccionary deNombre:(inputNombre input))].
"update modelo database"
DataBase registerSuscription: colection.
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
ModalSuscripcion >> changed [ 
self changed:self.
]

{ #category : #initialization }
ModalSuscripcion >> defineMorph [
self extent:300@200.
self color:Theme morph.
Helper border:self aColor: self color.
]

{ #category : #initialization }
ModalSuscripcion >> initialize [
super initialize.
self defineMorph.
self addButtoms.
self addTextBox.
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

botonCreate right:self right-10.
botonCreate bottom:self bottom-10.
botonCreate color:Color transparent.
botonCreate textColor:Theme buttomText.

"Style border."
Helper border:botonCreate  aColor:botonCreate color.
botonCreate textSize:12.

]

{ #category : #initialization }
ModalSuscripcion >> update:aObject [
self changed.
]
