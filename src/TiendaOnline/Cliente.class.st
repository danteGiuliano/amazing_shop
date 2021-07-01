Class {
	#name : #Cliente,
	#superclass : #FTSimpleDataSource,
	#instVars : [
		'nombre',
		'dni',
		'email',
		'listaDeSuscripcion',
		'listaContenidos',
		'colPago'
	],
	#category : #'TiendaOnline-Model'
}

{ #category : #initialization }
Cliente class >> crearCLiente:unNombre unDni:unDni unEmail:unEmail [
|temp|.
temp :=self new.
temp crearConNombre: unNombre yDni:unDni  Email:unEmail.
temp crearLista.
^temp. 
]

{ #category : #initialization }
Cliente class >> createWithSQL:aMysQuery [
|data temp nombre dni email|
data :=aMysQuery columns. "(dni,nombre,email,keyID)"
dni :=data at:1.
nombre:=data at:2.
email:=data at:3.
temp :=self new.
temp crearColleciones.
temp añadirListaMySQL:(DataBase getSuscripciones_Compradas:dni) rows.
temp añadirContenidoMySQL:(DataBase getContenidosComprados:dni)rows.
^temp crearConNombre:nombre yDni:dni Email:email. 
]

{ #category : #'as yet unclassified' }
Cliente >> SuscripcionActiva [
|tipo|
tipo :='Nil'.
listaDeSuscripcion isNotEmpty ifTrue:[
|suscripcion|
suscripcion :=listaDeSuscripcion at:1.
suscripcion fechaVigente ifTrue:[
	tipo :=suscripcion].
	].
^tipo.
]

{ #category : #'as yet unclassified' }
Cliente >> addSuscription:aSuscription [.
listaDeSuscripcion add:aSuscription.
]

{ #category : #'as yet unclassified' }
Cliente >> añadirContenido:unContenido [
listaContenidos add:unContenido.
colPago add:(Pago crearPago:unContenido precio deItem:unContenido  ySuscripcion:(self getSuscripcionActiva))
]

{ #category : #'as yet unclassified' }
Cliente >> añadirContenidoMySQL: aMySQLQuery [
	aMySQLQuery
		do: [ :instanceKey | 
			|  contenido |
			contenido := Control
				modelFuntionReturn: [ :h | h searchContenido: (instanceKey at: 4) ].
				listaContenidos add:contenido.
				]
]

{ #category : #'as yet unclassified' }
Cliente >> añadirLista:unaLista [
listaDeSuscripcion :=unaLista.
]

{ #category : #'as yet unclassified' }
Cliente >> añadirListaMySQL:aMySQLQuery [
	|counter size|
	counter :=1.
	size :=aMySQLQuery size.
	[counter <= size] whileTrue:[
	|data list  nameSuscription descuento_aplicacion descuento_pelicula descuento_libro fechaInicio fechaFin |
	data :=(aMySQLQuery at:counter) columns.
	nameSuscription:=data at:1.
	descuento_aplicacion :=data at:2.
	descuento_pelicula :=data at:3.
	descuento_libro :=data at:4.
	fechaInicio:=data at:5.
	fechaFin :=data at:6.
	list :=Dictionary newFrom:{'Aplicacion' ->descuento_aplicacion . 'Pelicula' ->descuento_pelicula.
	'Libro' ->descuento_libro.
	}.
	data :=SuscripcionComprada createWithSQL:list yFechaInicio:fechaInicio  yFechaFin:fechaFin  deNombre:nameSuscription.
	self addSuscription:data.
	counter :=counter+1.
	].
]

{ #category : #'as yet unclassified' }
Cliente >> cellColumn: column row:rowIndex [
column id = '#' ifTrue: [ ^ FTCellMorph new addMorph: rowIndex asMorph ].
column id = 'nombre' ifTrue: [ ^ self nameRow: rowIndex ].
column id= 'dni' ifTrue: [ ^self dniRow:rowIndex ].
column id= 'email' ifTrue: [ ^self emailRow:rowIndex ].
]

{ #category : #'as yet unclassified' }
Cliente >> compraSuscripcion:unaSuscripcion [
"Verificar que no exista en tu lista (:"
listaDeSuscripcion add:unaSuscripcion.
]

{ #category : #'as yet unclassified' }
Cliente >> crearColleciones [
listaDeSuscripcion :=OrderedCollection  new.
listaContenidos :=OrderedCollection new.
colPago :=OrderedCollection new.
]

{ #category : #'as yet unclassified' }
Cliente >> crearConNombre:unNombre yDni:unDni Email:unEmail [
nombre:=unNombre.
dni:=unDni.
email:=unEmail
]

{ #category : #'as yet unclassified' }
Cliente >> dniRow:rowIndex [
	^ FTCellMorph new  
		addMorphBack: (self elementAt: rowIndex) getDni asStringMorph;
		yourself
]

{ #category : #'as yet unclassified' }
Cliente >> emailRow: rowIndex [
	^ FTCellMorph new  
		addMorphBack: (self elementAt: rowIndex) getEmail asStringMorph;
		yourself
]

{ #category : #'as yet unclassified' }
Cliente >> equals:unDni [
^((dni asString)=unDni ).
]

{ #category : #'as yet unclassified' }
Cliente >> getData [
^('NOMBRE: ',nombre ,'\DNI:  ',(dni asString),'\EMAIL:  ',email) withCRs.
]

{ #category : #'as yet unclassified' }
Cliente >> getDni [
^dni.
]

{ #category : #'as yet unclassified' }
Cliente >> getEmail [
^email.
]

{ #category : #'as yet unclassified' }
Cliente >> getNombre [
^nombre.
]

{ #category : #'as yet unclassified' }
Cliente >> getSuscripcionActiva [
|suscripcion sinDescuento temp|
sinDescuento :=Dictionary  newFrom:{'Aplicacion'->0.'Pelicula'->0.'Libro'->0}.
suscripcion :=SuscripcionComprada crearSuscripcion:sinDescuento .
listaDeSuscripcion isEmpty ifTrue:[
	temp :=suscripcion.
	]ifFalse:[
	temp :=listaDeSuscripcion at:1.
	].
^temp.
]

{ #category : #'as yet unclassified' }
Cliente >> getSuscripciones_Compradas [
^listaDeSuscripcion.
]

{ #category : #'as yet unclassified' }
Cliente >> nameRow: rowIndex [
	^ FTCellMorph new  
		addMorphBack: (self elementAt: rowIndex) getNombre asStringMorph;
		yourself
]

{ #category : #'as yet unclassified' }
Cliente >> newDataSourceMatching: aFTFilter [
	| newElements |
	newElements := Array withAll: (elements select: [ :each | 
		aFTFilter matches: (self toString: each) ]).
	^ self class new elements: newElements.
]

{ #category : #'as yet unclassified' }
Cliente >> obtenerDataCompra:keyName [
| pago data|
data :=nil.
pago :=(colPago select:[:unPago| unPago equals:keyName.]).
pago isNotEmpty ifTrue:[
	pago:=pago at:1.
	data:=DataCompra crearData:nombre  enFecha:pago getFecha  yTipo:pago getSuscripcion.
	].
^data.
]

{ #category : #'as yet unclassified' }
Cliente >> pagoContenido:contenido [
^colPago select:[:unPago|unPago equals:contenido]
]

{ #category : #'as yet unclassified' }
Cliente >> poseeContenido:contenido [
|flag test|
flag:=false.
test:=colPago detect:[:unPago|unPago equals:contenido]ifNone:[nil].
test isNotNil ifTrue:[
	flag :=true.].
^true.
]

{ #category : #'as yet unclassified' }
Cliente >> toString:aCliente [
^(aCliente getDni) asString.
]
