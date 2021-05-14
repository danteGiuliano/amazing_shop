Class {
	#name : #Reader,
	#superclass : #Object,
	#category : #'TiendaOnline-service'
}

{ #category : #'as yet unclassified' }
Reader >> addSeparators:text [
|i boolean refine block caracter|.
i :=1.
boolean :=false.
refine:=''.
	"Funtion ------------------------------------------------------"
block :=[|temp|.
			temp:=caracter.
			[caracter :=(caracter asString)asNumber] on: Exception do:[caracter:=temp].
			caracter isNumber ifFalse:[
				refine:=refine,($! asString).
				boolean :=false.
			].].
	"Algoritm ------------------------------------------------------"
[i <= (text size)] whileTrue:[
		caracter :=text at:i.
		caracter =$: ifTrue:[
				boolean :=true.
			]ifFalse:[
		boolean ifTrue:[
			block value
		 ]].
	refine:=refine,caracter asString.
	i=(text size) ifTrue:[refine:=refine,$! asString]."case final"
	i:=i+1.
	].
^refine.
]

{ #category : #'as yet unclassified' }
Reader >> borrateClassDiccionary:texto [
"a Simple algoritm but borrate DiccionaryText."
| cadena i boolean|
boolean :=false.
i:=1.
cadena:=''.
[i <=texto size] whileTrue:[
	|caracter|
	caracter :=texto at:i.
	caracter=$:ifTrue:[
		boolean :=true.
		].
			boolean ifTrue:[
				cadena:=cadena,caracter asString.
		
		].
	i:=i+1.
	].
^cadena.
]

{ #category : #'as yet unclassified' }
Reader >> bugs:aArray [
|parser|
parser :=OrderedCollection new.
aArray do:[:h|parser add:(h copyWithout:$})].
^parser.
]

{ #category : #'as yet unclassified' }
Reader >> convertToObject:aCollection [
"Map a String usaged object and dictionary.."
|collection i|
i:=1.
collection := OrderedCollection new.
[i <= aCollection size] whileTrue:[
	collection add:( self mapClass:(aCollection at:i)).
	i:=i+1.
	].
	^collection.
]

{ #category : #'initialize-release' }
Reader >> formater:aStringCol [
|temp collection|.
collection := OrderedCollection new.
temp:=aStringCol do:[
	:aString|
	|i flag|. i:=1.flag:=true.
			[ i <= aString size&flag ] whileTrue:[
				(aString at:i) =$# ifTrue:[
						aString at:i put:$!.
					]ifFalse:[
							(aString at:i)=${ ifTrue:[
									flag:=false.
								].
						].
					i:=i+1.
				].
		].
	temp:=temp do:[:aux|
		collection add:(aux substrings:'!').
		].
	^collection.
]

{ #category : #'initialize-release' }
Reader >> mapClass:arrayString [
^(arrayString at:1)asClass createWithMap:arrayString.



]

{ #category : #'initialize-release' }
Reader >> parserVar:aDiccionary [
^(aDiccionary substrings:':')at:2.
]

{ #category : #'initialize-release' }
Reader >> parserVarDicionary:aString [ 
|diccionary pelicula libro aplicacion block text collection|

text:=self borrateClassDiccionary: aString.
text :=self addSeparators:text.
collection :=text substrings:'!'.
block:=[:h| (h at:1) -> (h at:2)].
pelicula:= (collection  at:2) substrings:':'.
libro:= (collection  at:3) substrings:':'.
aplicacion:= (collection  at:4) substrings:':'.
aplicacion at:2 put:((aplicacion at:2) copyWithout:$}).

diccionary :=Dictionary newFrom:{block value:libro. block value:aplicacion. block value:pelicula}.
^diccionary. 
]

{ #category : #'as yet unclassified' }
Reader >> readJson: aStringRoute [
	"return a String format."

	| temp  colection aFile |
	aFile := File named: aStringRoute asFileReference fullName.
	colection := OrderedCollection new.
	temp := (aFile readStream next: aFile size) asString.
	temp := temp copyWithout: $[.
	temp := temp copyWithout: $].
	temp := temp copyWithout: $,.
	temp := temp copyWithout: $'.
	temp :=self separateObject: temp asString.
	temp := temp copyWithout: ${.
	temp :=temp substrings:'!'.	
	temp:=self formater: temp.
	temp do:[:h|	colection add: (self bugs:h)].
	temp:=colection.
	^temp.
]

{ #category : #'as yet unclassified' }
Reader >> readStream:aStringRoute [
| temp aFile|
	aFile := File named: aStringRoute asFileReference fullName.
	temp := (aFile readStream next: aFile size) asString.
	^temp.
]

{ #category : #'as yet unclassified' }
Reader >> readTxt:aFile [
^((aFile readStream)next:aFile size) asString.

]

{ #category : #'as yet unclassified' }
Reader >> separateObject: aString [
	| i count temp flag|
	i := 1.
	temp := ''.
	count := 0.
	flag:=false.
	[ i <= (aString size) ]
		whileTrue: [ temp := aString at: i.
			temp = ${
				ifTrue: [ count := count + 1. flag:=true.]
				ifFalse: [ temp = $}
						ifTrue: [ count := count - 1 ].
					count = 0 & flag
						ifTrue: [ aString at: i put: $! .flag:=false.]. ].
			i := i + 1 ].
	^ aString asString
]
