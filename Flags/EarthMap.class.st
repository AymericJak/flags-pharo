"
EarthMap class to chow the entire world.
"
Class {
	#name : 'EarthMap',
	#superclass : 'Object',
	#instVars : [
		'countries'
	],
	#category : 'Flags',
	#package : 'Flags'
}

{ #category : 'accessing' }
EarthMap >> countries [

	^ countries
]

{ #category : 'accessing' }
EarthMap >> countries: anObject [

	countries := anObject
]

{ #category : 'initialization' }
EarthMap >> importCountriesFrom: aFileName [

	| xmlTree xmlNodes |
	xmlTree := self xmlTreeFromFile: aFileName.
	xmlNodes := xmlTree nodes first nodes.
	
	xmlNodes do: [ :node |
		node class = XMLElement ifTrue: [
			self importCountryFromXMLNode: node ] ]
]

{ #category : 'initialization' }
EarthMap >> importCountryFromXMLNode: aXMLElement [
	
	countries add: (EarthMapCountry new fromXML: aXMLElement)
]

{ #category : 'initialization' }
EarthMap >> initialize [

	super initialize.
	countries := OrderedCollection new
]

{ #category : 'initialization' }
EarthMap >> openPopulatedCanvas [

	self populatedCanvas open
]

{ #category : 'initialization' }
EarthMap >> populatedCanvas [

	^ RSCanvas new
		  addAll: (countries collect: [ :country | country asRSShape ]);
		  @ RSCanvasController;
		  yourself
]

{ #category : 'initialization' }
EarthMap >> xmlTreeFromFile: aFileName [

	^ aFileName asFileReference readStreamDo: [ :stream | (XMLDOMParser parse: stream) document ]
]
