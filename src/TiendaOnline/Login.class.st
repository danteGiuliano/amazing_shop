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
|query|
query :=DataBase autenticationName:(inputUser text)asString aPassWord:(inputPassword text)asString.
query isError ifTrue:[
		"un error de consulta"
	]ifFalse:[
	|rows|
	rows :=query rows.
	rows isEmpty ifFalse:[Control userSession:(rows at:1)columns. Menu create.]ifTrue:[
		"Error de usuario no encontrado "
		]
	]

]

{ #category : #'as yet unclassified' }
Login >> initializeButtons [ 
|close login create |
close := Button create:'close'. 
login := Button create:'login ' size:(40@30). 
create := Button create:'create shop' size:(130@40). 

self addMorphCentered: login.
self addMorphCentered: create.
Helper addRightTopMorph: close in:self. 

"Posiciono los botones en la ventana."
"I position the buttons of the entrance"

login top:create bottom+30.

Helper border: close aColor:(Color green alpha:0.40) rad:2. 
Helper border: create  aColor:Color gray rad:3.
Helper border:login aColor:(Color red alpha:0.40) rad:2. 

"Añado funciones a los bottones."
close mouseAction: [close close:self].
create mouseAction: [ModalTienda call].
login mouseAction:[self autentication].







]

{ #category : #'as yet unclassified' }
Login >> initializeShop [
super initialize.
self style.
self initializeButtons.
self initializeTextBoxs.
self openInHand.

]

{ #category : #initialization }
Login >> initializeTextBoxs [
inputUser  := TextBox create:'Ingrese su nombre de usuario' size:200@60.
inputPassword := TextBox create: 'Ingrese su password' size:200@60 .

"Centrado de textos."
self addMorphCentered: inputUser.
self addMorphCentered: inputPassword.

inputUser top:self top+220.
inputPassword top:inputUser bottom+20.

Helper border: inputPassword  aColor:(Color red alpha:0.30) rad:2.
Helper border:inputUser aColor:(Color red alpha:0.30) rad:2. 
]

{ #category : #initialization }
Login >> style [ 
"|image|"
"image:=(ZnEasy getPng:'https://raw.githubusercontent.com/danteGiuliano/amazing_shop/stable/src/resourses/login.png')asMorph."
"image scale:0.50."
self  extent:(360@640).
"image borderStyle: (RoundedBorder new cornerRadius:5; width:5; color:Color gray)."
"self addMorphCentered:image."
"Traer recursos Https de repostorio "
"self addMorphCentered:("
"self borderStyle:(RoundedBorder new cornerRadius:5; width:5; color:Color gray)."

]
