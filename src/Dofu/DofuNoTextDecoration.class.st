Class {
	#name : #DofuNoTextDecoration,
	#superclass : #DofuTextDecoration,
	#category : #Dofu
}

{ #category : #operations }
DofuNoTextDecoration >> convertDecoratedPosition: index toNativeOn: decoratedString [

	^index
]

{ #category : #operations }
DofuNoTextDecoration >> convertDecoratedTextToNative: decoratedString [

	^decoratedString
]

{ #category : #operations }
DofuNoTextDecoration >> convertNativePosition: index toDecoratedOn: decoratedString [

	^index
]

{ #category : #operations }
DofuNoTextDecoration >> convertNativeTextToDecorated: nativeString [

	^nativeString
]

{ #category : #operations }
DofuNoTextDecoration >> decorateInsertionOf: newString into: originalString from: startIndex to: stopIndex [
	
	^originalString copyReplaceFrom: startIndex to: stopIndex with: newString
]
