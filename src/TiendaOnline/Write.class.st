Class {
	#name : #Write,
	#superclass : #Object,
	#instVars : [
		'temp'
	],
	#category : #'TiendaOnline-Service'
}

{ #category : #writing }
Write >> updateSton:aStringFormat aArchive:aFile [
temp delete.
temp :=File named:aFile.
temp writeStreamDo: [ :stream | stream <<aStringFormat].
^temp.


]

{ #category : #writing }
Write >> updateTxt:aStringFormat aArchive:aFile [
temp delete.
temp :=File named:aFile.
temp writeStreamDo: [ :stream | stream <<aStringFormat].
^temp.


]

{ #category : #writing }
Write >> writeCreateSton:aStringFormat named:aNameArchive [
"a nameArchive, incluide a path"
|archive|
archive :=(File named:aNameArchive asFileReference fullname).
archive writeStreamDo: [ :stream | stream <<aStringFormat].

]

{ #category : #writing }
Write >> writeCreateTxt:aStringFormat named:aNameArchive [
"a nameArchive, incluide a path"
|archive|
archive :=(File named:aNameArchive asFileReference fullname).
archive writeStreamDo: [ :stream | stream <<aStringFormat].

]
