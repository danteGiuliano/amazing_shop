"
I store metadata for this package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestTiendaOnline,
	#superclass : #PackageManifest,
	#category : #'TiendaOnline-Manifest'
}

{ #category : #'code-critics' }
ManifestTiendaOnline class >> ruleRBUsesAddRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#ModalCliente #registerClient #false)) #'2021-05-19T21:43:23.094217-03:00') )
]
