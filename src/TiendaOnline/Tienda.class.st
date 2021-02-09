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

{ #category : #'as yet unclassified' }
Tienda >> getClients [
^colectionClientes.
]
