"
Clase Main de la Jerarquia.
"
Class {
	#name : #Tienda,
	#superclass : #Object,
	#instVars : [
		'idTienda',
		'colectionClientes',
		'colectionContenidos',
		'coleccionSuscripciones'
	],
	#category : #'TiendaOnline-Model'
}

{ #category : #updating }
Tienda class >> crear [ 
|temp|
temp := self new.
temp initializeCollection.
^temp.

]

{ #category : #updating }
Tienda class >> crearWithSQL [ 
|temp clientes suscripciones contenidos|
temp := self new.
temp initializeCollection.
clientes :=DataBase getClients.
suscripciones :=DataBase getSuscripcion.
contenidos :=DataBase getContenidos.
clientes do:[:clientSQL|temp addClient:(Cliente createWithSQL:clientSQL)].
suscripciones do:[:clientSQL| temp addSuscription:(Descuento createWithSQL:clientSQL)].
contenidos do:[:clientSQL| temp addContenido:(Contenido createWithSQL:clientSQL)].
^temp.

]

{ #category : #updating }
Tienda class >> createClients:aCollection [
|temp|
temp :=self new.
temp initializeClients:aCollection.
^temp.
]

{ #category : #updating }
Tienda class >> createClients:aCollection aId:aIdirectoty [
|temp|
temp :=self new.
temp initializeClients:aCollection aId:aIdirectoty.
^temp.
]

{ #category : #updating }
Tienda class >> createClients:aCollectionClients createSuscriptions:aCollectionSubs aId:aIdirectoty [
|temp|
temp :=self new.
temp initializeClients:aCollectionClients initializeSuscriptions:aCollectionSubs  aId:aIdirectoty.
^temp.
]

{ #category : #'as yet unclassified' }
Tienda class >> createTienta:aIdTienda [
|temp|
temp :=self new.
temp initialize:aIdTienda.
^temp.
]

{ #category : #'as yet unclassified' }
Tienda >> actualizarCliente:unCliente [
|i size flag|
i:=1.
size :=colectionClientes size.
flag :=true.
[(i < size)&flag]whileTrue:[
	((colectionClientes at:i)getDni) = unCliente getDni  ifTrue:[
		colectionClientes at:i put:unCliente.
		flag:=false.
		].
	i:=i+1.	
	]
]

{ #category : #'as yet unclassified' }
Tienda >> addClient:aClient [ 
colectionClientes add:aClient.
]

{ #category : #'as yet unclassified' }
Tienda >> addContenido:unContenido [
colectionContenidos add:unContenido.
]

{ #category : #'as yet unclassified' }
Tienda >> addSuscription:aSuscription [
coleccionSuscripciones add:aSuscription.
]

{ #category : #'as yet unclassified' }
Tienda >> añadirSuscripcionComprada:unaSuscripcion aCliente:unCliente [
|flag i max|
i :=1.
flag :=true.
max :=colectionClientes size.
[i <= max & flag] whileTrue:[
		(colectionClientes at:i)=unCliente
		ifTrue:[
			unCliente compraSuscripcion:unaSuscripcion.
			colectionClientes at:i put:unCliente.
			flag:=false.
			].
	i:=i+1.
	]
]

{ #category : #'as yet unclassified' }
Tienda >> getClients [
^colectionClientes.
]

{ #category : #'as yet unclassified' }
Tienda >> getContenidos [
^colectionContenidos.
]

{ #category : #'as yet unclassified' }
Tienda >> getIDTienda [
^idTienda.
]

{ #category : #'as yet unclassified' }
Tienda >> getSuscripciones [
^coleccionSuscripciones.
]

{ #category : #'as yet unclassified' }
Tienda >> getSuscripciones_Compradas:aDni [
^colectionClientes detect:[:cliente|cliente equals:aDni]ifNone:[nil]

]

{ #category : #'as yet unclassified' }
Tienda >> initialize:aIdTienda [
idTienda :=aIdTienda. 
self initializeCollection.
]

{ #category : #'as yet unclassified' }
Tienda >> initializeClients:aClients initializeSuscriptions:aSubs aId:aDirectory [
colectionClientes :=aClients.
coleccionSuscripciones :=aSubs.
idTienda :=aDirectory.
]

{ #category : #'as yet unclassified' }
Tienda >> initializeCollection [
colectionClientes :=OrderedCollection new.
colectionContenidos :=OrderedCollection new.
coleccionSuscripciones :=OrderedCollection new.
]

{ #category : #'as yet unclassified' }
Tienda >> obtainSuscripcion:aSelection [
^coleccionSuscripciones detect:[:suscription| suscription equals:aSelection]ifNone:[nil].

]

{ #category : #'as yet unclassified' }
Tienda >> searchContenido:unNombre [
^colectionContenidos  detect:[:contenido|contenido equals:unNombre]ifNone:[nil].

]

{ #category : #'as yet unclassified' }
Tienda >> searchDNI:unDni [
^colectionClientes detect:[:cliente|cliente equals:unDni]ifNone:[nil].

]
