"
Clase especial para el posicionamiento de Morphic
"
Class {
	#name : #Helper,
	#superclass : #Object,
	#category : #'TiendaOnline-components'
}

{ #category : #addPosition }
Helper class >> addCenterBottomMorph:aContent in:otherContent [
otherContent addMorphCentered:aContent.
aContent bottom:(otherContent bottom).

]

{ #category : #addPosition }
Helper class >> addCenterMorph:aContent in:otherContent [
otherContent addMorphCentered:aContent.

]

{ #category : #addPosition }
Helper class >> addCenterTopMorph:aContent in:otherContent [
otherContent addMorphCentered:aContent.
aContent top:(otherContent top).

]

{ #category : #addPosition }
Helper class >> addLeftBottomMorph:aContent in:otherContent [
otherContent addMorph: aContent.
aContent bottomLeft: (otherContent bottomLeft).

]

{ #category : #addPosition }
Helper class >> addLeftCenterMorph:aContent in:otherContent [
otherContent addMorphCentered: aContent.
aContent left:(otherContent left).

]

{ #category : #addPosition }
Helper class >> addLeftTopMorphic:aContent in:otherContent [
otherContent addMorphCentered:aContent.
aContent topLeft:(otherContent topLeft).
]

{ #category : #addPosition }
Helper class >> addRightCenterMorph:aContent in:otherContent [
otherContent addMorphCentered: aContent.
aContent right: (otherContent right).

]

{ #category : #addPosition }
Helper class >> addRightTopMorph:aContent in:otherContent [
otherContent addMorphFront: aContent.
aContent topRight: (otherContent topRight).

]

{ #category : #addPosition }
Helper class >> addRightbottomMorph:aContent in:otherContent [
otherContent addMorphFront: aContent.
aContent bottomRight: (otherContent bottomRight).

]

{ #category : #PositionOut }
Helper class >> border:aMorph aColor:aColor [
aMorph borderStyle:(RoundedBorder new cornerRadius:5; width:5; color:aColor)
]

{ #category : #PositionOut }
Helper class >> border:aMorph aColor:aColor rad:aRadio [
aMorph borderStyle:(RoundedBorder new cornerRadius:aRadio; width:aRadio; color:aColor)
]

{ #category : #'as yet unclassified' }
Helper class >> createPanel:aCollection aLogic:aBlock [
|temp|
temp :=PanelView create: aCollection  aControl:aBlock . 
temp color:(Color transparent ).
^temp.
]

{ #category : #'as yet unclassified' }
Helper class >> createSubMenu:aSize and:aWitdh [
^SubMenuView create:aSize and:aWitdh.
]

{ #category : #PositionIn }
Helper class >> positionAboveContent:aContent in:otherContent [
aContent bottom: (otherContent top).
 
]

{ #category : #PositionIn }
Helper class >> positionLeftBotton:aContent in:otherContent [
"aContent is a element to positionate in otherContent"
aContent bottomLeft: (otherContent bottomLeft).
]

{ #category : #PositionOut }
Helper class >> positionOutsideRigthBottomMorp:aContent in:otherContent [
"a position aContent a right of the otherContent "
aContent bottomLeft: (otherContent bottomRight).
]

{ #category : #PositionOut }
Helper class >> positionOutsideRigthMorp:aContent in:otherContent [
"a position aContent a right of the otherContent "
aContent bottomLeft: (otherContent bottomRight).
]
