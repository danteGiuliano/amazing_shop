Class {
	#name : #Control,
	#superclass : #Object,
	#classVars : [
		'aModel',
		'process',
		'userSesion'
	],
	#classInstVars : [
		'model',
		'view'
	],
	#category : #'TiendaOnline-Controller'
}

{ #category : #'as yet unclassified' }
Control class >> aModelInstance:aInstance [
aModel:=aInstance.
]

{ #category : #'as yet unclassified' }
Control class >> getModel [ 
^aModel.
]

{ #category : #'as yet unclassified' }
Control class >> modelFuntion:aBlock [ 
aBlock value:aModel.
]

{ #category : #'as yet unclassified' }
Control class >> modelFuntionReturn:aBlock [ 
^aBlock value:aModel.
]

{ #category : #'as yet unclassified' }
Control class >> process:numberValue [
process value:numberValue.
(process value=100) ifTrue:[process delete]


]

{ #category : #'as yet unclassified' }
Control class >> userKey [
^userSesion at:1.
]

{ #category : #'as yet unclassified' }
Control class >> userNameShop [
^userSesion at:3.
]

{ #category : #'as yet unclassified' }
Control class >> userSession:aId_user [
process :=ProgressBarMorph from: 0 to: 100.
userSesion :=aId_user.
DataBase userkey:(aId_user at:1).
aModel :=Tienda crearWithSQL.
aModel crearWithSQL. "Updatea contenidos de clientes"


]

{ #category : #'as yet unclassified' }
Control class >> userSession:aId_user process:aProcces [
process :=aProcces.process visible:true;value:10.
userSesion :=aId_user.
DataBase userkey:(aId_user at:1).
aModel :=Tienda crearWithSQL.
aModel crearWithSQL. "Updatea contenidos de clientes"
self process:100.


]
