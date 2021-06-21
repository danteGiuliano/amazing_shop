Class {
	#name : #MenuCliente,
	#superclass : #SubMenuView,
	#instVars : [
		'table',
		'subMenu',
		'addCliente',
		'searchCliente',
		'addSuscription',
		'buyContenido'
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
	addCliente := ModalCliente call.
	searchCliente := ModalBuscarCliente call.
	addSuscription := ModalAñadirSuscripcion call.
	buyContenido :=ComponenetCompraContenido call.
	subMenu addMorph:addCliente;addMorph:searchCliente ;addMorph:addSuscription;addMorph:buyContenido.
]

{ #category : #initialization }
MenuCliente >> initialize: aContent [
	super initialize.
	subMenu := aContent.
	self loadTable.
	self addOptions.
	self style.
]

{ #category : #initialization }
MenuCliente >> loadTable [
	| aNamesColumnTable temp |
	temp := Control modelFuntionReturn: [ :tienda | tienda getClients ].
	aNamesColumnTable := #('nombre' 'dni' 'email') asOrderedCollection.
	table := Table
		create: (Cliente elements: temp)
		aCollums: aNamesColumnTable
		aSize: 750 @ 300.
	Helper addLeftTopMorphic: table in: subMenu.
	Helper border: table aColor: table color.
	table headerBorder:0.98.
]

{ #category : #initialization }
MenuCliente >> style [
table left:subMenu left+30.
	addCliente left: table right + 30.
	searchCliente top: table bottom + 10.
	searchCliente left: table left.
	addSuscription left:searchCliente right+10.
	addSuscription top:searchCliente top.
	buyContenido bottom:searchCliente bottom.
	buyContenido left:addCliente left.
	addCliente bottom:buyContenido top-20 .
]
