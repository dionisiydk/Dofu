Class {
	#name : #DofuObjectToStringConverter,
	#superclass : #DofuStringConverter,
	#category : #Dofu
}

{ #category : #operations }
DofuObjectToStringConverter >> convertObjectToString: anObject [
	^anObject displayString
]

{ #category : #operations }
DofuObjectToStringConverter >> parseObjectFromString: aString [
	self error: 'Not supported operation. Use concrete converter class for this'
]

{ #category : #testing }
DofuObjectToStringConverter >> supportsParsingFromString [
	^false
]
