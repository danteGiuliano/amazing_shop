Class {
	#name : #Suscripcion,
	#superclass : #Object,
	#instVars : [
		'fechaInicio',
		'fechaExpira',
		'diccionarioDescuento'
	],
	#category : #'TiendaOnline-Model'
}

{ #category : #'as yet unclassified' }
Suscripcion class >> conDescuentos:aDiccionary fechaInicio:fechaInicio fechaFinal:fechaFinal [
|temp|
temp :=self new.
temp iniciarConDescuentos:aDiccionary fechaInicio:fechaInicio fechaFinal:fechaFinal.
^temp.
]

{ #category : #'as yet unclassified' }
Suscripcion >> iniciarConDescuentos:aDiccionary fechaInicio:unaFechaInicio fechaFinal:fechaFinal [
fechaInicio :=unaFechaInicio.
fechaExpira :=fechaFinal.
diccionarioDescuento :=aDiccionary.
]
