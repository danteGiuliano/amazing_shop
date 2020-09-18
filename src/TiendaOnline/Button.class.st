Class {
	#name : #Button,
	#superclass : #SimpleButtonMorph,
	#category : #TiendaOnline
}

{ #category : #'as yet unclassified' }
Button class >> create:aName [
|temp|.
temp:=self new.
^temp initializeButton:aName.
]

{ #category : #initialization }
Button >> initializeButton:aName [
self label:aName.
]
