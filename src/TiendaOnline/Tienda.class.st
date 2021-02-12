"
Clase Main de la Jerarquia.
"
Class {
	#name : #Tienda,
	#superclass : #Object,
	#instVars : [
		'colectionClientes',
		'colectionContenidos'
	],
	#category : #'TiendaOnline-Model'
}

{ #category : #updating }
Tienda class >> changed:aBlock [
^aBlock value.
]

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

{ #category : #'as yet unclassified' }
Tienda >> addClient:aClient [ 
colectionClientes add:aClient.
]

{ #category : #'as yet unclassified' }
Tienda >> getClients [
^colectionClientes.
]

{ #category : #'as yet unclassified' }
Tienda >> initializeClients:aClients [
colectionClientes :=aClients.
]

{ #category : #'as yet unclassified' }
Tienda >> initializeCollection [
colectionClientes :=OrderedCollection new.
colectionContenidos :=OrderedCollection new.
]
