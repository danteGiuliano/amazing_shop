Class {
	#name : #Login,
	#superclass : #BorderedMorph,
	#instVars : [
		'name',
		'resources'
	],
	#category : #TiendaOnline
}

{ #category : #initialization }
Login class >> create [
| a |
a := self new.
a initializeShop.
^a
]

{ #category : #'as yet unclassified' }
Login >> initializeButtons [ 
|close login create|

close := Button create:'close'. 
login := Button create:'login '. 
create := Button create:'create shop'. 
create extent: (130@40).
login extent:(40@30). 

self addMorphCentered: close.
self addMorphCentered: login.
self addMorphCentered: create.

"Posiciono los botones en la ventana."
"I position the buttons of the entrance"
close bottom:25.
close right: 360.
login bottom:480.







]

{ #category : #'as yet unclassified' }
Login >> initializeShop [
super initialize.
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
