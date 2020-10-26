Class {
	#name : #PanelController,
	#superclass : #Object,
	#instVars : [
		'panelView'
	],
	#category : #TiendaOnline
}

{ #category : #operations }
PanelController class >> create [
|temp|
temp := self new. 
^temp initializePanelController.
]

{ #category : #operations }
PanelController class >> create:aCollect [
|temp|
temp := self new. 
^temp initializePanelController:aCollect.
]
