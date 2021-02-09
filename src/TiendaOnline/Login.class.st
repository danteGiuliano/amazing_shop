"
Class interface pre-aplation.
"
Class {
	#name : #Login,
	#superclass : #BorderedMorph,
	#instVars : [
		'name',
		'resources',
		'control'
	],
	#category : #'TiendaOnline-View'
}

{ #category : #initialization }
Login class >> create [
| a |
a := self new.
a initializeShop.
^a
]

{ #category : #'as yet unclassified' }
Login >> createShop [
"Acciones para crear un shop. logica y demas"

(Menu create)openInWorld.







]

{ #category : #'as yet unclassified' }
Login >> initializeButtons [ 
|close login create|

close := Button create:'close'. 
login := Button create:'login ' size:(40@30). 
create := Button create:'create shop' size:(130@40). 

self addMorphCentered: close.
self addMorphCentered: login.
self addMorphCentered: create.

"Posiciono los botones en la ventana."
"I position the buttons of the entrance"
close bottom:25.
close right: 360.
login bottom:480.

"Añado funciones a los bottones."
close mouseAction: [close close:self].
create mouseAction: [Menu create].







]

{ #category : #'as yet unclassified' }
Login >> initializeShop [
super initialize.
Control new.
self  extent:(360@640).
"Traer recursos Https de repostorio "
self addMorphCentered:(ZnEasy getPng:'https://raw.githubusercontent.com/danteGiuliano/amazing_shop/master/src/resourses/login.png')asMorph .
self initializeButtons.
self initializeTextBoxs.
self openInHand.

]

{ #category : #initialization }
Login >> initializeTextBoxs [
|user password|
user := TextBox new.
password := TextBox new.

user extent: 200@30.
password extent: 200@30.

"Centrado de textos."
self addMorphCentered: user.
self addMorphCentered: password.

user bottom:400.
password bottom:430.
]
