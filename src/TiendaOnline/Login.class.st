"
Class interface pre-aplation.
"
Class {
	#name : #Login,
	#superclass : #FullscreenMorph,
	#instVars : [
		'login',
		'create',
		'inputUser',
		'inputPassword',
		'fonde'
	],
	#category : #'TiendaOnline-View'
}

{ #category : #initialization }
Login class >> create [ 
^self new openCenteredInWorld.
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
Login >> defineMorph [
self color:Color black. 
]

{ #category : #'as yet unclassified' }
Login >> fonde [
fonde :=Morph new extent:30@30.
fonde height:self height.
fonde width: (self width)/1.2.
self addMorph:fonde.
fonde center: self center.
fonde right:self right.
fonde color:Color white.
"Gif"
Helper addCenterMorph:(MorphGIF gifFromString:'inicio2.gif') in:fonde.


]

{ #category : #'as yet unclassified' }
Login >> initialize [
super initialize.
self defineMorph.
self fonde.
self initializeButtons.
self initializeTextBoxs.
self openInHand.

]

{ #category : #'as yet unclassified' }
Login >> initializeButtons [ 
|close|
close := Button create:'CERRAR' size:60@30. 
login := Button create:'LOGIN' size:(40@30). 
create := Button create:'CREAR SHOP' size:(130@40).

login color:Color transparent;borderColor:Color transparent.
create color:Color transparent;borderColor:Color transparent.


create font:StandardFonts codeFont.
login font:StandardFonts codeFont.

login textColor:Color white.
create textColor:Color white.


self addMorphCentered: login.
self addMorphCentered: create.

Helper addLeftBottomMorph: close in:self. 
close left:self left+10.
close bottom:self bottom-10.
close color:Color transparent;borderColor:Color transparent.
close textColor:Color white.

create left:self left+50.
login center: create center.
login top:create bottom+30.

"Añado funciones a los bottones."
close mouseAction: [close close:self].
create mouseAction: [|mod|mod:=(ModalTienda call).mod height:self height.mod left:fonde left.self addMorph:mod].
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

inputPassword center:create center.
inputUser center:create center.

inputPassword bottom:create top-10.
inputUser bottom:inputPassword top-10.

inputPassword styleWeb;borderColor:Color white.
inputUser styleWeb;borderColor:Color white.

]
