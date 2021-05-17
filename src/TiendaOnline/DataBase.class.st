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
DataBase class >> añadirUsuario:aCollection [
|usuario password nameShop|
usuario :=aCollection at:1.
password :=aCollection at:2.
nameShop :=aCollection at:3.
database query:'SELECT * FROM Usuario INSERT INTO Usuario (usuario,password,nombre_shop) VALUES(',usuario,',"',password,',',nameShop,')'



]

{ #category : #'as yet unclassified' }
DataBase class >> consultas:aKeyString [
]

{ #category : #'as yet unclassified' }
DataBase class >> createShop:aDirectory [ 
"Acciones para crear un shop. logica y demas"
|reader collectionClients colecctionSuscription  aModel|
reader :=Reader new.
colecctionSuscription :=reader readJson:aDirectory,'suscriptions.json'.
collectionClients :=reader readJson: aDirectory,'clients.json'.
colecctionSuscription :=reader convertToObject: colecctionSuscription .
collectionClients:= reader convertToObject:collectionClients.
aModel:=Tienda createClients:collectionClients createSuscriptions:colecctionSuscription  aId:aDirectory.
(Menu create:aModel)openInWorld.
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

{ #category : #running }
DataBase class >> login:aUserText password:aPasswordText [
|temp route|
temp := self new.
temp initializeAutentication.
route:=temp compareUser: aUserText aPassword:aPasswordText.
^route.
]

{ #category : #'as yet unclassified' }
DataBase class >> querys:aStringKey aData:aCollection [




]

{ #category : #'as yet unclassified' }
DataBase class >> registerShop:aCollection [
|values|.
values :=StringReader new formateValue:aCollection.
self runDataBase.
database query:'INSERT INTO Usuario (usuario,password,name_shop) VALUES',values.

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

{ #category : #'as yet unclassified' }
DataBase class >> updateClients:aModel [
|temp write|
write:=Write new.
temp :=aModel getIDTienda.
(File named:temp,'clients.json' asFileReference fullName)delete.
write writeCreateSton: (aModel getClients) asArray  named:temp,'clients.json'. 
]

{ #category : #'as yet unclassified' }
DataBase class >> updateSuscriptions:aModel [
|temp write|
write:=Write new.
temp :=aModel getIDTienda.
(File named:temp,'suscriptions.json' asFileReference fullName)delete.
write writeCreateSton: (aModel getSuscripciones) asArray  named:temp,'suscriptions.json'. 
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
