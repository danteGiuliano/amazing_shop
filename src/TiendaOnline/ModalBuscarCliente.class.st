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
|temp|
temp :=self new.
temp openCenteredInWorld.


]

{ #category : #initialization }
ModalBuscarCliente >> addButtom [
|buttomExit|
buttomSearch :=Button create: 'Mostrar' size:120@22.
buttomExit :=Button create:'X' size:30@30.
"Style exit"
buttomExit color:(Color transparent).
buttomExit borderColor:(Color transparent).
"addButtom "
Helper addCenterMorph: buttomSearch  in:self.
Helper addRightTopMorph: buttomExit  in:self. 

buttomSearch mouseAction:[self logic].
buttomExit mouseAction:[self delete.]
  
]

{ #category : #adding }
ModalBuscarCliente >> addTable:aCollection [
| aNamesColumnTable |

aNamesColumnTable:= #('Tipo' 'Inicio' 'Vencimiento')asOrderedCollection.
table := Table create: (SuscripcionComprada elements:(aCollection)) aCollums: aNamesColumnTable  aSize:(380@230).


Helper addCenterMorph: table in:self. 
]

{ #category : #adding }
ModalBuscarCliente >> addTextBox [

inputDNI :=TextBox create: 'Ingrese un DNI' size:120@80 .

Helper addCenterTopMorph: inputDNI in:self. 
]

{ #category : #adding }
ModalBuscarCliente >> defineMorph [

self extent:400@300.
self color:(Color black alpha:0.80).
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
	self addTable:aClient getSuscripciones_Compradas.
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
buttomSearch color:(Color veryDarkGray alpha:0.85).
Helper border: buttomSearch  aColor:buttomSearch color  rad:3. 
"Style textBox"
Helper border: inputDNI  aColor: inputDNI color  rad:3.

]
