Class {
	#name : #DataBase,
	#superclass : #File,
	#category : #'TiendaOnline-Service'
}

{ #category : #running }
DataBase class >> run [ 
|temp|
temp := self new.
temp initializePaths.
]

{ #category : #initialization }
DataBase >> aPathsRoutes [
^#('/amazingShop' '/amazingShop/login' 'amazingShop/contenidos' ).

]

{ #category : #initialization }
DataBase >> createCredentials [
"(File named:'@amazingShop/Example.txt' asFileName)writeStream."
]

{ #category : #initialization }
DataBase >> initializePaths [
self aPathsRoutes do:[:directory| File createDirectory: directory].
self createCredentials.
]
