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
	|temp|.
temp :=self new.
temp initialize.
temp openCenteredInWorld.

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
|exit|
exit :=Button create: 'X' size:30@30. 
addSuscription :=Button create: 'Anadir Suscripcion' size:120@30.
search :=Button create:'search' size:70@20.

addSuscription color:(Color veryDarkGray alpha:0.85). 
search color:(Color veryDarkGray alpha:0.85).
exit color:(Color transparent).
exit borderColor: (Color transparent).

Helper border: search  aColor:search color  rad:2. 
Helper border: addSuscription   aColor: addSuscription color rad:3.

Helper addRightTopMorph: search  in:self.
Helper addCenterMorph: addSuscription  in:self.  
Helper addLeftTopMorphic: exit in:self. 

exit mouseAction: [self delete.]
]

{ #category : #initialization }
ModalAñadirSuscripcion >> addInputText [
inputDNI :=TextBox create: 'Ingrese DNI' size:290@30.
Helper border: inputDNI  aColor:(Color veryDarkGray )  rad:1. 
Helper addCenterMorph: inputDNI  in:self.
  
]

{ #category : #initialization }
ModalAñadirSuscripcion >> addTextBox [
textBox :=RubScrolledTextMorph new.
textBox extent:280@150.

Helper border: textBox  aColor:textBox color. 
Helper addCenterMorph: textBox  in:self.

"No write"
textBox setText:'informacion de cliente'.
textBox beReadOnly.
]

{ #category : #initialization }
ModalAñadirSuscripcion >> defineMorph [
self extent:300@300.
self color:(Color black alpha:0.60).
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
search top:self top+7.
"input addDni"
inputDNI top:self top+30.
"Text box"
textBox left: self top+10.
"Boton add suscription"
addSuscription top:textBox bottom+5.
Helper border:self aColor:self color  rad:3. 
]

{ #category : #initialization }
ModalAñadirSuscripcion >> updateAddSuscripcion [
instanceClient ifNotNil:[
	|selection suscriptions names suscription aColection suscriptionBuy|
	aColection :=OrderedCollection new.
	suscriptions :=Control modelFuntionReturn:[:h| h getSuscripciones. ].
	names :=suscriptions collect:[:aSuscription|aSuscription getNombre].
	selection:=PopupChoiceDialogWindow chooseFrom:names lines:#(1 2) title:'Suscripciones'.
	suscription:=suscriptions detect:[:aSuscription|aSuscription equals:selection].
	
	aColection add:'"',selection,'"'.
	aColection add:(instanceClient getDni)asString.
	
	suscriptionBuy :=SuscripcionComprada crearSuscripcion:suscription.
	
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
