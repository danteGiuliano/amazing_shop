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

{ #category : #'as yet unclassified' }
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

{ #category : #running }
DataBase class >> run [ 
|temp|
temp := self new.
temp initializePaths.
temp initializeAutentication.
^temp.
]

{ #category : #'as yet unclassified' }
DataBase class >> runDataBase [
self initializeCredentials.
database  :=MySQLDriver new.
database  connect:credentials.

]

{ #category : #initialization }
DataBase >> aPathsRoutes [
^#('amazingShop').

]

{ #category : #initialization }
DataBase >> addNewTienda:aTienda [
|write|
collectionLogins add:aTienda.
write :=Write new.
write writeCreateSton:collectionLogins asArray named:'amazingShop/tiendas.json'
]

{ #category : #initialization }
DataBase >> compareUser:aUser aPassword:aPassword [
^(collectionLogins detect:[:aUserShop|aUserShop validate: aUser aPass:aPassword ]ifNone:[nil]). 

]

{ #category : #initialization }
DataBase >> connect [ 
database  :=MySQLDriver new.
database  connect:credentials.
]

{ #category : #initialization }
DataBase >> createCredentials [
(File named:'C:/amazingShop/login.txt' asFileReference fullName)writeStream.
		
]

{ #category : #initialization }
DataBase >> data [ 
credentials:=MySQLDriverSpec new 
				database:'bqjjyahm2odbtd2jyer3';
				host:'bqjjyahm2odbtd2jyer3-mysql.services.clever-cloud.com';
				user:'ucgufhmstam0yv5o';
				password:'I990vhwVaWn9Pcv9vtIF';
				port:3306.
]

{ #category : #initialization }
DataBase >> initializeAutentication [
|reader tiendas|
reader :=Reader new.
tiendas :=reader readJson:'amazingShop/tiendas.json'.
collectionLogins :=reader convertToObject:tiendas.

]

{ #category : #initialization }
DataBase >> initializePaths [
self aPathsRoutes do:[:directory| File createDirectory: directory].
self createCredentials.
]
