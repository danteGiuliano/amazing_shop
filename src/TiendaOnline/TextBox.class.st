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
temp borderStyle:(BottomBorder new width:2).
temp color:Color transparent.
temp ghostColor:(Theme ghostText).
temp borderColor:(Color black).
^temp.
]

{ #category : #'as yet unclassified' }
TextBox >> clear [
self setText:''.
]

{ #category : #'as yet unclassified' }
TextBox >> ghostColor:aColor [
self withRulerNamed: #ghostText.
self ghostTextRuler textColor:(aColor).
]

{ #category : #'as yet unclassified' }
TextBox >> input [
^(self text) asString.
]

{ #category : #'as yet unclassified' }
TextBox >> isEmpty [
^(((self text)asString)='').
]

{ #category : #'as yet unclassified' }
TextBox >> styleWeb [
self borderStyle:(BottomBorder new width:2);
color:Color transparent;
ghostColor:(Theme ghostText);
borderColor:(Color black).
]
