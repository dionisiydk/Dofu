Class {
	#name : #DofuObjectValue,
	#superclass : #DofuDataValue,
	#instVars : [
		'content'
	],
	#category : #Dofu
}

{ #category : #accessing }
DofuObjectValue class >> content: anObject [
	^self new 
		content: anObject
]

{ #category : #accessing }
DofuObjectValue >> content [
	^ content
]

{ #category : #accessing }
DofuObjectValue >> content: anObject [
	content := anObject
]

{ #category : #accessing }
DofuObjectValue >> printOn: aStream [
	super printOn: aStream.
	
	aStream 
		nextPut: $(;
		print: content;
		nextPut: $)
]
