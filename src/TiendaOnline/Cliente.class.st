Class {
	#name : #Cliente,
	#superclass : #Object,
	#instVars : [
		'nombre',
		'dni',
		'email',
		'listaDeSuscripcion'
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
Cliente class >> createWithMap:arrayMap [
|temp reader|
reader :=Reader new.
temp := self new.
temp crearConNombre:( reader parserVar:(arrayMap at:2)) yDni:(reader parserVar:(arrayMap at:3))  Email:(reader parserVar:(arrayMap at:4)).
^temp.

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
listaDeSuscripcion :=OrderedCollection  new.
]
