Class {
	#name : #PanelController,
	#superclass : #Object,
	#instVars : [
		'colNameOptions'
	],
	#category : #TiendaOnline
}

{ #category : #operations }
PanelController class >> create [
|temp|
temp := self new. 
^temp initializePanelController.
]

{ #category : #initialization }
PanelController >> getNameOptions [
^colNameOptions.



]

{ #category : #initialization }
PanelController >> initializePanelController [
colNameOptions :=(#(Clientes Suscripciones Promociones Contenidos) asOrderedCollection).



]
