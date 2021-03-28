Class {
	#name : #MenuSuscripcion,
	#superclass : #SubMenuView,
	#category : #'TiendaOnline-View'
}

{ #category : #'as yet unclassified' }
MenuSuscripcion class >> createMenuSuscripcion:aModel [
|temp|
temp := self new.
^temp initialize:aModel.
]

{ #category : #initialization }
MenuSuscripcion >> initialize:aModel [
|temp|
model:=aModel.
temp :=#(Nueva Borrar Buscar)asOrderedCollection .
super initialize.
self addMorphCentered:(Helper createPanel: temp aLogic:self routes). 
]

{ #category : #initialization }
MenuSuscripcion >> routes [
	"Inspirate in concept IONIC Framework"
	^ [ :id | 
	  | logicReturn |
	id = 'Peliculas' ifTrue: [ logicReturn := [|a|.a:=Button create:'Funco'.a openInHand] ].
	id = 'Aplicaciones' ifTrue: [ logicReturn := [|a|.a:=Button create:'OMG'.a openInHand] ].
	id = 'Nueva' ifTrue: [ logicReturn := [ModalSuscripcion call:model] ].
	logicReturn.
	].
]
