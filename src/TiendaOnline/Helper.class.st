Class {
	#name : #Helper,
	#superclass : #Object,
	#category : #TiendaOnline
}

{ #category : #'as yet unclassified' }
Helper class >> createPanel [
^PanelView create:(PanelController create).

]

{ #category : #'as yet unclassified' }
Helper class >> createSubMenu:aSize and:aWitdh [
^SubMenuView create:aSize and:aWitdh.
]
