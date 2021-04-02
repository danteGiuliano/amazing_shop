Class {
	#name : #DataBase,
	#superclass : #File,
	#instVars : [
		'collectionLogins'
	],
	#category : #'TiendaOnline-service'
}

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

{ #category : #running }
DataBase class >> login:aUserText password:aPasswordText [
|temp route|
temp := self new.
temp initializeAutentication.
route:=temp compareUser: aUserText aPassword:aPasswordText.
^route.
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
(File named:temp,'suscripcion.json' asFileReference fullName)delete.
write writeCreateSton: (aModel getSuscripciones) asArray  named:temp,'suscripcions.json'. 
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
DataBase >> createCredentials [
(File named:'C:/amazingShop/login.txt' asFileReference fullName)writeStream.
		
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
