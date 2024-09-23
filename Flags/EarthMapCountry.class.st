"
The EarthMapCountry class
"
Class {
	#name : 'EarthMapCountry',
	#superclass : 'Object',
	#instVars : [
		'svgPath',
		'name',
		'code'
	],
	#category : 'Flags',
	#package : 'Flags'
}

{ #category : 'accessing' }
EarthMapCountry >> asRSShape [
	^ RSSVGPath new svgPath: svgPath
]

{ #category : 'accessing' }
EarthMapCountry >> code [

	^ code
]

{ #category : 'accessing' }
EarthMapCountry >> code: aString [

	code := aString
]

{ #category : 'accessing' }
EarthMapCountry >> fromXML: aXMLElement [

	svgPath := aXMLElement attributeAt: 'd'.
	name := aXMLElement attributeAt: 'title'.
	code := aXMLElement attributeAt: 'id'
]

{ #category : 'accessing' }
EarthMapCountry >> inspectorShape [
	<inspectorPresentationOrder: 0 title: 'Shape'>
	
	| canvas |
	canvas := RSCanvas new.
	canvas add: self asRSShape.
	canvas @ RSCanvasController.
	^ SpRoassalInspectorPresenter new canvas: canvas; yourself
]

{ #category : 'accessing' }
EarthMapCountry >> name [

	^ name
]

{ #category : 'accessing' }
EarthMapCountry >> name: aString [

	name := aString
]

{ #category : 'printing' }
EarthMapCountry >> printOn: aStream [

	super printOn: aStream.
	aStream nextPutAll: ' ' , name , '(' , code , ')'
]

{ #category : 'accessing' }
EarthMapCountry >> svgPath [

	^ svgPath
]

{ #category : 'accessing' }
EarthMapCountry >> svgPath: aString [

	svgPath := aString
]
