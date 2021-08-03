Class {
	#name : #'ModalAñadirSuscripcion',
	#superclass : #BorderedMorph,
	#instVars : [
		'inputDNI',
		'addSuscription',
		'search',
		'textBox',
		'model',
		'instanceClient'
	],
	#category : #'TiendaOnline-components'
}

{ #category : #'as yet unclassified' }
ModalAñadirSuscripcion class >> call [
^self new.

]

{ #category : #'as yet unclassified' }
ModalAñadirSuscripcion class >> call:aModel [
	|temp|.
temp :=self new.
temp initialize:aModel.
temp openCenteredInWorld.

]

{ #category : #initialization }
ModalAñadirSuscripcion >> addBottoms [ 
addSuscription :=Button create: 'Anadir Suscripcion' size:120@30.
search :=Button create:'BUSCAR' size:70@20.

addSuscription color:(Theme buttom);textColor:(Theme buttomText). 
search color:(Theme buttom);textColor:(Theme buttomText).

Helper border: search  aColor:search color  rad:2. 
Helper border: addSuscription   aColor: addSuscription color rad:3.

Helper addRightTopMorph: search  in:self.
Helper addCenterMorph: addSuscription  in:self.  
 
]

{ #category : #initialization }
ModalAñadirSuscripcion >> addInputText [
inputDNI :=TextBox create: 'Ingrese DNI' size:200@30.
Helper addCenterMorph: inputDNI  in:self.
  
]

{ #category : #initialization }
ModalAñadirSuscripcion >> addTextBox [
textBox :=RubScrolledTextMorph new.
textBox extent:280@200.
textBox color:(Theme morphContrast ).

Helper border: textBox  aColor:textBox color. 
Helper addCenterMorph: textBox  in:self.

"No write"
textBox setText:'informacion de cliente'.
textBox beReadOnly.
]

{ #category : #initialization }
ModalAñadirSuscripcion >> defineMorph [
self extent:300@300.
self color:(Theme morph).
]

{ #category : #initialization }
ModalAñadirSuscripcion >> initialize [
super initialize.
self defineMorph.
self addInputText.
self addTextBox.
self addBottoms.
self style.
self logic.

]

{ #category : #initialization }
ModalAñadirSuscripcion >> logic [
search mouseAction:[
	self updateTextBox:(Control modelFuntionReturn:[:h| h searchDNI:(inputDNI text)asString])].
addSuscription mouseAction:[self updateAddSuscripcion.]
]

{ #category : #initialization }
ModalAñadirSuscripcion >> style [
"Boton search"
search right:self right -10.
search top:self top+10.
"input addDni"
inputDNI bottom:search bottom.
inputDNI right:search left-5.
"Text box"
textBox left: self top+10.
"Boton add suscription"
addSuscription top:textBox bottom+5.
Helper border:self aColor:self color.
]

{ #category : #initialization }
ModalAñadirSuscripcion >> updateAddSuscripcion [
instanceClient ifNotNil:[
	|selection suscriptions names suscription aColection suscriptionBuy|
	aColection :=OrderedCollection new.
	suscriptions :=Control modelFuntionReturn:[:h| h getSuscripciones. ].
	names :=suscriptions collect:[:aSuscription|aSuscription getNombre].
	selection:=PopupChoiceDialogWindow chooseFrom:names lines:#() title:'Suscripciones'.
	suscription:=suscriptions detect:[:aSuscription|aSuscription equals:selection].
	
	aColection add:selection.
	aColection add:(instanceClient getDni)asString.
	
	suscriptionBuy :=SuscripcionComprada crearSuscripcion:suscription.
	"Realiza un control de que el cliente no la tiene antes de agregar dante"
	Control modelFuntion:[:h | h añadirSuscripcionComprada:suscriptionBuy aCliente:instanceClient].
	DataBase registerSuscripcion_Comprada: aColection.
	
]
]

{ #category : #initialization }
ModalAñadirSuscripcion >> updateTextBox:aClient [
aClient ifNil:[textBox setText:'Usuario no encontrado'.addSuscription textColor:(Color gray).
	instanceClient :=nil.
	]ifNotNil:[
	textBox setText:aClient getData.
	instanceClient :=aClient.
	addSuscription textColor:(Color green).
	].
]
