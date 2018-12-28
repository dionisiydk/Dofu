Class {
	#name : #DofuData,
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
DofuData >> actualValue [
	^value read
]

{ #category : #accessing }
DofuData >> actualValue: anObject [
	value write: anObject
]
