Class {
	#name : #DofData,
	#superclass : #Object,
	#instVars : [
		'name',
		'value',
		'aspects',
		'description',
		'isReadOnly',
		'emptyValues',
		'restriction',
		'stringConverter',
		'displayDecoration'
	],
	#category : #Dofu
}

{ #category : #accessing }
DofData >> actualValue [
	^value read
]

{ #category : #accessing }
DofData >> actualValue: anObject [
	value write: anObject
]
