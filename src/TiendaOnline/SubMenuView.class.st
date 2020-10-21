Class {
	#name : #SubMenuView,
	#superclass : #BorderedMorph,
	#category : #TiendaOnline
}

{ #category : #'as yet unclassified' }
SubMenuView class >> create:aSize and:aWitdh [
|temp|
temp := self new.
^temp initialize:aSize and:aWitdh.
]

{ #category : #initialization }
SubMenuView >> initialize:aSize and:aWigth [
self extent:(aSize-(60@15)). "Para establecer un padding"
self width: aWigth*0.84. "Establecer el ancho de la view."

]
