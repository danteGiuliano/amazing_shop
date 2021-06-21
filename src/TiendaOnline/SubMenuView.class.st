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
SubMenuView class >> create:aContent [
|temp|
temp :=self new.
temp initialize:aContent.
^temp
]

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
SubMenuView >> initialize:aContent [
super initialize.
self extent:aContent extent.
self width: aContent right-215.
self height: aContent height-10. 
self color:Color transparent.
self borderColor:Color transparent.
]

{ #category : #initialization }
SubMenuView >> initialize:aSize and:aWigth [
|image|
super initialize.
self extent:(aSize-(60@30)). "Para establecer un padding"
self width: aWigth*0.84. "Establecer el ancho de la view."
image:=(Form fromFileNamed: 'amazingShop/background.jpg') asMorph.
image basicExtent:self extent.
Helper addCenterMorph:image in:self .


]

{ #category : #initialization }
SubMenuView >> setModel:aModel [
model :=aModel.
]

{ #category : #initialization }
SubMenuView >> update [
self delete.

]
