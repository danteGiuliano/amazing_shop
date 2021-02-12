"
SubMenuView es un contenedor basico donde los subMenu se acomodan para sus funcionalidades.
"
Class {
	#name : #SubMenuView,
	#superclass : #BorderedMorph,
	#instVars : [
		'model'
	],
	#category : #'TiendaOnline-View'
}

{ #category : #'as yet unclassified' }
SubMenuView class >> create:aSize and:aWitdh [
|temp|
temp := self new.
^temp initialize:aSize and:aWitdh.
]

{ #category : #initialization }
SubMenuView >> getModel [ 
^model.

]

{ #category : #initialization }
SubMenuView >> initialize:aSize and:aWigth [
super initialize.
self extent:(aSize-(60@15)). "Para establecer un padding"
self width: aWigth*0.84. "Establecer el ancho de la view."

]

{ #category : #initialization }
SubMenuView >> setModel:aModel [
model:=aModel.

]

{ #category : #initialization }
SubMenuView >> update [
self delete.

]
