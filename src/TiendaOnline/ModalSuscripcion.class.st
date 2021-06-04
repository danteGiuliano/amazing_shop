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
|temp|
temp :=self new.
temp extent:300@200.
temp initialize.
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
ModalSuscripcion >> initialize [
super initialize.
self extent:300@200.
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

botonExit left:borderLeftPadding +20.
botonExit bottom:self bottom-10.

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

]
