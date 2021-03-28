Class {
	#name : #TextBox,
	#superclass : #RubTextFieldMorph,
	#category : #'TiendaOnline-components'
}

{ #category : #'as yet unclassified' }
TextBox class >> create:aText [ 
|temp aux|
aux:=StringMorph contents: aText.
temp :=self new.
temp ghostText: aText.
temp extent: aux extent+10.
^temp.
]

{ #category : #'as yet unclassified' }
TextBox class >> create:aText size:aSize [
|temp|
temp :=self new.
temp ghostText: aText.
temp extent:aSize.
^temp.
]
