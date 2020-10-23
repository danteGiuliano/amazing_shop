Class {
	#name : #Helper,
	#superclass : #Object,
	#category : #TiendaOnline
}

{ #category : #'as yet unclassified' }
Helper class >> createPanel [
^PanelView create:(PanelController create).

]

{ #category : #'as yet unclassified' }
Helper class >> createSubMenu:aSize and:aWitdh [
^SubMenuView create:aSize and:aWitdh.
]

{ #category : #'as yet unclassified' }
Helper class >> positionLeftBotton:aContent and:otherContent [
"aContent is a element to positionate in otherContent"
aContent position:(otherContent  bottomLeft+(aContent extent *0.15)*0.92).
]

{ #category : #'as yet unclassified' }
Helper class >> positionRigthMorp:aContent and:otherContent [
"a position aContent a right of the otherContent "
aContent position: otherContent bottomCenter +(otherContent extent)*0.9123
]
