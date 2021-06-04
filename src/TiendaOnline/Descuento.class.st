Class {
	#name : #Descuento,
	#superclass : #FTSimpleDataSource,
	#instVars : [
		'diccionarioDescuento',
		'nombre'
	],
	#category : #'TiendaOnline-Model'
}

{ #category : #'as yet unclassified' }
Descuento class >> conDescuentos:aDiccionary deNombre:unNombre [
|temp|
temp :=self new.
temp iniciarConDescuentos:aDiccionary deNombre:unNombre.
^temp.
]

{ #category : #initialization }
Descuento class >> createWithMap:arrayMap [
|temp reader block|
reader :=Reader new.
temp := self new.
block:=[:h| reader parserVar: (arrayMap at:h)].
temp iniciarConDescuentos:(self parserDictionary:(reader parserVarDicionary: (arrayMap at:4)))fechaInicio:(block value:2)fechaFinal:(block value:3) deNombre:(block value:5). 
^temp.

]

{ #category : #'as yet unclassified' }
Descuento class >> createWithSQL:aMySQL [
|aDiccionary nombre temp query|
temp :=self new.
query :=aMySQL columns.
nombre :=query at:1.
aDiccionary := Dictionary newFrom:{'Aplicacion'-> (query at:2). 'Pelicula' -> (query at:3).'Libro'->(query at:4)}.
temp iniciarConDescuentos: aDiccionary  deNombre:nombre. 
^temp.
]

{ #category : #'as yet unclassified' }
Descuento class >> parserDictionary:arrayDictiionary [
|diccionary|
diccionary :=Dictionary new.
^arrayDictiionary.
]

{ #category : #'as yet unclassified' }
Descuento >> aplicacionRow: rowIndex [
	^ FTCellMorph new  
		addMorphBack: (self elementAt: rowIndex) getAplication asStringMorph;
		yourself
]

{ #category : #'as yet unclassified' }
Descuento >> cellColumn: column row:rowIndex [
column id = 'Nombre' ifTrue: [ ^self nombreRow: rowIndex].
column id= 'Descuento Libro' ifTrue: [ ^self libroRow:rowIndex ].
column id= 'Descuento Aplicacion' ifTrue: [ ^self aplicacionRow:rowIndex ].
column id= 'Descuento Pelicula' ifTrue: [ ^self peliculaRow:rowIndex ].


]

{ #category : #comparing }
Descuento >> equals:aName [
^nombre ==aName.
]

{ #category : #'as yet unclassified' }
Descuento >> fechaFinalRow:rowIndex [ 
	^ FTCellMorph new  
		addMorphBack: (self elementAt: rowIndex) getFechaExpira asStringMorph;
		yourself
]

{ #category : #'as yet unclassified' }
Descuento >> fechaIncioRow:rowIndex [ 
	^ FTCellMorph new  
		addMorphBack: (self elementAt: rowIndex) getFechaInicio asStringMorph;
		yourself
]

{ #category : #'as yet unclassified' }
Descuento >> getAplication [
^(diccionarioDescuento at:'Aplicacion')asString,' %'.
]

{ #category : #'as yet unclassified' }
Descuento >> getLibro [
^(diccionarioDescuento at:'Libro')asString,' %'
]

{ #category : #'as yet unclassified' }
Descuento >> getNombre [
^nombre
]

{ #category : #'as yet unclassified' }
Descuento >> getPelicula [
^(diccionarioDescuento at:'Pelicula')asString,' %'
]

{ #category : #'as yet unclassified' }
Descuento >> iniciarConDescuentos:aDiccionary deNombre:unNombre [
nombre:=unNombre.
diccionarioDescuento :=aDiccionary.
]

{ #category : #'as yet unclassified' }
Descuento >> libroRow:rowIndex [ 
	^ FTCellMorph new  
		addMorphBack: (self elementAt: rowIndex) getLibro asStringMorph;
		yourself
]

{ #category : #'as yet unclassified' }
Descuento >> newDataSourceMatching: aFTFilter [
	| newElements |
	newElements := Array withAll: (elements select: [ :each | 
		aFTFilter matches: (self toString: each) ]).
	^ self class new elements: newElements.
]

{ #category : #'as yet unclassified' }
Descuento >> nombreRow: rowIndex [
	^ FTCellMorph new  
		addMorphBack: (self elementAt: rowIndex) getNombre asStringMorph;
		yourself
]

{ #category : #'as yet unclassified' }
Descuento >> peliculaRow: rowIndex [
	^ FTCellMorph new  
		addMorphBack: (self elementAt: rowIndex) getPelicula asStringMorph;
		yourself
]

{ #category : #'as yet unclassified' }
Descuento >> toString:aSuscription [
^aSuscription getNombre.
]
