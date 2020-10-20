Class {
	#name : #PanelView,
	#superclass : #MenuMorph,
	#instVars : [
		'panelController'
	],
	#category : #TiendaOnline
}

{ #category : #'as yet unclassified' }
PanelView class >> create:aNameColeccion [
|temp|.
temp := self new.
temp initialize:aNameColeccion.
^temp.
]

{ #category : #initialization }
PanelView >> initialize:aPanelController [
|aNameOptions|.
"Pido que se me de la clase PanelController donde va  estar toda la logica del panel"
aNameOptions :=aPanelController getNameOptions.
panelController :=aPanelController.
aNameOptions  do:[ :aName|
	self addMenuItem:(Button create:aName size:(200@100))
	].
]
