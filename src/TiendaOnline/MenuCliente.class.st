Class {
	#name : #MenuCliente,
	#superclass : #SubMenuView,
	#category : #'TiendaOnline-View'
}

{ #category : #'as yet unclassified' }
MenuCliente class >> createMenuClienteIn:aContent [
|temp|
temp := self new.
^temp initialize:aContent.
]

{ #category : #initialization }
MenuCliente >> initialize:aContent [
super initialize.
aContent addDependent: self.
self loadTable:aContent.
]

{ #category : #initialization }
MenuCliente >> loadTable:aContent [
|temp options aNamesColumnTable aTable|
temp :=aContent model:[self getClients].
options := #(Buscar Eliminar Crear Comprar Modificar)asOrderedCollection .
aNamesColumnTable:= #('#' 'Nombre' 'DNI' 'Email')asOrderedCollection.
aTable := Table create: (Cliente elements:(temp)) aCollums: aNamesColumnTable  aSize:(900@600). 
Helper addRightTopMorph:((Helper createPanel: options aLogic:self routes)) in:aContent.
Helper addLeftTopMorphic: aTable in:aContent. 
aTable left:220.
aTable bottom:630.
]

{ #category : #initialization }
MenuCliente >> routes [
	"Inspirate in concept IONIC Framework"
	^ [ :id | 
	  | logicReturn |
	id = 'Peliculas' ifTrue: [ logicReturn := [|a|.a:=Button create:'Funco'.a openInHand] ].
	id = 'Aplicaciones' ifTrue: [ logicReturn := [|a|.a:=Button create:'OMG'.a openInHand] ].
	id = 'Juegos' ifTrue: [ logicReturn := [|a|.a:=Button create:'Amazing'.a openInHand] ].
	id = 'Libros' ifTrue: [ logicReturn := [|a|.a:=Button create:'beautiful'.a openInHand] ].
	logicReturn.
	].
]
