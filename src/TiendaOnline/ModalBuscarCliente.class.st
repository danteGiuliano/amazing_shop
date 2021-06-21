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
ModalBuscarCliente class >> call [
	^self new.
]

{ #category : #initialization }
ModalBuscarCliente >> addButtom [
buttomSearch :=Button create: 'Mostrar' size:120@22.
"addButtom "
Helper addCenterMorph: buttomSearch  in:self.

buttomSearch mouseAction:[self logic].

]

{ #category : #adding }
ModalBuscarCliente >> addTable:aCollection [
| aNamesColumnTable |

aNamesColumnTable:= #('Tipo' 'Inicio' 'Vence')asOrderedCollection.
table := Table create: (SuscripcionComprada elements:(aCollection)) aCollums: aNamesColumnTable  aSize:(380@230).


Helper addCenterMorph: table in:self. 
]

{ #category : #adding }
ModalBuscarCliente >> addTextBox [

inputDNI :=TextBox create: 'Ingrese un DNI' size:240@80 .

self addMorph:inputDNI . 
]

{ #category : #adding }
ModalBuscarCliente >> defineMorph [

self extent:400@300.
self color:(Theme morph).
Helper border:self aColor:self color  rad:3. 
]

{ #category : #initialization }
ModalBuscarCliente >> initialize [
super initialize.
self defineMorph.
self addButtom.
self addTextBox.
self addTable:nil.
self style.
]

{ #category : #adding }
ModalBuscarCliente >> logic [
|aClient|
aClient :=Control modelFuntionReturn:[:h| h getSuscripciones_Compradas:(inputDNI text)asString].
aClient isNotNil ifTrue:[
	table updateData:(SuscripcionComprada elements:(aClient getSuscripciones_Compradas)).
	]
]

{ #category : #adding }
ModalBuscarCliente >> style [

inputDNI top:self top+10.
inputDNI left:self left+5.
buttomSearch top:inputDNI top.
buttomSearch left:inputDNI right+5.
table bottom:self bottom -10.

"Style buttom"
buttomSearch color:(Theme buttom).
buttomSearch textColor:(Theme buttomText).
Helper border: buttomSearch  aColor:buttomSearch color. 
"Style textBox"
table color:Theme morphContrast.
table headerColor:Theme morphContrast.
table headerBorder.
Helper border:table aColor:table color.

]
