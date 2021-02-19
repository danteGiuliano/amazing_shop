Class {
	#name : #Write,
	#superclass : #Object,
	#instVars : [
		'temp'
	],
	#category : #'TiendaOnline-service'
}

{ #category : #writing }
Write >> writeCreateSton:aObject named:aNameArchive [
"a nameArchive, incluide a path"
(File named:aNameArchive asFileReference fullName)writeStreamDo:[ :stream | STON put:aObject onStream:stream.].
 

]

{ #category : #writing }
Write >> writeCreateTxt:aStringFormat named:aNameArchive [
"a nameArchive, incluide a path"
|archive|
archive :=(File named:aNameArchive asFileReference fullName).
archive writeStreamDo: [ :stream | stream <<aStringFormat].

]
