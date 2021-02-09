Class {
	#name : #Dato,
	#superclass : #FTSimpleDataSource,
	#instVars : [
		'nombre',
		'dni',
		'email'
	],
	#category : #'TiendaOnline-Model'
}

{ #category : #accessing }
Dato >> cellColumn: column row:rowIndex [
column id = '#' ifTrue: [ ^ FTCellMorph new addMorph: rowIndex asMorph ].
column id = 'Nombre' ifTrue: [ ^ self nameColumn: column row: rowIndex ].
column id= 'DNI' ifTrue: [ ^self dniColumn:column row:rowIndex ].
column id= 'EMAIL' ifTrue: [ ^self emailColumn:column row:rowIndex ].
]

{ #category : #getters }
Dato >> dni [
	^ dni
]

{ #category : #accessing }
Dato >> dniColumn: column row: rowIndex [
	^ FTCellMorph new  
		addMorphBack: (self elementAt: rowIndex) dni asStringMorph;
		yourself
]

{ #category : #getters }
Dato >> email [
	^ email
]

{ #category : #accessing }
Dato >> emailColumn: column row: rowIndex [
	^ FTCellMorph new  
		addMorphBack: (self elementAt: rowIndex) email asStringMorph;
		yourself
]

{ #category : #accessing }
Dato >> nameColumn: column row: rowIndex [
	^ FTCellMorph new  
		addMorphBack: (self elementAt: rowIndex) nombre asStringMorph;
		yourself
]

{ #category : #accessing }
Dato >> newDataSourceMatching: aFTFilter [
"method- override for activated match"
	| newElements |
	newElements := Array withAll: (elements select: [ :each | 
		aFTFilter matches: (self toString: each) ]).
	^ self class new elements: newElements
]

{ #category : #getters }
Dato >> nombre [
	^ nombre
]

{ #category : #accessing }
Dato >> toString [
^dni asString.
]
