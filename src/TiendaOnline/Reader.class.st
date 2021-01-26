Class {
	#name : #Reader,
	#superclass : #Object,
	#category : #'TiendaOnline-Service'
}

{ #category : #'as yet unclassified' }
Reader >> convertToObject:aCollection [
"Map a String usaged object and dictionary.."
|collection|
collection := OrderedCollection new.
aCollection do:[:object|
			collection  add:(self mapClass:object).
			].
		^collection.
]

{ #category : #'initialize-release' }
Reader >> mapClass:arrayString [
|temp|
temp :=arrayString at:1.
temp:= self routeClass:temp.
^temp createWithMap:arrayString.

]

{ #category : #'as yet unclassified' }
Reader >> readJson:aFile [ 
"return a String format."
|temp i colection|
colection := OrderedCollection new.
i :=1.
temp :=(aFile readStream next: aFile size) asString.
temp := temp substrings:'[]'.
temp := temp at:1.
temp := temp copyWithout:$,.
temp:=temp copyWithout:${.
temp:=temp substrings:'}'.
[i<=temp size] whileTrue: [ 
	|aux|
	aux:=temp at:i.
	colection add:(aux substrings:'#').
	i :=i+1.
	 ].
^colection.

]

{ #category : #'as yet unclassified' }
Reader >> readTxt:aFile [
^((aFile readStream)next:aFile size) asString.

]

{ #category : #'initialize-release' }
Reader >> routeClass:aString [ 
^[:id|
	|routeClass|
	id='Cliente'ifTrue:[routeClass:=Cliente]
	].
]
