Class {
	#name : #Cliente,
	#superclass : #FTSimpleDataSource,
	#instVars : [
		'nombre',
		'dni',
		'email',
		'listaDeSuscripcion',
		'listaContenidos'
	],
	#category : #'TiendaOnline-Model'
}

{ #category : #initialization }
Cliente class >> crearCLiente:unNombre unDni:unDni unEmail:unEmail [
|temp|.
temp :=self new.
temp crearConNombre: unNombre yDni:unDni  Email:unEmail.
temp crearLista.
^temp. 
]

{ #category : #initialization }
Cliente class >> createWithMap:arrayMap [
|temp reader|
reader :=Reader new.
temp := self new.
temp crearConNombre:( reader parserVar:(arrayMap at:2)) yDni:(reader parserVar:(arrayMap at:3))  Email:(reader parserVar:(arrayMap at:4)).
^temp.

]

{ #category : #'as yet unclassified' }
Cliente >> añadirLista:unaLista [
listaDeSuscripcion :=unaLista.
]

{ #category : #'as yet unclassified' }
Cliente >> cellColumn: column row:rowIndex [
column id = '#' ifTrue: [ ^ FTCellMorph new addMorph: rowIndex asMorph ].
column id = 'nombre' ifTrue: [ ^ self nameRow: rowIndex ].
column id= 'dni' ifTrue: [ ^self dniRow:rowIndex ].
column id= 'email' ifTrue: [ ^self emailRow:rowIndex ].
]

{ #category : #'as yet unclassified' }
Cliente >> crearConNombre:unNombre yDni:unDni Email:unEmail [
nombre:=unNombre.
dni:=unDni.
email:=unEmail
]

{ #category : #'as yet unclassified' }
Cliente >> crearLista [
listaDeSuscripcion :=OrderedCollection  new.
]

{ #category : #'as yet unclassified' }
Cliente >> dniRow:rowIndex [
	^ FTCellMorph new  
		addMorphBack: (self elementAt: rowIndex) getDni asStringMorph;
		yourself
]

{ #category : #'as yet unclassified' }
Cliente >> emailRow: rowIndex [
	^ FTCellMorph new  
		addMorphBack: (self elementAt: rowIndex) getEmail asStringMorph;
		yourself
]

{ #category : #'as yet unclassified' }
Cliente >> getDni [
^dni.
]

{ #category : #'as yet unclassified' }
Cliente >> getEmail [
^email.
]

{ #category : #'as yet unclassified' }
Cliente >> getNombre [
^nombre.
]

{ #category : #'as yet unclassified' }
Cliente >> nameRow: rowIndex [
	^ FTCellMorph new  
		addMorphBack: (self elementAt: rowIndex) getNombre asStringMorph;
		yourself
]

{ #category : #'as yet unclassified' }
Cliente >> newDataSourceMatching: aFTFilter [
	| newElements |
	newElements := Array withAll: (elements select: [ :each | 
		aFTFilter matches: (self toString: each) ]).
	^ self class new elements: newElements.
]

{ #category : #'as yet unclassified' }
Cliente >> toString:aCliente [
^aCliente getDni.
]
