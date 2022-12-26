Class {
	#name : #DofuStringConverter,
	#superclass : #Object,
	#classInstVars : [
		'default'
	],
	#category : #Dofu
}

{ #category : #accessing }
DofuStringConverter class >> default [
	^default ifNil: [ default := self new ]
]

{ #category : #operations }
DofuStringConverter >> convertObjectToString: anObject [
	self subclassResponsibility 
]

{ #category : #operations }
DofuStringConverter >> parseObjectFromString: aString [
	self subclassResponsibility 
]

{ #category : #testing }
DofuStringConverter >> supportsParsingFromString [
	^true
]
