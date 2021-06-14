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
ModalCliente class >> call [
^self new.
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
inputDni styleWeb.
inputEMail styleWeb.
inputNombre styleWeb.

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
|b1 |
b1 :=Button create:'Registrar' size:120@30.
Helper addRightbottomMorph: b1 in:self.

b1 center: self center.
b1 bottom: self bottom -10.
"style"
b1 color:Theme buttom.
b1 textColor:Theme buttomText.
Helper border: b1 aColor:b1 color. 
"Logic"
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
t1 color:(Theme text).
t2 color:(Theme text).
t3 color:(Theme text).

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
self style.
self addButtoms.
self addBox:self addTexts.

]

{ #category : #initialization }
ModalCliente >> registerClient [
|client colection nombre dni email temp|
nombre :=(inputNombre text)asString .
dni :=(inputDni text)asString.
email :=(inputEMail text)asString.

client:=Cliente crearCLiente:nombre unDni:dni unEmail:email.
	temp :=Control getModel.
	temp addClient:client.
	Control aModelInstance: temp.
"Data base -------------"
colection :=OrderedCollection new.
colection add:dni;add:nombre;add:email;add:Control userKey.
DataBase registerClient: colection.

inputDni setText:''.
inputEMail setText:''.
inputNombre setText:''.

]

{ #category : #initialization }
ModalCliente >> style [ 
self extent:300@150.
self color:Theme morph.
Helper border: self aColor:self color.

]
