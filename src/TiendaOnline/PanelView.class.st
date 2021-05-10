Class {
	#name : #PanelView,
	#superclass : #MenuMorph,
	#category : #'TiendaOnline-components'
}

{ #category : #'as yet unclassified' }
PanelView class >> create:aNameColeccion aControl:aBlock [
|temp|.
temp := self new.
temp initialize:aNameColeccion aControl:aBlock.
^temp.
]

{ #category : #initialization }
PanelView >> initialize:aNameColection aControl:aBlock [
|temp|
aNameColection  do:[ :aName|temp:=(Button create:aName size:(200@100)).
	temp color:Color lightCyan.
	temp color:(temp color alpha:0.50).
	Helper border: temp aColor:temp color rad:8. 
	
	temp mouseAction: ( self setLogicButton:aBlock idButton: temp getID).
	self addMenuItem:temp
	].

]

{ #category : #initialization }
PanelView >> setLogicButton:aBlock idButton:aID [
^aBlock value:aID.

]
