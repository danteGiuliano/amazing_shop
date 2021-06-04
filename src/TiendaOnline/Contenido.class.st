Class {
	#name : #Contenido,
	#superclass : #Object,
	#instVars : [
		'precio',
		'nombre',
		'fecha'
	],
	#category : #'TiendaOnline-Model'
}

{ #category : #'as yet unclassified' }
Contenido class >> createWithSQL:aMySQLquery [
|temp unNombre unPrecio unaFecha aCollection|
aCollection :=aMySQLquery columns.
unNombre :=aCollection at:1.
unPrecio :=aCollection at:2.
unaFecha :=aCollection at:3.
temp :=(aCollection at:3)asClass new.
temp crearConNombre:unNombre dePrecio:unPrecio yFecha:unaFecha.
^temp.
]

{ #category : #'as yet unclassified' }
Contenido class >> nombreContenido:unNombre yPrecio:unPrecio [
|temp|
temp :=self new.
temp nombreContenido:unNombre yPrecio:unPrecio.
^temp.
]

{ #category : #accessing }
Contenido >> crearConNombre:unNombre dePrecio:unPrecio yFecha:unaFecha [
nombre :=unNombre.
precio :=unPrecio.
fecha :=unaFecha.
]

{ #category : #accessing }
Contenido >> fecha [
^fecha.
]

{ #category : #accessing }
Contenido >> name [ 
^nombre
]

{ #category : #'as yet unclassified' }
Contenido >> nombreContenido:unNombre yPrecio:unPrecio [
nombre :=unNombre.
precio :=unPrecio.
fecha :=Date today yyyymmdd.

]

{ #category : #accessing }
Contenido >> precio [
^precio.
]
