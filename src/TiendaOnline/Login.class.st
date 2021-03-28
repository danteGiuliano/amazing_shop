"
Class interface pre-aplation.
"
Class {
	#name : #Login,
	#superclass : #BorderedMorph,
	#instVars : [
		'name',
		'resources',
		'model',
		'inputUser',
		'inputPassword',
		'directory'
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

{ #category : #initialization }
Login >> autentication [
directory:=(DataBase login:(inputUser text)asString password:(inputPassword text)asString).
directory ifNil:[|temp|temp:=Button create:'ERROR DE LOGIN' size:100@30.temp color:Color red.temp mouseAction:[temp delete].
	temp openInHand ]ifNotNil:[directory := directory getRoute.self createShop.].

]

{ #category : #'as yet unclassified' }
Login >> createShop [
DataBase  createShop: directory.







]

{ #category : #'as yet unclassified' }
Login >> initializeButtons [ 
|close login create temp|
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
create mouseAction: [ModalTienda call:1].
login mouseAction:[self autentication].







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
inputUser  := TextBox new.
inputPassword := TextBox new.

inputUser extent: 200@30.
inputPassword extent: 200@30.

"Centrado de textos."
self addMorphCentered: inputUser.
self addMorphCentered: inputPassword.

inputUser bottom:400.
inputPassword bottom:430.
]
