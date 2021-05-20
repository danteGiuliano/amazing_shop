Class {
	#name : #DataBase,
	#superclass : #File,
	#instVars : [
		'collectionLogins'
	],
	#classVars : [
		'credentials',
		'database'
	],
	#category : #'TiendaOnline-service'
}

{ #category : #'as yet unclassified' }
DataBase class >> autenticationName:aName aPassWord:aPassword [
self runDataBase.
^ (database query:'SELECT * FROM Usuario WHERE Usuario.usuario="',aName,'"',' && Usuario.password="' ,aPassword,'"').
]

{ #category : #'query_pull' }
DataBase class >> getClients [
self runDataBase.
^(database query:'SELECT * FROM Cliente WHERE Cliente.usuario_name="',Control userKey,'"')rows
]

{ #category : #'query_pull' }
DataBase class >> getClients:aIdUser [
self runDataBase.
^(database query:'SELECT * FROM Cliente WHERE Cliente.usuario_name=",',aIdUser,'"').
]

{ #category : #'as yet unclassified' }
DataBase class >> getDataBase [
^database.


]

{ #category : #'as yet unclassified' }
DataBase class >> initializeCredentials [
credentials :=MySQLDriverSpec new 
				database:'bqjjyahm2odbtd2jyer3';
				host:'bqjjyahm2odbtd2jyer3-mysql.services.clever-cloud.com';
				user:'ucgufhmstam0yv5o';
				password:'I990vhwVaWn9Pcv9vtIF';
				port:3306.


]

{ #category : #'querys_up' }
DataBase class >> registerClient:aCollection [
|values dni|
dni :=aCollection at:1.
aCollection removeAt:1.
values:=StringReader new formateValue:aCollection.
"aColecction ( dni , nombre , email , usuario_name)"
self runDataBase.
database query:'INSERT INTO Cliente (dni,nombre,email,usuario_name)
VALUES(',dni,',',(StringReader new sliceChar:values pos:1).

]

{ #category : #'querys_up' }
DataBase class >> registerShop:aCollection [
|values|.
values :=StringReader new formateValue:aCollection.
self runDataBase.
^database query:'INSERT INTO Usuario (usuario,password,name_shop) VALUES',values.

]

{ #category : #running }
DataBase class >> registerShop:aNameShop aNameUser:aUserAdmin aPassword:aPassword [
|temp aUserTienda|
temp := self new.
File createDirectory:aNameShop.
(File named:aNameShop,'clients.json') writeStream.
(File named:aNameShop,'suscriptions.json') writeStream.
temp initializeAutentication.
aUserTienda :=UserTienda createUser: aUserAdmin  aPass:aPassword  aId:aNameShop.
temp addNewTienda:aUserTienda.  
]

{ #category : #'as yet unclassified' }
DataBase class >> runDataBase [
self initializeCredentials.
database  :=MySQLDriver new.
database  connect:credentials.

]
