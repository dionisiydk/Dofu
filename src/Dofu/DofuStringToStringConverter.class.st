Class {
	#name : #DofuStringToStringConverter,
	#superclass : #DofuStringConverter,
	#category : #Dofu
}

{ #category : #operations }
DofuStringToStringConverter >> convertObjectToString: aString [
	^ aString asString
]

{ #category : #operations }
DofuStringToStringConverter >> parseObjectFromString: aString [
	^aString
]
