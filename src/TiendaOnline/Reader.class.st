Class {
	#name : #Reader,
	#superclass : #Object,
	#category : #'TiendaOnline-service'
}

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

{ #category : #'as yet unclassified' }
Reader >> readJson: aStringRoute [
	"return a String format."

	| temp i colection aFile |
	aFile := File named: aStringRoute asFileReference fullName.
	colection := OrderedCollection new.
	i := 1.
	temp := (aFile readStream next: aFile size) asString.
	temp := temp copyWithout: $[.
	temp := temp copyWithout: $].
	temp := temp copyWithout: $,.
	temp :=self separateObject: temp asString.
	temp := temp copyWithout: ${.
	temp :=temp substrings:'!'.	
	temp:=self formater: temp.
	"[ i <= temp size ]
		whileTrue: [ | aux |
			aux := temp at: i.
			colection add: (aux substrings: '#').
			i := i + 1 ].
	^ colection"
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
