Class {
	#name : #DofuTextDecoration,
	#superclass : #Object,
	#classInstVars : [
		'default'
	],
	#category : #Dofu
}

{ #category : #accessing }
DofuTextDecoration class >> default [
	^default ifNil: [ default := self new ]
]

{ #category : #operations }
DofuTextDecoration >> convertDecoratedPosition: index toNativeOn: decoratedString [

	self subclassResponsibility 
]

{ #category : #operations }
DofuTextDecoration >> convertDecoratedTextToNative: decoratedString [

	self subclassResponsibility 
]

{ #category : #operations }
DofuTextDecoration >> convertNativePosition: index toDecoratedOn: decoratedString [

	self subclassResponsibility 
]

{ #category : #operations }
DofuTextDecoration >> convertNativeTextToDecorated: nativeString [

	self subclassResponsibility 
]

{ #category : #operations }
DofuTextDecoration >> decorateInsertionOf: newString into: originalString from: startIndex to: stopIndex [
	self subclassResponsibility 
]
