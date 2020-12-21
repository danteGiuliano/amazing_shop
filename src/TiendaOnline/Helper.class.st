"
Clase especial para el posicionamiento de Morphic
"
Class {
	#name : #Helper,
	#superclass : #Object,
	#category : #'TiendaOnline-Components'
}

{ #category : #'as yet unclassified' }
Helper class >> addLeftTopMorphic:aContent in:other [
"Posiciona el panel en el origen del menu."
other addMorphCentered:aContent.
aContent position:(other innerBounds origin).
]

{ #category : #'as yet unclassified' }
Helper class >> addRightTopMorphic:aContent in:otherContent [
otherContent addMorphFront: aContent.
aContent topRight: (otherContent topRight).

]

{ #category : #'as yet unclassified' }
Helper class >> addTopCenterMorph:aContent in:otherContent [
otherContent addMorphCentered: aContent.
aContent top:(otherContent top).

]

{ #category : #'as yet unclassified' }
Helper class >> createPanel:aCollection aLogic:aBlock [
^PanelView create: aCollection  aControl:aBlock. 

]

{ #category : #'as yet unclassified' }
Helper class >> createSubMenu:aSize and:aWitdh [
^SubMenuView create:aSize and:aWitdh.
]

{ #category : #'as yet unclassified' }
Helper class >> positionLeftBotton:aContent and:otherContent [
"aContent is a element to positionate in otherContent"
aContent bottomLeft: (otherContent bottomLeft).
]

{ #category : #'as yet unclassified' }
Helper class >> positionRigthMorp:aContent and:otherContent [
"a position aContent a right of the otherContent "
aContent bottomLeft: (otherContent bottomRight).
]

{ #category : #'as yet unclassified' }
Helper class >> positionTop2Content:aContent in:otherContent [
aContent bottom: (otherContent top).
 
]
