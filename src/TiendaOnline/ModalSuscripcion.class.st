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
botonCreate :=Button create: 'Create' size:50@30.

Helper addRightCenterMorph: botonCreate  in:self.

botonCreate mouseAction: [ self addSuscription].
    
]

{ #category : #initialization }
ModalSuscripcion >> addSuscription [
|colection aDiccionary|
colection :=OrderedCollection new.
colection add:(inputNombre text)asString.
colection add:(inputDescuentoAplicacion text).
colection add:(inputDescuentoPelicula text).
colection add:(inputDescuentoLibro text). 
"Update modelo offline"
aDiccionary:=Dictionary newFrom:{'Pelicula'->(inputDescuentoPelicula text).'Aplicacion'->(inputDescuentoAplicacion text).'Libro'->(inputDescuentoLibro text)}.
Control modelFuntion:[:tienda| tienda addSuscription:(Descuento conDescuentos:aDiccionary deNombre:(inputNombre text)asString )].
"update modelo database"
DataBase registerSuscription: colection.
self success.
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

botonCreate right:inputDescuentoPelicula right.
botonCreate bottom:self bottom-10.
botonCreate color:Theme buttom.
botonCreate textColor:Theme buttomText.

"Style border."
Helper border:botonCreate  aColor:botonCreate color.

]

{ #category : #initialization }
ModalSuscripcion >> success [ 
inputDescuentoAplicacion setText:''.
inputDescuentoLibro setText:''.
inputDescuentoPelicula setText:''.
inputNombre setText:''.

]
