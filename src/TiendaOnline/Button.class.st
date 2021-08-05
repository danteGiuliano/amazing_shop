Class {
	#name : #Button,
	#superclass : #SimpleButtonMorph,
	#instVars : [
		'aBlock',
		'id'
	],
	#category : #'TiendaOnline-components'
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
temp label:aName.
temp extent:aSize.
temp color:Theme buttom.
temp textColor:Theme buttomText.
^temp.
]

{ #category : #initialization }
Button >> centerText [
label center:self center.
]

{ #category : #initialization }
Button >> changed [ 
self changed:self.
]

{ #category : #initialization }
Button >> close:aContent [
aContent delete.
]

{ #category : #initialization }
Button >> disable [ 
self clearTarget.
]

{ #category : #initialization }
Button >> font:aFont [
label font:aFont
]

{ #category : #initialization }
Button >> getID [
^id.
]

{ #category : #initialization }
Button >> icon:aIconMorph [.
self addMorph:aIconMorph.
aIconMorph resize:self extent.
aIconMorph center:self center.
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
Button >> mouseUp:evt [
	super mouseUp: evt.
	oldColor ifNotNil:
		["if oldColor nil, it signals that mouse had not gone DOWN
		inside me, e.g. because of a cmd-drag; in this case we want
		to avoid triggering the action!"
		self color: oldColor.
		oldColor := nil.
		(self containsPoint: evt cursorPoint) 
				ifTrue: [ actWhen == #buttonUp 
							ifTrue: [self doButtonAction]  ]
				ifFalse: [ self mouseLeave: evt "This is a balk. Note that we have left." ]].
aBlock value.
]

{ #category : #initialization }
Button >> textColor [ 
^label color.
]

{ #category : #initialization }
Button >> textColor:aColor [
label color:aColor.
]

{ #category : #initialization }
Button >> textSize:aSize [
self font:(LogicalFont
        familyName: StandardFonts defaultFont familyName
        pointSize: aSize).
self centerText
]
