Class {
	#name : #ModalTheme,
	#superclass : #CircleMorph,
	#instVars : [
		'blueTheme',
		'defaultTheme',
		'roseTheme',
		'exit',
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
^self new setMenu:aMenu;openCenteredInWorld.
]

{ #category : #initialization }
ModalTheme >> addBotoms [
exit :=Button create:'EXIT' size:60@30.
defaultTheme :=Button create:'Default Theme' size:100@30.
blueTheme :=Button create:'Blue Theme' size:100@30.
roseTheme :=Button create:'Rose Theme' size:100@30.

self addMorph:defaultTheme ;addMorph:blueTheme; addMorph:exit;addMorph:roseTheme.   
]

{ #category : #initialization }
ModalTheme >> defineMorph [
self extent:300@300.
self color:Theme morph.


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

exit mouseAction:[self delete.].
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

exit center:self center;bottom:self bottom-30.
Helper border: exit aColor:exit color  rad:8. 

defaultTheme center:self center;top:self top+30.
Helper border: defaultTheme  aColor:defaultTheme color   rad:8. 

blueTheme center:self center;top:defaultTheme bottom+10.
Helper border: blueTheme  aColor:blueTheme color  rad:8.

roseTheme center:self center;top:blueTheme bottom+10.
Helper border:roseTheme aColor:roseTheme color  rad:8.
]
