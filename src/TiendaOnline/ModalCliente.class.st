Class {
	#name : #ModalCliente,
	#superclass : #BorderedMorph,
	#instVars : [
		'inputNombre',
		'inputDni',
		'inputEMail',
		'model'
	],
	#category : #'TiendaOnline-components'
}

{ #category : #'as yet unclassified' }
ModalCliente class >> call:aModel [
|temp|
temp:=self new.
temp setModel: aModel.
temp openCenteredInWorld .

]

{ #category : #initialization }
ModalCliente >> addBox:aText1 [
| position|.
position :=aText1 right+10.
inputNombre:= TextBox new.
inputDni:= TextBox new.
inputEMail := TextBox new.
inputNombre  extent:150@30.
inputDni  extent:150@30.
inputEMail  extent:150@30.

Helper addLeftTopMorphic:inputNombre  in:self .
Helper addRightCenterMorph: inputEMail  in:self.
Helper addRightCenterMorph: inputDni  in:self.

inputNombre  top:self top+10.
inputDni  top:inputNombre bottom +10.
inputEMail  top: inputDni  bottom+10.

inputNombre  left: position .
inputEMail  left: position .
inputDni left: position .



]

{ #category : #initialization }
ModalCliente >> addButtoms [
|b1 b2|
b1 :=Button create:'Registrar' size:60@20.
b2 :=Button create:'Salir' size:40@20.
Helper addLeftBottomMorph: b2 in:self.
Helper addRightbottomMorph: b1 in:self.
b1 right: self right -10.
b2 left: self left +10.
b1 bottom: self bottom -10.
b2 bottom: self bottom -10.  

"Logic"

b2 mouseAction:[self delete].
b1 mouseAction:[self registerClient.].


]

{ #category : #initialization }
ModalCliente >> addTexts [
|t1 t2 t3|
t1 :=StringMorph contents:'ingrese el nombre'.
t2:=StringMorph contents:'ingrese el DNI'.
t3:=StringMorph contents:'ingrese el Email'.
"Position"
Helper addLeftTopMorphic: t1 in:self.
Helper addLeftCenterMorph: t2 in:self.
Helper addLeftCenterMorph: t3 in:self.

t1 left:self left +10.
t1 top:self top +10.
t2 left:self left +10.
t3 left:self left +10.
t2 top:t1 bottom +15.
t3 top:t2 bottom +15.
^t1.
]

{ #category : #initialization }
ModalCliente >> getModel [ 
^model.
]

{ #category : #initialization }
ModalCliente >> initialize [ 
super initialize.
self extent:300@200.
self color:Color gray.
self addButtoms.
self addBox:self addTexts.

]

{ #category : #initialization }
ModalCliente >> registerClient [
|client|
client:=Cliente crearCLiente: (inputNombre text)asString  unDni:(inputDni text)asString  unEmail:(inputEMail text)asString. 
model addClient:client.
inputNombre setText:''.
inputDni setText:''.
inputEMail setText:''.
DataBase updateClients: model.

]

{ #category : #initialization }
ModalCliente >> setModel:aModel [.
model:=aModel.
]