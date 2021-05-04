Class {
	#name : #ModalBuscarCliente,
	#superclass : #BorderedMorph,
	#instVars : [
		'inputDNI',
		'buttomSearch',
		'table',
		'model'
	],
	#category : #'TiendaOnline-components'
}

{ #category : #'ffi-calls' }
ModalBuscarCliente class >> call:aModel [
|temp|
temp :=self new.
temp extent:300@300.
temp color:Color gray.
temp openCenteredInWorld.
temp initialize:aModel.


]

{ #category : #initialization }
ModalBuscarCliente >> addButtom [
|buttomExit|.
buttomSearch :=Button create: 'Buscar suscripciones' size:120@30.
buttomExit :=Button create:'EXIT' size:30@30.
"addButtom "
Helper addCenterMorph: buttomSearch  in:self.
Helper addRightTopMorph: buttomExit  in:self. 
buttomSearch mouseAction:[].
buttomExit mouseAction:[self delete.]
  
]

{ #category : #adding }
ModalBuscarCliente >> addTable [
| aNamesColumnTable |

aNamesColumnTable:= #('Tipo' ' Inicio' ' Vencimiento')asOrderedCollection.
table := Table create: (Cliente elements:(nil)) aCollums: aNamesColumnTable  aSize:(280@220).


Helper addCenterMorph: table in:self. 
]

{ #category : #adding }
ModalBuscarCliente >> addTextBox [

inputDNI :=TextBox create: 'Ingrese un DNI' size:120@60 .

Helper addCenterTopMorph: inputDNI in:self. 
]

{ #category : #initialization }
ModalBuscarCliente >> initialize:aModel [
model:=aModel.
self addButtom.
self addTextBox.
self addTable.
self style.
]

{ #category : #adding }
ModalBuscarCliente >> style [

inputDNI top:self top+10.
buttomSearch top:inputDNI bottom+10.
table top:buttomSearch bottom +5.
]
