Class {
	#name : #Suscripcion,
	#superclass : #FTSimpleDataSource,
	#instVars : [
		'fechaInicio',
		'fechaExpira',
		'diccionarioDescuento',
		'nombre'
	],
	#category : #'TiendaOnline-Model'
}

{ #category : #'as yet unclassified' }
Suscripcion class >> conDescuentos:aDiccionary fechaInicio:fechaInicio fechaFinal:fechaFinal deNombre:unNombre [
|temp|
temp :=self new.
temp iniciarConDescuentos:aDiccionary fechaInicio:fechaInicio fechaFinal:fechaFinal deNombre:unNombre.
^temp.
]

{ #category : #'as yet unclassified' }
Suscripcion >> cellColumn: column row:rowIndex [
column id = 'Nombre' ifTrue: [ ^ self nombreRow: rowIndex ].
column id= 'Descuento Libro' ifTrue: [ ^self libroRow:rowIndex ].
column id= 'Descuento Aplicacion' ifTrue: [ ^self aplicacionRow:rowIndex ].
column id= 'Descuento Pelicula' ifTrue: [ ^self peliculaRow:rowIndex ].
column id= 'Fecha inicio ' ifTrue: [ ^self fechaIncioRow:rowIndex ].
column id= 'Fecha Expira' ifTrue: [ ^self fechaFinalRow:rowIndex ].

]

{ #category : #'as yet unclassified' }
Suscripcion >> getNombre [
^nombre
]

{ #category : #'as yet unclassified' }
Suscripcion >> iniciarConDescuentos:aDiccionary fechaInicio:unaFechaInicio fechaFinal:fechaFinal deNombre:unNombre [
nombre:=unNombre.
fechaInicio :=unaFechaInicio.
fechaExpira :=fechaFinal.
diccionarioDescuento :=aDiccionary.
]

{ #category : #'as yet unclassified' }
Suscripcion >> newDataSourceMatching: aFTFilter [
	| newElements |
	newElements := Array withAll: (elements select: [ :each | 
		aFTFilter matches: (self toString: each) ]).
	^ self class new elements: newElements.
]

{ #category : #'as yet unclassified' }
Suscripcion >> nombreRow: rowIndex [
	^ FTCellMorph new  
		addMorphBack: (self elementAt: rowIndex) getNombre asStringMorph;
		yourself
]
