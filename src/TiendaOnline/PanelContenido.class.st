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
	self addMenuItem:(ComponentContenido createComponentAName:contenido name aPrecio:contenido precio  aFecha: contenido fecha).
	].
]

{ #category : #initialization }
PanelContenido >> defineMorph [
conteiner :=BorderedMorph new extent:615@500.
scroll :=ScrollPane new extent:615@500.
self extent:615@500.
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
