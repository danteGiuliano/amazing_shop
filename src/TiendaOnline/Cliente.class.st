Class {
	#name : #Cliente,
	#superclass : #Object,
	#instVars : [
		'nombre',
		'dni',
		'email',
		'listaDeSuscripcion'
	],
	#category : #'TiendaOnline-Controller'
}

{ #category : #initialization }
Cliente class >> createWithMap:arrayMap [.
"
arrayMap.
1 - class
2 - var:info
3 - var:info
.....
orderd by class implemented.
"


]

{ #category : #'as yet unclassified' }
Cliente >> añadirLista:unaLista [
listaDeSuscripcion :=unaLista.
]

{ #category : #'as yet unclassified' }
Cliente >> crearConNombre:unNombre yDni:unDni Email:unEmail [
nombre:=unNombre.
dni:=unDni.
email:=unEmail
]

{ #category : #'as yet unclassified' }
Cliente >> crearLista [
listaDeSuscripcion :=OrderedCollection new.
]
