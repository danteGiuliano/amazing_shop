Class {
	#name : #SuscripcionComprada,
	#superclass : #FTSimpleDataSource,
	#instVars : [
		'listaDescuento',
		'fechaInicio',
		'fechaFin',
		'nombreSuscripcion'
	],
	#category : #'TiendaOnline-Model'
}

{ #category : #'as yet unclassified' }
SuscripcionComprada class >> crearSuscripcion:unaListaDescuentos [ 
|temp|
temp :=self new.
temp añadirLista:unaListaDescuentos.
temp sinSuscripcionActiva .
^temp.
]

{ #category : #'as yet unclassified' }
SuscripcionComprada class >> createWithSQL:unaListaDescuentos yFechaInicio:unaFechaInicio yFechaFin:unaFechaFin deNombre:unNombre [
|temp|
temp :=self new.
temp añadirListaMySQL:unaListaDescuentos  yFechaInicio:unaFechaInicio   yFechaFIN:unaFechaFin   deNombre: unNombre.
^temp.
]

{ #category : #'as yet unclassified' }
SuscripcionComprada >> añadirLista:unaLista [
listaDescuento :=unaLista.
fechaInicio :=Date today yyyymmdd.
fechaFin :=Date today onNextMonth  yyyymmdd.
]

{ #category : #'as yet unclassified' }
SuscripcionComprada >> añadirListaMySQL:unaLista yFechaInicio:unaFechaInicio yFechaFIN:unaFechaFin deNombre:unNombre [
listaDescuento :=unaLista.
fechaInicio :=unaFechaInicio.
fechaFin :=unaFechaFin.
nombreSuscripcion :=unNombre.
]

{ #category : #accessing }
SuscripcionComprada >> cellColumn: column row:rowIndex [
column id = 'Tipo' ifTrue: [ ^ self tipoRow: rowIndex ].
column id= 'Inicio' ifTrue: [ ^self inicioRow:rowIndex ].
column id= 'Vencimiento' ifTrue: [ ^self vencimientoRow:rowIndex ].
]

{ #category : #'as yet unclassified' }
SuscripcionComprada >> getInicio [
^fechaInicio asString.
]

{ #category : #'as yet unclassified' }
SuscripcionComprada >> getTipo [
^nombreSuscripcion asString.
]

{ #category : #'as yet unclassified' }
SuscripcionComprada >> getVencimiento [
^fechaFin asString.
]

{ #category : #'as yet unclassified' }
SuscripcionComprada >> inicioRow:rowIndex [
^ FTCellMorph new  
		addMorphBack:((self elementAt: rowIndex) getInicio asStringMorph color:(Color green));
		yourself
]

{ #category : #'as yet unclassified' }
SuscripcionComprada >> newDataSourceMatching: aFTFilter [
	| newElements |
	newElements := Array withAll: (elements select: [ :each | 
		aFTFilter matches: (self toString: each) ]).
	^ self class new elements: newElements.
]

{ #category : #'as yet unclassified' }
SuscripcionComprada >> sinSuscripcionActiva [
nombreSuscripcion :='Nil'
]

{ #category : #'as yet unclassified' }
SuscripcionComprada >> tipoRow: rowIndex [
^ FTCellMorph new  
		addMorphBack: (self elementAt: rowIndex) getTipo asStringMorph;
		yourself
]

{ #category : #'as yet unclassified' }
SuscripcionComprada >> toString:aSuscription [
^aSuscription getTipo.
]

{ #category : #'as yet unclassified' }
SuscripcionComprada >> vencimientoRow:rowIndex [ 
^ FTCellMorph new  
		addMorphBack: ((self elementAt: rowIndex) getVencimiento asStringMorph color:(Color red));
		yourself
]
