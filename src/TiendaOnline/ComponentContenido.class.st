Class {
	#name : #ComponentContenido,
	#superclass : #BorderedMorph,
	#instVars : [
		'nombre',
		'precio',
		'fechaInicio',
		'verCompras'
	],
	#category : #'TiendaOnline-components'
}

{ #category : #'as yet unclassified' }
ComponentContenido class >> createComponentAName:aName aPrecio:aPrice aFecha:aFecha [
|temp|
temp := self new.
temp initializeName:aName aPrice:aPrice aFecha:aFecha.
^temp .
]

{ #category : #initialization }
ComponentContenido >> data:aName aPrice:aPrice aFecha:aFecha [.
nombre contents:nombre contents,' ',aName.
precio  contents:precio contents,' ',aPrice asString.
fechaInicio  contents:fechaInicio contents,' ',aFecha.

]

{ #category : #initialization }
ComponentContenido >> defineMorph [
self extent:600@100.
verCompras:=Button create:'Ver Compras' size:100@30.

nombre :=StringMorph new contents:'Nombre: '.
fechaInicio :=StringMorph new contents:'Fecha Inicio: '.
precio :=StringMorph new contents:'Precio: '.

Helper addLeftTopMorphic: nombre in: self.
Helper addLeftBottomMorph: fechaInicio in: self.
Helper addLeftCenterMorph: precio in: self.
 
Helper addRightCenterMorph: verCompras in:self. 

]

{ #category : #initialization }
ComponentContenido >> initializeName:aName aPrice:aPrice aFecha:aFecha [
super initialize.
self defineMorph.
self style.
self data:aName aPrice:aPrice aFecha:aFecha.
]

{ #category : #initialization }
ComponentContenido >> style [ 
nombre left:self left +30.
nombre top:self top+15.

precio left:nombre left.
fechaInicio left:nombre left.

precio top:nombre bottom+5.
fechaInicio top:precio bottom +5.

verCompras right:self right -60.

"Style morph"
self color:(Theme morph).
Helper border: self aColor: (Theme morph)  rad:3. 

verCompras  color:(Theme buttom ).
verCompras textColor:(Theme buttomText).

Helper border: verCompras aColor:(Theme buttom) rad:3.

nombre font:StandardFonts  codeFont.
fechaInicio  font:StandardFonts  codeFont.
precio font:StandardFonts  codeFont.
]
