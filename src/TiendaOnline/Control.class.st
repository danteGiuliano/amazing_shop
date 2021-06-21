Class {
	#name : #Control,
	#superclass : #Object,
	#classVars : [
		'aModel',
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
Control class >> userKey [
^userSesion at:1.
]

{ #category : #'as yet unclassified' }
Control class >> userNameShop [
^userSesion at:3.
]

{ #category : #'as yet unclassified' }
Control class >> userSession:aId_user [
userSesion :=aId_user.
DataBase userkey:(aId_user at:1).
aModel :=Tienda crearWithSQL.

]
