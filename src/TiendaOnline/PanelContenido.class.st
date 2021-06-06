Class {
	#name : #PanelContenido,
	#superclass : #MenuMorph,
	#instVars : [
		'conteiner',
		'scroll'
	],
	#category : #'TiendaOnline-components'
}

{ #category : #'ffi-calls' }
PanelContenido class >> call [ 
|temp|
temp :=self new.
temp initialize.
^temp menuScroll.
]

{ #category : #initialization }
PanelContenido >> addElements [
|contenidos|
contenidos :=Control modelFuntionReturn:[:h| h getContenidos].
contenidos do:[:contenido|
	self addMenuItem:(ComponentContenido createComponentModel: contenido).
	].
]

{ #category : #initialization }
PanelContenido >> defineMorph [
conteiner :=BorderedMorph new extent:615@400.
scroll :=ScrollPane new extent:615@400.
self extent:615@400.
scroll scroller addMorph:self.
conteiner addMorph:scroll.
conteiner color:(Color transparent).
conteiner borderColor:(Color transparent )

]

{ #category : #initialization }
PanelContenido >> initialize [ 
super initialize.
self defineMorph.
self addElements.
]

{ #category : #initialization }
PanelContenido >> menuScroll [
^conteiner.
]
