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
^temp 
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
createShop:=Button create:'CREAR SHOP' size:200@40.
exit :=Button create:'<<<' size:30@30.
exit textColor:Color white.

Helper addCenterMorph: createShop  in:self. 
Helper addCenterMorph: exit in:self.

exit top:self top+5.
exit left:self left+5.

exit borderColor:(Color transparent).
exit color:(Color transparent).

createShop color:(Color transparent).
createShop textSize:20.
createShop textColor:(Color green).
Helper border:createShop  aColor:createShop textColor  rad:3. 

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
textUser  top:self top+250.
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
self style


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
self borderStyle: (ComplexBorder width: 3 color: self color).
createShop top:textName  bottom+100

]
