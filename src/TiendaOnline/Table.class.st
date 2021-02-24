Class {
	#name : #Table,
	#superclass : #FTTableMorph,
	#category : #'TiendaOnline-components'
}

{ #category : #'as yet unclassified' }
Table class >> create:aCollect aCollums:stringColecction aSize:aSize [
|temp|.
temp := self new.
temp extent:aSize.
temp enableFilter.
temp explicitFunction.
temp initializeCollums:stringColecction with:aCollect.
^temp. 
]

{ #category : #initialization }
Table >> initializeCollums:aStringCollection with:aCollect [
aStringCollection do:[ :aString|
self addColumn:(FTColumn id:aString).].
self dataSource:aCollect.


]
