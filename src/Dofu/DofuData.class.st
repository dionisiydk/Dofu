Class {
	#name : #DofuData,
	#superclass : #Object,
	#instVars : [
		'value',
		'name',
		'description',
		'aspects',
		'isReadOnly',
		'emptyValues',
		'restriction',
		'textDecoration',
		'textConverter'
	],
	#category : #Dofu
}

{ #category : #accessing }
DofuData class >> value: aDataValue [
	^self new 
		value: aDataValue;
		useDefaultSettings
]

{ #category : #accessing }
DofuData >> content [
	^value content
]

{ #category : #printing }
DofuData >> displayStringOn: aStream [
	
	| stringValue decoratedText |
	stringValue := textConverter convertObjectToString: self content.
	decoratedText := textDecoration convertNativeTextToDecorated: stringValue.
	aStream nextPutAll: decoratedText
	
]

{ #category : #initialization }
DofuData >> initialize [ 	
	super initialize.
	
	textConverter := DofuStringToStringConverter default.
	textDecoration := DofuNoTextDecoration default
]

{ #category : #printing }
DofuData >> printOn: aStream [
	super printOn: aStream.
	
	aStream nextPut: $(.
	self displayStringOn: aStream.
	aStream nextPut: $)
]

{ #category : #accessing }
DofuData >> textConverter [
	^ textConverter
]

{ #category : #accessing }
DofuData >> textConverter: anObject [
	textConverter := anObject
]

{ #category : #accessing }
DofuData >> textDecoration [
	^ textDecoration
]

{ #category : #accessing }
DofuData >> textDecoration: anObject [
	textDecoration := anObject
]

{ #category : #updating }
DofuData >> updateContentWithString: newStringValue [
	
	| undecoratedString newValue |
	undecoratedString := textDecoration convertDecoratedTextToNative: newStringValue.
	newValue := textConverter parseObjectFromString: undecoratedString.
	value content: newValue
]

{ #category : #initialization }
DofuData >> useDefaultSettings [
	| content |
	content := self content.
	textConverter := content dofuDefaultStringConverter.
	textDecoration := content dofuDefaultTextDecoration.
]

{ #category : #accessing }
DofuData >> value [
	^ value
]

{ #category : #accessing }
DofuData >> value: anObject [
	value := anObject
]
