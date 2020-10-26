Class {
	#name : #MenuSuscripcion,
	#superclass : #SubMenuView,
	#instVars : [
		'menu'
	],
	#category : #TiendaOnline
}

{ #category : #'as yet unclassified' }
MenuSuscripcion class >> createMenuSuscripcion [
|temp|
temp := self new.
^temp initialize.
]

{ #category : #initialization }
MenuSuscripcion >> initialize [
|temp|
temp :=#(prueba prueba2)asOrderedCollection .
super initialize.
self addMorphCentered:(Helper createPanel: temp). 
]
