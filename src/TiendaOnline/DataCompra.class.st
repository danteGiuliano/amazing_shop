Class {
	#name : #DataCompra,
	#superclass : #FTSimpleDataSource,
	#instVars : [
		'nombreCliente',
		'fechaCompra',
		'tipoSuscripcion'
	],
	#category : #'TiendaOnline-components'
}

{ #category : #'as yet unclassified' }
DataCompra class >> crearData:unNombre enFecha:unaFecha yTipo:unTipo [
^self new crearDeNombre:unNombre enFecha:unaFecha yTipo:unTipo.
]

{ #category : #accessing }
DataCompra >> cellColumn: column row:rowIndex [
column id = 'Nombre Cliente' ifTrue: [ ^ self nameRow: rowIndex ].
column id= 'Fecha' ifTrue: [ ^self fechaRow:rowIndex ].
column id= 'Suscripcion' ifTrue: [ ^self suscriptionRow:rowIndex ].
]

{ #category : #'as yet unclassified' }
DataCompra >> cliente [ 
^nombreCliente 
]

{ #category : #'as yet unclassified' }
DataCompra >> crearDeNombre:unNombre enFecha:unaFecha yTipo:unTipo [.
nombreCliente :=unNombre.
fechaCompra :=unaFecha.
tipoSuscripcion :=unTipo.
]

{ #category : #'as yet unclassified' }
DataCompra >> fecha [
^fechaCompra asString.
]

{ #category : #'as yet unclassified' }
DataCompra >> fechaRow:rowIndex [ 
^ FTCellMorph new  
		addMorphBack: (self elementAt: rowIndex) fecha asStringMorph;
		yourself
]

{ #category : #'as yet unclassified' }
DataCompra >> nameRow: rowIndex [ 
	^ FTCellMorph new  
		addMorphBack: (self elementAt: rowIndex) cliente asStringMorph;
		yourself
]

{ #category : #'as yet unclassified' }
DataCompra >> suscripcion [
^tipoSuscripcion .
]

{ #category : #'as yet unclassified' }
DataCompra >> suscriptionRow:rowIndex [
^ FTCellMorph new  
		addMorphBack: (self elementAt: rowIndex) suscripcion asStringMorph;
		yourself
]
