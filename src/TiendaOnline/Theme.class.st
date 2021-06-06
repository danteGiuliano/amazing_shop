Class {
	#name : #Theme,
	#superclass : #Object,
	#classVars : [
		'buttom',
		'buttomText',
		'ghostText',
		'morph',
		'morphContrast'
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