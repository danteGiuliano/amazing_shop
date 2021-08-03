Class {
	#name : #ModalTheme,
	#superclass : #BorderedMorph,
	#instVars : [
		'blueTheme',
		'defaultTheme',
		'roseTheme',
		'menu'
	],
	#category : #'TiendaOnline-service'
}

{ #category : #'ffi-calls' }
ModalTheme class >> call [ 
^self new openInHand.
]

{ #category : #'ffi-calls' }
ModalTheme class >> call:aMenu [
^self new setMenu:aMenu.
]

{ #category : #initialization }
ModalTheme >> addBotoms [
defaultTheme :=Button create:'Default Theme' size:100@30.
blueTheme :=Button create:'Blue Theme' size:100@30.
roseTheme :=Button create:'Rose Theme' size:100@30.

self addMorph:defaultTheme ;addMorph:blueTheme;addMorph:roseTheme.   
]

{ #category : #initialization }
ModalTheme >> defineMorph [
self extent:120@150.
self color:Theme morph.
Helper border:self aColor:self color  rad:8


]

{ #category : #initialization }
ModalTheme >> initialize [ 
super initialize.
self defineMorph.
self addBotoms.
self style.
self logic.
]

{ #category : #initialization }
ModalTheme >> logic [ 

defaultTheme mouseAction:[Theme defaultTheme.menu delete.Menu create.self delete].
blueTheme mouseAction: [Theme blueTheme.menu delete.Menu create.self delete ].
roseTheme mouseAction: [Theme roseTheme.menu delete.Menu create.self delete ].
]

{ #category : #initialization }
ModalTheme >> setMenu:aMenu [
menu:=aMenu
]

{ #category : #initialization }
ModalTheme >> style [

defaultTheme center:self center;top:self top+10.
Helper border: defaultTheme  aColor:defaultTheme color   rad:8. 

blueTheme center:self center;top:defaultTheme bottom+10.
Helper border: blueTheme  aColor:blueTheme color  rad:8.

roseTheme center:self center;top:blueTheme bottom+10.
Helper border:roseTheme aColor:roseTheme color  rad:8.
]
