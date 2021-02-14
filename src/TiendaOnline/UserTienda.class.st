Class {
	#name : #UserTienda,
	#superclass : #Object,
	#instVars : [
		'name',
		'password',
		'route'
	],
	#category : #'TiendaOnline-components'
}

{ #category : #initialization }
UserTienda class >> createUser:aName aPass:aPassword aId:aIdRoute [
|temp|
temp :=self new.
temp createUserLogin: aName password:aPassword  rute:aIdRoute.
^temp. 
]

{ #category : #initialization }
UserTienda class >> createWithMap:arrayMap [
|temp reader|
reader :=Reader new.
temp := self new.
temp createUserLogin:(reader parserVar:(arrayMap at:2)) password:(reader parserVar:(arrayMap at:3))  rute:(reader parserVar:(arrayMap at:4)).
^temp.
]

{ #category : #'as yet unclassified' }
UserTienda >> createUserLogin:aName password:aPassword  rute:aRoute [.
name :=aName.
password :=aPassword .
route:=aRoute.
]

{ #category : #'as yet unclassified' }
UserTienda >> getRoute [
^route.
]

{ #category : #'as yet unclassified' }
UserTienda >> validate:aUser aPass:aPass [.
^(aUser=name)&(password=aPass).
]
