Class {
	#name : #DofuSmartNumberTextDecoration,
	#superclass : #DofuTextDecoration,
	#instVars : [
		'thousandsSeparator'
	],
	#category : #Dofu
}

{ #category : #operations }
DofuSmartNumberTextDecoration >> convertDecoratedPosition: index toNativeOn: aString [
	
	| stringBeforeIndex nativeString |
	stringBeforeIndex := aString copyFrom: 1 to: (index min: aString size).
	nativeString := self convertDecoratedTextToNative: stringBeforeIndex.
	
	^index - (stringBeforeIndex size - nativeString size)
]

{ #category : #operations }
DofuSmartNumberTextDecoration >> convertDecoratedTextToNative: aString [

	^aString copyReplaceAll: thousandsSeparator with: ''.
]

{ #category : #operations }
DofuSmartNumberTextDecoration >> convertNativePosition: index toDecoratedOn: aString [
	
	| nativeIndex |
	
	index = 0 ifTrue: [ ^index ].
	
	nativeIndex := 0.
	1 to: aString size do: [ :i |
		(thousandsSeparator includes: (aString at: i)) ifFalse: [ 
			nativeIndex := nativeIndex + 1.
		 ].
		nativeIndex >= index ifTrue: [ ^i ]].
	
	^aString size
]

{ #category : #operations }
DofuSmartNumberTextDecoration >> convertNativeTextToDecorated: aString [ 
	
	| decimalSeparator integerPart stream decimalPart integerStream result |
	decimalSeparator := aString detect: [ :each | each = $. or: [each = $,] ] ifNone: [ nil ].
	decimalSeparator 
		ifNil: [ integerPart := aString ]
		ifNotNil: [ stream := aString readStream.
			integerPart := stream upTo: decimalSeparator.
			decimalPart := stream upToEnd].
	
	integerPart := self convertDecoratedTextToNative: integerPart.
	result := String streamContents: [ :s |
		decimalSeparator ifNotNil: [ s nextPutAll: decimalPart reversed; nextPut: decimalSeparator].
		integerStream := integerPart reversed readStream.
		[integerStream atEnd] whileFalse: [
			s nextPutAll: (integerStream next: 3).
			integerStream atEnd ifFalse: [ s nextPutAll: thousandsSeparator].
		 ]		
	 ].

	^result reversed
]

{ #category : #operations }
DofuSmartNumberTextDecoration >> decorateInsertionOf: newString into: originalString from: startIndex to: stopIndex [
	| modifiedString |
	modifiedString := originalString copyReplaceFrom: startIndex to: stopIndex with: newString.
	^self convertNativeTextToDecorated: modifiedString
]

{ #category : #initialization }
DofuSmartNumberTextDecoration >> initialize [ 
	super initialize.
	
	thousandsSeparator := ' '
]

{ #category : #accessing }
DofuSmartNumberTextDecoration >> thousandsSeparator [
	
	^ thousandsSeparator
]

{ #category : #accessing }
DofuSmartNumberTextDecoration >> thousandsSeparator: anObject [
	
	thousandsSeparator := anObject
]
