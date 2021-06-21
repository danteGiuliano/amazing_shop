Class {
	#name : #ComponentContenidoMenu,
	#superclass : #BorderedMorph,
	#instVars : [
		'inputNombre',
		'inputPrecio',
		'tipo',
		'buttomAplicacion',
		'buttomLibro',
		'buttomPelicula',
		'crear'
	],
	#category : #'TiendaOnline-components'
}

{ #category : #'ffi-calls' }
ComponentContenidoMenu class >> call [ 
|temp|
temp :=self new.
temp initialize.
^temp.
]

{ #category : #initialization }
ComponentContenidoMenu >> addButtoms [
buttomAplicacion:=Button create:'Aplicacion' size:70@30.
buttomLibro :=Button create:'Libro' size:70@30.    
buttomPelicula :=Button create:'Pelicula' size:70@30.
crear :=Button create:'Crear' size:70@30.

Helper addRightbottomMorph:crear in:self.
Helper addCenterBottomMorph: buttomAplicacion   in:self.
Helper addCenterBottomMorph: buttomLibro   in:self.
Helper addCenterBottomMorph: buttomPelicula   in:self.
]

{ #category : #initialization }
ComponentContenidoMenu >> addInputs [
inputPrecio :=TextBox create:'Ingrese un precio' size:200@30.
inputNombre :=TextBox create:'Ingrese un nombre' size:200@30.

Helper addCenterBottomMorph: inputNombre  in:self.  
Helper addCenterBottomMorph: inputPrecio  in:self.
]

{ #category : #initialization }
ComponentContenidoMenu >> defineMorph [
self extent:350@150.
self color:Theme morph.
Helper border: self aColor:Theme morph  rad:3.
]

{ #category : #initialization }
ComponentContenidoMenu >> initialize [
super initialize.
self defineMorph.
self addButtoms.
self addInputs.
self style.
self logic.

]

{ #category : #'as yet unclassified' }
ComponentContenidoMenu >> logic [ 
buttomAplicacion mouseAction:[
	tipo:='Aplicacion'.
	Helper border: buttomAplicacion  aColor:Color red  rad:3.
	Helper border: buttomLibro  aColor:Theme buttom   rad:3.
	Helper border: buttomPelicula  aColor:Theme buttom  rad:3.
	].
buttomLibro mouseAction:[
	tipo:='Libro'.
Helper border: buttomAplicacion  aColor:Theme buttom  rad:3.
Helper border: buttomLibro  aColor:Color red  rad:3.
Helper border: buttomPelicula  aColor:Theme buttom  rad:3.
	].
buttomPelicula mouseAction:[
	tipo:='Pelicula'.
	Helper border: buttomAplicacion  aColor:Theme buttom  rad:3.
Helper border: buttomLibro  aColor:Theme buttom   rad:3.
Helper border: buttomPelicula  aColor:Color red  rad:3.
	].
crear mouseAction:[
	tipo isNotNil ifTrue:[
		((inputNombre text) ='' )& ((inputPrecio text) ='' )ifFalse:[
			|nombre precio contenido|
			nombre :=(inputNombre text)asString.precio:=(inputPrecio text)asString.
			contenido:=(tipo asClass)nombreContenido:nombre yPrecio:precio .
			DataBase registerContenidoNombre:(inputNombre text )asString yPrecio:(inputPrecio text)asString  conFecha:(Date today yyyymmdd)  deCategoria:tipo. 
			Control modelFuntion: [:h| h addContenido:contenido ].
			inputNombre setText:''.
			inputPrecio setText:''.
			Helper border: buttomAplicacion  aColor:Theme buttom  rad:3.
			Helper border: buttomLibro  aColor:Theme buttom   rad:3.
			Helper border: buttomPelicula  aColor:Theme buttom  rad:3.
			].
		].
	
	].
]

{ #category : #initialization }
ComponentContenidoMenu >> style [
"Styles inputs."
inputNombre left: self left+20.
inputNombre top: self top +20.
inputPrecio left: inputNombre left.
inputPrecio top: inputNombre bottom+10.

"Styles buttoms."
buttomAplicacion left:self left +10 .
buttomAplicacion bottom:self bottom-20.

buttomPelicula  right:self right -10.
buttomPelicula bottom:buttomAplicacion bottom.

buttomLibro center:(buttomAplicacion right+buttomPelicula left)/2.
buttomLibro bottom:buttomAplicacion bottom.

crear top: inputNombre bottom.
crear right: self right -10.

buttomAplicacion color:Theme buttom.
buttomLibro color:Theme buttom.
buttomPelicula color:Theme buttom.
buttomAplicacion textColor:Theme buttomText.
buttomPelicula textColor:Theme buttomText.
buttomLibro textColor:Theme buttomText.
crear color:Color transparent.
crear textColor:(Color black).
crear borderColor:(Color transparent). 

Helper border: buttomAplicacion  aColor:Theme buttom  rad:3.
Helper border: buttomLibro  aColor:Theme buttom   rad:3.
Helper border: buttomPelicula  aColor:Theme buttom  rad:3.


crear font:(StandardFonts codeFont).
]
