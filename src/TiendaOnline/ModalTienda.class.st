Class {
	#name : #ModalTienda,
	#superclass : #BorderedMorph,
	#instVars : [
		'inputUser',
		'inputPassword',
		'inputName',
		'textUser',
		'textPass',
		'textName',
		'createShop'
	],
	#category : #'TiendaOnline-components'
}

{ #category : #'ffi-calls' }
ModalTienda class >> call [
|temp|
temp:=self new.
temp initialize.
temp openCenteredInWorld .
]

{ #category : #adding }
ModalTienda >> addBox [
inputName :=TextBox create:'Nombre de tienda' size:160@30 .
inputUser:=TextBox create:'Usuario administrador' size:160@30.
inputPassword :=TextBox create:'Contraseña administrador' size:160@30.
"add"
Helper addRightTopMorph: inputName  in:self.
Helper addRightTopMorph: inputPassword  in:self. 
Helper addRightTopMorph: inputUser  in:self.

Helper border: inputName  aColor:Color gray  rad:2. 
Helper border: inputPassword  aColor:Color gray  rad:2.
Helper border: inputUser  aColor: Color gray rad:2.
  
inputUser left:textName right+40.
inputPassword left:textName right+40.
inputName left:textName right+40.

inputUser top: textUser top.
inputPassword  top:textPass top.
inputName  top: textName top.
]

{ #category : #adding }
ModalTienda >> addButtons [
|exit|
createShop:=Button create:'Create SHOP' size:80@30.
exit :=Button create:'X' size:30@30.

Helper addCenterMorph: createShop  in:self. 
Helper addCenterMorph: exit in:self.

exit top:self top+5.
exit left:self left+5.
createShop  bottom:self bottom-15.

exit borderColor:(Color transparent).
exit color:(Color transparent).

createShop color:(Color transparent).
createShop borderColor:(Color transparent).
createShop textColor:(Color green).

"Logic"
exit mouseAction:[self delete.].
createShop mouseAction:[self registerShop].
]

{ #category : #adding }
ModalTienda >> addText [
textUser  :=StringMorph contents:'User name'.
textPass  :=StringMorph contents:'Password User'. 
textName  :=StringMorph contents:'Name Shop'. 

Helper addRightTopMorph: textUser  in:self. 
Helper addRightTopMorph: textPass  in:self.
Helper addRightTopMorph: textName  in:self.

textUser  left:self left+10.
textPass  left:self left+10.
textName  left:self left+10.
textUser  top:self top+40.
textPass  top:textUser  bottom+20.
textName  top:textPass bottom+20.
]

{ #category : #adding }
ModalTienda >> initialize [
super initialize.
self extent:300@200.
self addButtons.
self color:(Color veryDarkGray alpha:0.85).
self addText.
self addBox.
self style.


]

{ #category : #adding }
ModalTienda >> registerShop [
|collection |
collection :=OrderedCollection new.
collection add:(inputUser text)asString. "Usuario"
collection add:(inputPassword text)asString. "Password"
collection add:(inputName text)asString. "nombre tienda"

(DataBase registerShop:(collection)) isError ifTrue:[
	createShop textColor:(Color red) .
	] ifFalse:[
	self delete.	
	].

]

{ #category : #adding }
ModalTienda >> style [ 
Helper border:self aColor:(Color veryDarkGray alpha:0.85). 

]
