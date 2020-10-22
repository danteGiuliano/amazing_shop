Class {
	#name : #Button,
	#superclass : #SimpleButtonMorph,
	#instVars : [
		'aBlock'
	],
	#category : #TiendaOnline
}

{ #category : #'as yet unclassified' }
Button class >> create:aName [
|temp|.
temp:=self new.
^temp initializeButton:aName.
]

{ #category : #'as yet unclassified' }
Button class >> create:aName size:aSize [
|temp|.
temp:=self new.
temp initializeButton:aName.
temp extent:aSize.
^temp.
]

{ #category : #initialization }
Button >> initializeButton:aName [
self label:aName.
]

{ #category : #initialization }
Button >> mouseAction:aEvent [
aBlock :=aEvent
]

{ #category : #initialization }
Button >> mouseUp:aEvent [
super mouseUp:aEvent.
aBlock value.
]
