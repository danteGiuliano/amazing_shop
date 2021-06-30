Class {
	#name : #Theme,
	#superclass : #Object,
	#classVars : [
		'buttom',
		'buttomText',
		'fonde',
		'ghostText',
		'morph',
		'morphContrast',
		'text'
	],
	#category : #'TiendaOnline-service'
}

{ #category : #'as yet unclassified' }
Theme class >> blueTheme [
buttom :=Color fromHexString:'48cae4'.
morph :=Color fromHexString: '0077b6'.
buttomText :=Color fromString:'03045e'.
ghostText :=Color fromString:'caf0f8'.
morphContrast :=Color fromString:'264653'.
text:=Color white.
"Fonde"
"fonde :=MorphGIF gifFromString:'fonde3.gif'."
fonde :=Morph new color:Color red.
]

{ #category : #'as yet unclassified' }
Theme class >> buttom [
^buttom.
]

{ #category : #'as yet unclassified' }
Theme class >> buttomText [
^buttomText.
]

{ #category : #'as yet unclassified' }
Theme class >> defaultTheme [
buttom :=Color fromHexString:'ee9b00'.
morph :=Color fromHexString: '2a9d8f'.
buttomText :=Color fromString:'264653'.
ghostText :=Color fromString:'caf0f8'.
morphContrast :=Color fromString:'264653'.
text :=Color white.
fonde:=Morph new color:Color green.
"fonde :=MorphGIF gifFromString:'fonde.gif'."
]

{ #category : #'as yet unclassified' }
Theme class >> fonde [
^fonde.
]

{ #category : #'as yet unclassified' }
Theme class >> ghostText [ 
^ghostText.
]

{ #category : #'as yet unclassified' }
Theme class >> morph [ 
^morph.
]

{ #category : #'as yet unclassified' }
Theme class >> morphContrast [
^morphContrast.
]

{ #category : #'as yet unclassified' }
Theme class >> roseTheme [
buttom :=Color fromHexString:'ffcbf2'.
morph :=Color fromHexString: 'ff4d6d'.
buttomText :=Color fromString:'14213d'.
ghostText :=Color fromString:'edf6f9'.
morphContrast :=Color fromString:'f15bb5'.
text :=Color white.
"fonde :=MorphGIF gifFromString:'fondeRose2.gif'."
]

{ #category : #'as yet unclassified' }
Theme class >> text [ 
^text.
]
