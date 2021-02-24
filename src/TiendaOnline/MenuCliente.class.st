Class {
	#name : #MenuCliente,
	#superclass : #SubMenuView,
	#instVars : [
		'table',
		'subMenu',
		'temp'
	],
	#category : #'TiendaOnline-View'
}

{ #category : #'as yet unclassified' }
MenuCliente class >> createMenuClienteIn:aContent [
|temp|
temp := self new.
^temp initialize:aContent.
]

{ #category : #initialization }
MenuCliente >> addOptions [
|options|
options := #(actualizar  Crear Comprar Suscripciones)asOrderedCollection .
Helper addRightTopMorph:((Helper createPanel: options aLogic:self routes)) in:subMenu.
]

{ #category : #initialization }
MenuCliente >> initialize:aContent [
super initialize.
subMenu :=aContent.
model:=aContent getModel.
aContent addDependent: self.
self loadTable.
self addOptions.
]

{ #category : #initialization }
MenuCliente >> loadTable [
| aNamesColumnTable |
temp :=model getClients.
aNamesColumnTable:= #('#' 'nombre' 'dni' 'email')asOrderedCollection.
table := Table create: (Cliente elements:(temp)) aCollums: aNamesColumnTable  aSize:(900@600).
Helper addLeftTopMorphic: table in:subMenu. 
table left:220.
table bottom:630.

]

{ #category : #initialization }
MenuCliente >> routes [
	"Inspirate in concept IONIC Framework"
	^ [ :id | 
	  | logicReturn |
	id = 'Crear' ifTrue: [ logicReturn := [ModalCliente call:model].].
	id = 'actualizar' ifTrue: [ logicReturn := [table delete.self loadTable]].
	id='Suscripciones' ifTrue:[logicReturn :=[ModalBuscarCliente call:model]].
	logicReturn.
	]. 
]
