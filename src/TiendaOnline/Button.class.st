Class {
	#name : #Button,
	#superclass : #SimpleButtonMorph,
	#instVars : [
		'aBlock',
		'id'
	],
	#category : #'TiendaOnline-Components'
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
Button >> close:aContent [
aContent delete.
]

{ #category : #initialization }
Button >> getID [
^id.
]

{ #category : #initialization }
Button >> initializeButton:aName [ 
self label:aName.
id:=aName.
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
