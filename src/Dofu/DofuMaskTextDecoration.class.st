Class {
	#name : #DofuMaskTextDecoration,
	#superclass : #DofuTextDecoration,
	#instVars : [
		'mask',
		'asterix'
	],
	#category : #Dofu
}

{ #category : #'instance creation' }
DofuMaskTextDecoration class >> mask: maskString [
	^self new 
		mask: maskString 
]

{ #category : #'instance creation' }
DofuMaskTextDecoration class >> mask: maskString asterix: aCharacter [
	^(self mask: maskString) 
		asterix: aCharacter
		
]

{ #category : #accessing }
DofuMaskTextDecoration >> asterix [
	^ asterix
]

{ #category : #accessing }
DofuMaskTextDecoration >> asterix: anObject [
	asterix := anObject
]

{ #category : #operations }
DofuMaskTextDecoration >> convertDecoratedPosition: index toNativeOn: decoratedString [ 
	| result lastMaskValue |
	index = 0 ifTrue: [ ^0 ].
	result := 0.
	mask withIndexDo: [:each :i | 
		i <= index & (each = asterix) ifTrue: [ 
			result := result + 1.
			i = index ifTrue: [ ^result ] ].
		i > index & (each = asterix) ifTrue: [ ^result + (lastMaskValue ~= asterix) asBit].
		lastMaskValue := each.
	].
	^result

]

{ #category : #operations }
DofuMaskTextDecoration >> convertDecoratedTextToNative: aString [ 
	| maskStream nextMaskChar decoratedStream nextInputChar |	
	maskStream := mask readStream.
	decoratedStream := aString readStream.

	^String new: mask size streamContents: [ :out | 	
		[maskStream atEnd or:[decoratedStream atEnd]] whileFalse: [
			nextMaskChar := maskStream next.
			nextInputChar := decoratedStream next.			
			nextMaskChar = asterix
				ifTrue: [	out nextPut: nextInputChar]]
	].
]

{ #category : #operations }
DofuMaskTextDecoration >> convertNativePosition: index toDecoratedOn: decoratedString [ 
	| nativeCounter |
	nativeCounter := 0.
	mask withIndexDo: [:each :i |  
		(each = asterix) ifTrue: [ nativeCounter := nativeCounter + 1 ].
		nativeCounter = index ifTrue: [ ^i ]
	].
	^mask size
]

{ #category : #operations }
DofuMaskTextDecoration >> convertNativeTextToDecorated: aString [ 
	| maskStream nativeStream nextMaskChar |	
	maskStream := mask readStream.
	nativeStream := aString readStream.

	^String new: mask size streamContents: [ :out | 	
		[maskStream atEnd or:[nativeStream atEnd]] whileFalse: [
			nextMaskChar := maskStream next.
			nextMaskChar = asterix 
				ifTrue: [	out nextPut: nativeStream next]
				ifFalse: [ out nextPut: nextMaskChar ]].
		[ maskStream atEnd ] whileFalse: [ out nextPut: maskStream next ]
	].
]

{ #category : #operations }
DofuMaskTextDecoration >> decorateInsertionOf: newString into: decoratedString from: startIndex to: stopIndex [
	
	| cleanedString |
	cleanedString := self deleteCharactersFrom: decoratedString startingAt: startIndex to: stopIndex.
	^self overrideCharactersFrom: cleanedString by: newString startingAt: startIndex
]

{ #category : #operations }
DofuMaskTextDecoration >> deleteCharactersFrom: decoratedString startingAt: startIndex to: stopIndex [
	
	| maskStream decoratedStream nextChar nextMaskChar |
	maskStream := mask readStream.
	decoratedStream := decoratedString readStream.
	
	^String new: mask size streamContents: [ :out | 	
		[maskStream atEnd or:[decoratedStream atEnd]] whileFalse: [
			nextChar := decoratedStream next.			
			nextMaskChar := maskStream next.
			(decoratedStream position between: startIndex and: stopIndex) ifTrue: [ 
				nextMaskChar = asterix ifTrue: [ nextChar := asterix ]].
			out nextPut: nextChar ].
		[ decoratedStream atEnd ] whileFalse: [ 
			out nextPut: decoratedStream next.
			maskStream next ].
		[ maskStream atEnd ] whileFalse: [ out nextPut: maskStream next ]
	]
]

{ #category : #initialization }
DofuMaskTextDecoration >> initialize [ 
	super initialize.
	
	asterix := $*.
	mask := 'undefined mask'
]

{ #category : #accessing }
DofuMaskTextDecoration >> mask [
	^ mask
]

{ #category : #accessing }
DofuMaskTextDecoration >> mask: anObject [
	mask := anObject
]

{ #category : #operations }
DofuMaskTextDecoration >> overrideCharactersFrom: decoratedString by: newString startingAt: startIndex [
	| maskStream decoratedStream newStream nextChar nextMaskChar |
	maskStream := mask readStream.
	decoratedStream := decoratedString readStream.
	newStream := newString readStream.

	^String new: mask size streamContents: [ :out | 	
		[maskStream atEnd or:[decoratedStream atEnd]] whileFalse: [
			nextChar := decoratedStream next.			
			nextMaskChar := maskStream next.
			decoratedStream position >= startIndex ifTrue: [ 
				nextMaskChar = asterix & newStream atEnd not ifTrue: [ 
					nextChar := newStream next ]].
			out nextPut: nextChar ].
		[ decoratedStream atEnd ] whileFalse: [ out nextPut: decoratedStream next ]
	]
]
