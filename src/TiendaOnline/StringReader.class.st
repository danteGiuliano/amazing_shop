Class {
	#name : #StringReader,
	#superclass : #String,
	#instVars : [
		'temp'
	],
	#category : #'TiendaOnline-service'
}

{ #category : #'as yet unclassified' }
StringReader >> posLeft:aString char:char [
|count flag|
count:=1.flag:=true.
[count <=(aString size) & flag.] whileTrue:[
		(aString at:count )=char ifTrue:[
			flag:=false.
			]ifFalse:[
			count:=count+1.
			].
	].
^count.
]

{ #category : #'as yet unclassified' }
StringReader >> posRight:aString char:char [
|count flag|
count:=aString size.flag:=true.
[count >=1 & flag.] whileTrue:[
		(aString at:count )=char ifTrue:[
			flag:=false.
			]ifFalse:[
			count:=count-1.
			].
	].
^count.
]

{ #category : #'as yet unclassified' }
StringReader >> slice:aString min:min max:max [ 
	|cadena recorrido|
		recorrido :=(max-min)abs. "value absolute"
		cadena:=''.
		0 to:recorrido do:[:count|
				cadena :=cadena,(aString at:min+count)asString.
			].
		^cadena.
]

{ #category : #'as yet unclassified' }
StringReader >> sliceChar:aString pos:aPos [ 
"delete a char in position"
|count aNewString|.
count :=1.aNewString :=''.
[count <= (aString size)] whileTrue:[
		(count = aPos)ifFalse:[
				aNewString :=aNewString,(aString at:count)asString.
			].
		count:=count+1.
	].
^aNewString.
]
