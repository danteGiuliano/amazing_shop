Class {
	#name : #DataBase,
	#superclass : #File,
	#category : #'TiendaOnline-service'
}

{ #category : #running }
DataBase class >> run [ 
|temp|
temp := self new.
temp initializePaths.
]

{ #category : #initialization }
DataBase >> aPathsRoutes [
^#('/amazingShop' '/amazingShop/user' '/amazingShop/contenidos' ).

]

{ #category : #initialization }
DataBase >> createCredentials [
(File named:'C:/amazingShop/login.txt' asFileReference fullName)writeStream.
		
]

{ #category : #initialization }
DataBase >> initializePaths [
self aPathsRoutes do:[:directory| File createDirectory: directory].
self createCredentials.
]
