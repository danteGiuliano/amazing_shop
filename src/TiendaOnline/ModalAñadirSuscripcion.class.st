Class {
	#name : #'ModalAñadirSuscripcion',
	#superclass : #BorderedMorph,
	#instVars : [
		'inputDNI',
		'addSuscription',
		'search',
		'textBox',
		'model'
	],
	#category : #'TiendaOnline-components'
}

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
textBox beReadOnly.
]

{ #category : #initialization }
ModalAñadirSuscripcion >> defineMorph [
self extent:300@300.
self color:(Color black alpha:0.80).
]

{ #category : #initialization }
ModalAñadirSuscripcion >> initialize:aModel [
model :=aModel.
self defineMorph.
self addInputText.
self addTextBox.
self addBottoms.
self style.

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
]
