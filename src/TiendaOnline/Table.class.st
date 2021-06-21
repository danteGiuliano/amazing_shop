Class {
	#name : #Table,
	#superclass : #FTTableMorph,
	#instVars : [
		'nameColumns'
	],
	#category : #'TiendaOnline-components'
}

{ #category : #'as yet unclassified' }
Table class >> create:aCollect aCollums:stringColecction aSize:aSize [
|temp|.
temp := self new.
temp extent:aSize.
temp color:(Theme morph).
temp headerColor:(Theme morph).
temp initializeCollums:stringColecction with:aCollect.
^temp. 
]

{ #category : #initialization }
Table >> headerBorder [
container color:Color transparent.
"container height:self height*0.90."
container width:self width*0.90.
container center:self center.


]

{ #category : #initialization }
Table >> headerBorder:aNumber [
container color:Color transparent.
"container height:self height*0.90."
container width:self width*aNumber.
container center:self center.


]

{ #category : #initialization }
Table >> headerColor:aColor [
headerColor :=aColor.

]

{ #category : #initialization }
Table >> initializeCollums:aStringCollection with:aCollect [
aStringCollection do:[ :aString|
self addColumn:(FTColumn id:aString).].
self dataSource:aCollect.
nameColumns:=aStringCollection.


]

{ #category : #initialization }
Table >> searchColor:aColor [
(function showWidget) color:aColor.
]

{ #category : #initialization }
Table >> updateData:aCollection [
self dataSource:aCollection.
container width:self width*0.90.
container center:self center.

]
