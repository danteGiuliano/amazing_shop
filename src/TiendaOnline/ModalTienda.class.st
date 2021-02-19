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
		'model'
	],
	#category : #'TiendaOnline-components'
}

{ #category : #'ffi-calls' }
ModalTienda class >> call:aModel [
|temp|
temp:=self new.
temp initialize: aModel.
temp openCenteredInWorld .
]

{ #category : #adding }
ModalTienda >> addBox [
inputName :=TextBox new.
inputUser:=TextBox new.
inputPassword :=TextBox new.
inputName  extent: 160@30.
inputPassword  extent: 160@30.
inputUser extent: 160@30.
"add"
Helper addRightTopMorph: inputName  in:self.
Helper addRightTopMorph: inputPassword  in:self. 
Helper addRightTopMorph: inputUser  in:self.

inputUser left:textName right+40.
inputPassword left:textName right+40.
inputName left:textName right+40.

inputUser top: textUser top.
inputPassword  top:textPass top.
inputName  top: textName top.

]

{ #category : #adding }
ModalTienda >> addButtons [
|exit createShop|
createShop:=Button create: 'Create SHOP' size:80@30.
exit :=Button create:'EXIT' size:60@30.

Helper addCenterMorph: createShop  in:self. 
Helper addCenterMorph: exit in:self.

createShop  top:inputName bottom+10.
exit top:createShop bottom+10.

exit color:Color red.

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
textUser  top:self top+20.
textPass  top:textUser  bottom+20.
textName  top:textPass bottom+20.
]

{ #category : #adding }
ModalTienda >> initialize:aModel [
super initialize.
model:=aModel.
self extent:300@200.
self color:Color gray.
self addText.
self addBox.
self addButtons.


]

{ #category : #adding }
ModalTienda >> registerShop [
DataBase registerShop:'amazingShop/',((inputName text)asString),'/' aNameUser:(inputUser text)asString aPassword:(inputPassword text)asString.
inputName setText:''.
inputPassword setText:''.
inputUser setText:''.

]
