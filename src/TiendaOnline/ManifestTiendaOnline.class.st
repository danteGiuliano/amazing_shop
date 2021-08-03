"
I store metadata for this package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestTiendaOnline,
	#superclass : #PackageManifest,
	#category : #'TiendaOnline-Manifest'
}

{ #category : #'code-critics' }
ManifestTiendaOnline class >> ruleRBClassNameInSelectorRuleV1FalsePositive [
	^ #(#(#(#RGPackageDefinition #(#TiendaOnline)) #'2021-06-19T22:10:26.936918-03:00') )
]

{ #category : #'code-critics' }
ManifestTiendaOnline class >> ruleRBNoClassCommentRuleV1FalsePositive [
	^ #(#(#(#RGPackageDefinition #(#TiendaOnline)) #'2021-08-03T16:54:39.095415-03:00') )
]

{ #category : #'code-critics' }
ManifestTiendaOnline class >> ruleRBUnclassifiedMethodsRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#ComponentContenidoMenu #logic #false)) #'2021-05-30T22:49:42.612472-03:00') )
]
