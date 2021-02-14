Class {
	#name : #DataBase,
	#superclass : #File,
	#instVars : [
		'collectionLogins'
	],
	#category : #'TiendaOnline-service'
}

{ #category : #running }
DataBase class >> login:aUserText password:aPasswordText [
|temp route|
temp := self new.
temp initializeAutentication.
route:=temp compareUser: aUserText aPassword:aPasswordText.
^route.
]

{ #category : #running }
DataBase class >> run [ 
|temp|
temp := self new.
temp initializePaths.
temp initializeAutentication.
^temp.
]

{ #category : #initialization }
DataBase >> aPathsRoutes [
^#('/amazingShop' '/amazingShop/user' '/amazingShop/contenidos' ).

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
|reader object|
reader :=Reader new.
object :=reader readJson:'C:/amazingShop/tiendas.json'.
collectionLogins :=reader convertToObject:object.

]

{ #category : #initialization }
DataBase >> initializePaths [
self aPathsRoutes do:[:directory| File createDirectory: directory].
self createCredentials.
]
