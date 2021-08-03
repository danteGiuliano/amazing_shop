Class {
	#name : #CircleButton,
	#superclass : #CircleMorph,
	#instVars : [
		'target',
		'actionSelector',
		'arguments',
		'actWhen',
		'aBlock',
		'label',
		'oldColor'
	],
	#category : #'TiendaOnline-components'
}

{ #category : #'as yet unclassified' }
CircleButton class >> create:aName size:aSize [
|temp|.
temp:=self new.
temp textLabel:aName.
temp extent:aSize.
temp color:Theme buttom.
temp textColor:Theme buttomText.
^temp.
]

{ #category : #accessing }
CircleButton >> actWhen [
	"acceptable symbols:  #buttonDown, #buttonUp, and #whilePressed"

	^ actWhen
]

{ #category : #accessing }
CircleButton >> actWhen: condition [
	"Accepts symbols:  #buttonDown, #buttonUp, and #whilePressed, #startDrag"
	actWhen := condition.
	actWhen == #startDrag
		ifFalse: [self on: #startDrag send: nil to: nil ]
		ifTrue:[self on: #startDrag send: #doButtonAction to: self].
]

{ #category : #accessing }
CircleButton >> actionSelector [

	^ actionSelector
]

{ #category : #accessing }
CircleButton >> actionSelector: aSymbolOrString [

	(nil = aSymbolOrString or:
	 ['nil' = aSymbolOrString or:
	 [aSymbolOrString isEmpty]])
		ifTrue: [^ actionSelector := nil].

	actionSelector := aSymbolOrString asSymbol.
]

{ #category : #accessing }
CircleButton >> arguments [

	^ arguments
]

{ #category : #accessing }
CircleButton >> arguments: aCollection [

	arguments := aCollection asArray copy.
]

{ #category : #accessing }
CircleButton >> clearTarget [

	target := nil.
]

{ #category : #initialization }
CircleButton >> doButtonAction [
	"Perform the action of this button. Subclasses may override this method. The default behavior is to send the button's actionSelector to its target object with its arguments."

	(target notNil and: [actionSelector notNil]) 
		ifTrue: 
			[Cursor normal 
				showWhile: [target perform: actionSelector withArguments: arguments]].
	actWhen == #startDrag ifTrue: [oldColor ifNotNil: [self color: oldColor]]
]

{ #category : #copying }
CircleButton >> fitContents [
	| aMorph aCenter |
	aCenter := self center.
	submorphs isEmpty ifTrue: [^self].
	aMorph := submorphs first.
	self extent: aMorph extent + (borderWidth + 6).
	self center: aCenter.
	aMorph position: aCenter - (aMorph extent // 2)
]

{ #category : #'event handling' }
CircleButton >> handlesMouseDown: evt [
	^  true

]

{ #category : #accessing }
CircleButton >> handlesMouseStillDown: evt [
	^actWhen == #whilePressed
]

{ #category : #accessing }
CircleButton >> icon:aIconMorph [
self addMorph:aIconMorph.
aIconMorph resize:self extent.
aIconMorph center:self center.
]

{ #category : #initialization }
CircleButton >> initialize [
super initialize.
self borderWidth: 1.
	self color: (Color r: 0.4 g: 0.8 b: 0.6).
	self borderColor: self color darker.
	self borderStyle: BorderStyle thinGray.
actionSelector := #flash.
arguments := EmptyArray.
actWhen := #buttonUp.
self setDefaultLabel.
]

{ #category : #initialization }
CircleButton >> mouseAction:aEvent [
aBlock :=aEvent
]

{ #category : #'event handling' }
CircleButton >> mouseDown: evt [

	super mouseDown: evt.
	evt yellowButtonPressed ifTrue: [ ^self ] .
	oldColor := self fillStyle. 
	actWhen == #buttonDown
		ifTrue: [ self doButtonAction]
		ifFalse: [ self updateVisualState: evt ].
	self mouseStillDown: evt.
]

{ #category : #'event handling' }
CircleButton >> mouseMove: evt [
	actWhen == #buttonDown ifTrue: [^ self].
	self updateVisualState: evt.
]

{ #category : #'event handling' }
CircleButton >> mouseStillDown: evt [
	actWhen == #whilePressed ifFalse:[^self].
	(self containsPoint: evt cursorPoint) ifTrue:[self doButtonAction].
]

{ #category : #'event handling' }
CircleButton >> mouseStillDownStepRate [
	"Answer how often I want the #handleMouseStillDown: stepped"
	^200
]

{ #category : #accessing }
CircleButton >> mouseUp:evt [
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
CircleButton >> setActWhen [
	| selections |
	selections := #(#buttonDown #buttonUp #whilePressed #startDrag ).
	actWhen := UIManager default
				chooseFrom: (selections 
						collect: [:t | t translated])
				values: selections
				title: 'Choose one of the following conditions' translated
]

{ #category : #initialization }
CircleButton >> setActionSelector [

	| newSel |
	newSel := UIManager default
		request:
'Please type the selector to be sent to
the target when this button is pressed' translated
		initialAnswer: actionSelector.
	newSel isEmptyOrNil ifFalse: [self actionSelector: newSel].

]

{ #category : #'event handling' }
CircleButton >> setArguments [
	| newArgs newArgsArray |
	newArgs := UIManager default
		request:
			'Please type the arguments to be sent to the target
when this button is pressed separated by periods' translated
		initialAnswer: (String streamContents: [ :str | arguments do: [ :arg | arg printOn: str. str nextPutAll: '. ' ] ]).
	newArgs isEmptyOrNil ifFalse: [ 
			newArgsArray := self class compiler
				source: '{' , newArgs , '}';
				receiver: self;
				evaluate.
			self arguments: newArgsArray ]
]

{ #category : #initialization }
CircleButton >> setDefaultLabel [
label :=StringMorph new contents:''.
self addMorph:label.
label center:self center.
]

{ #category : #initialization }
CircleButton >> setTarget: evt [ 
	| rootMorphs |
	rootMorphs := self world rootMorphsAt: evt hand targetPoint.
	target := rootMorphs size > 1
				ifTrue: [rootMorphs second]
]

{ #category : #'event handling' }
CircleButton >> target [

	^ target
]

{ #category : #'event handling' }
CircleButton >> target: anObject [

	target := anObject
]

{ #category : #accessing }
CircleButton >> textLabel:aString [
label contents:aString.
label center:self center.
]

{ #category : #'event handling' }
CircleButton >> updateVisualState: evt [
	
	oldColor ifNotNil: [
		 self color: 
			((self containsPoint: evt cursorPoint)
				ifTrue: [oldColor mixed: 0.5 with: Color white]
				ifFalse: [oldColor])]
]

{ #category : #copying }
CircleButton >> veryDeepInner: deepCopier [
	"Copy all of my instance variables.  Some need to be not copied at all, but shared.  	Warning!!  Every instance variable defined in this class must be handled.  We must also implement veryDeepFixupWith:.  See DeepCopier class comment."

super veryDeepInner: deepCopier.
"target := target.		Weakly copied"
"actionSelector := actionSelector.		a Symbol"
"arguments := arguments.		All weakly copied"
actWhen := actWhen veryDeepCopyWith: deepCopier.
oldColor := oldColor veryDeepCopyWith: deepCopier.
]
