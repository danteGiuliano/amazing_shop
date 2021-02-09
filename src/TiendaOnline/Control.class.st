Class {
	#name : #Control,
	#superclass : #Object,
	#instVars : [
		'view',
		'model'
	],
	#classVars : [
		'menu',
		'tienda'
	],
	#classInstVars : [
		'model',
		'view'
	],
	#category : #'TiendaOnline-Controller'
}

{ #category : #accessing }
Control class >> getClients [
^model getClients.
]

{ #category : #accessing }
Control class >> initializeaModel:aModel andView:aView [
|temp|
temp := self new.
temp initializeView: aView andModel:aModel.
^temp.
]

{ #category : #accessing }
Control class >> model:aBlock [ 
^Tienda changed:aBlock value.
]

{ #category : #accessing }
Control class >> new [.
super new.
model:=Tienda.
view :=Menu.
]

{ #category : #accessing }
Control class >> view:aBlock [ 
^Menu update:aBlock value.
]

{ #category : #initialization }
Control >> initializeView:aView andModel:aModel [
view:=aView.
model:=aModel.
]
