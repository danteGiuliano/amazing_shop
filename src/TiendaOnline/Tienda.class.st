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
Tienda >> addClient:aClient [ 
colectionClientes add:aClient.
]

{ #category : #'as yet unclassified' }
Tienda >> addSuscription:aSuscription [
coleccionSuscripciones add:aSuscription.
]

{ #category : #'as yet unclassified' }
Tienda >> getClients [
^colectionClientes.
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
