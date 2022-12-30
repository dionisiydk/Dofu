Class {
	#name : #DofuMaskTextDecorationTests,
	#superclass : #DofuTextDecorationTestCase,
	#category : #'Dofu-Tests'
}

{ #category : #running }
DofuMaskTextDecorationTests >> createTextDecoration [ 
	^DofuMaskTextDecoration mask: '+7(***)***-**-**'
]

{ #category : #tests }
DofuMaskTextDecorationTests >> testConvertingDecoratedPositionToNative [
	
	| actual |
	decoration mask: 'a***b'.

	actual := decoration convertDecoratedPosition: 3 toNativeOn: 'a123b'.
	
	self assert: actual equals: 2
]

{ #category : #tests }
DofuMaskTextDecorationTests >> testConvertingDecoratedPositionToNativeWhenAsterixAreBeginOfMask [
	
	| actual |
	decoration mask: '**ab'.

	actual := decoration convertDecoratedPosition: 1 toNativeOn: '12ab'.
	
	self assert: actual equals: 1
]

{ #category : #tests }
DofuMaskTextDecorationTests >> testConvertingDecoratedPositionToNativeWhenItIsAtEndMaskValue [
	
	| actual |
	decoration mask: 'a**cd'.
	
	actual := decoration convertDecoratedPosition: 6 toNativeOn: 'a12cd'.
	
	self assert: actual equals: 2
]

{ #category : #tests }
DofuMaskTextDecorationTests >> testConvertingDecoratedPositionToNativeWhenItIsAtEndMaskValue2 [
	
	| actual |
	decoration mask: 'a**cd'.
	
	actual := decoration convertDecoratedPosition: 5 toNativeOn: 'a12cd'.
	
	self assert: actual equals: 2
]

{ #category : #tests }
DofuMaskTextDecorationTests >> testConvertingDecoratedPositionToNativeWhenItIsAtMaskValue [
	
	| actual |
	decoration mask: 'ab***c'.
	
	actual := decoration convertDecoratedPosition: 1 toNativeOn: 'ab123b'.
	
	self assert: actual equals: 1
]

{ #category : #tests }
DofuMaskTextDecorationTests >> testConvertingDecoratedPositionToNativeWhenItIsAtMaskValue2 [
	
	| actual |
	decoration mask: 'ab***c'.
	
	actual := decoration convertDecoratedPosition: 2 toNativeOn: 'ab123b'.
	
	self assert: actual equals: 1
]

{ #category : #tests }
DofuMaskTextDecorationTests >> testConvertingDecoratedPositionToNativeWhenItIsLastAsterixAtMiddle [
	
	| actual |
	decoration mask: '8(***)***-**-**'.
	
	actual := decoration convertDecoratedPosition: 5 toNativeOn: '8(***)***-**-**'.
	
	self assert: actual equals: 3
]

{ #category : #tests }
DofuMaskTextDecorationTests >> testConvertingDecoratedPositionToNativeWhenItIsOutOfBounds [
	
	| actual |
	decoration mask: 'a**c'.

	actual := decoration convertDecoratedPosition: 10 toNativeOn: 'a12c'.
	
	self assert: actual equals: 2
]

{ #category : #tests }
DofuMaskTextDecorationTests >> testConvertingDecoratedPositionToNativeWhenItIsSingleMaskAtMiddle [
	
	| actual |
	decoration mask: 'a**b**c'.
	
	actual := decoration convertDecoratedPosition: 4 toNativeOn: 'a12b34c'.
	
	self assert: actual equals: 3
]

{ #category : #tests }
DofuMaskTextDecorationTests >> testConvertingDecoratedPositionToNativeWhenItIsZero [
	
	| actual |
	decoration mask: 'a**c'.

	actual := decoration convertDecoratedPosition: 0 toNativeOn: 'a12b'.
	
	self assert: actual equals: 0
]

{ #category : #tests }
DofuMaskTextDecorationTests >> testConvertingDecoratedPositionToNativeWhenMaskWithoutValues [
	
	| actual |
	decoration mask: 'ab'.

	actual := decoration convertDecoratedPosition: 1 toNativeOn: '12ab'.
	
	self assert: actual equals: 0
]

{ #category : #tests }
DofuMaskTextDecorationTests >> testConvertingDecoratedTextToNative [
	
	| actual |
	decoration mask: 'a***b'.
	
	actual := decoration convertDecoratedTextToNative: 'a123b'.
	
	self assert: actual equals: '123'
]

{ #category : #tests }
DofuMaskTextDecorationTests >> testConvertingDecoratedTextToNativeWhenThereAreEmptyValues [
	
	| actual |
	decoration mask: 'a***-***b'.
	
	actual := decoration convertDecoratedTextToNative: 'a1*3-*4*b'.
	
	self assert: actual equals: '1*3*4*'
]

{ #category : #tests }
DofuMaskTextDecorationTests >> testConvertingNativePositionToDecorated [
	
	| actual |
	decoration mask: 'a***b'.

	actual := decoration convertNativePosition: 2 toDecoratedOn: '123'.
	
	self assert: actual equals: 3
]

{ #category : #tests }
DofuMaskTextDecorationTests >> testConvertingNativePositionToDecoratedWhenItIsOutOfOrder [
	
	| actual |
	decoration mask: 'a**b'.

	actual := decoration convertNativePosition: 40 toDecoratedOn: '12'.
	
	self assert: actual equals: 4
]

{ #category : #tests }
DofuMaskTextDecorationTests >> testConvertingNativePositionToDecoratedWhenItIsSecondMaskPart [
	
	| actual |
	decoration mask: 'a**b**c'.

	actual := decoration convertNativePosition: 4 toDecoratedOn: '1234'.
	
	self assert: actual equals: 6
]

{ #category : #tests }
DofuMaskTextDecorationTests >> testConvertingNativePositionToDecoratedWhenMaskWithoutValues [
	
	| actual |
	decoration mask: 'ab'.

	actual := decoration convertNativePosition: 1 toDecoratedOn: 'ab'.
	
	self assert: actual equals: 2
]

{ #category : #tests }
DofuMaskTextDecorationTests >> testDecoratingInsertionIntoEmptyString [

	| actual |
	decoration mask: '8(***)***-**-**'.

	actual := decoration decorateInsertionOf: 'ABC' into: '' from: 4 to: 3.
	
	self assert: actual equals: '8(*AB)C**-**-**'
]

{ #category : #tests }
DofuMaskTextDecorationTests >> testDecoratingMultipleCharactersInsertion [
	| actual |
	decoration mask: '8(***)***-**-**'.

	actual := decoration decorateInsertionOf: 'ABCD' into: decoration mask from: 1 to: 0.
	
	self assert: actual equals: '8(ABC)D**-**-**'
]

{ #category : #tests }
DofuMaskTextDecorationTests >> testDecoratingMultipleCharactersInsertion2 [

	| actual |
	decoration mask: '8(***)***-**-**'.

	actual := decoration decorateInsertionOf: 'ABC' into: decoration mask from: 4 to: 3.
	
	self assert: actual equals: '8(*AB)C**-**-**'
]

{ #category : #tests }
DofuMaskTextDecorationTests >> testDecoratingRemovalOfMaskPartWithoutAsterixes [

	| actual |
	decoration mask: '8(***)***-**-**'.

	actual := decoration decorateInsertionOf: '' into: '8(ABC)D**-**-**' from: 6 to: 6.
		
	self assert: actual equals: '8(ABC)D**-**-**'
]

{ #category : #tests }
DofuMaskTextDecorationTests >> testDecoratingRemovalOfOneAsterixValue [

	| actual |
	decoration mask: '8(***)***-**-**'.

	actual := decoration decorateInsertionOf: '' into: '8(ABC)D**-**-**' from: 5 to: 6.
		
	self assert: actual equals: '8(AB*)D**-**-**'
]

{ #category : #tests }
DofuMaskTextDecorationTests >> testDecoratingSingleCharacterInsertion [

	| actual |
	decoration mask: '8(***)***-**-**'.

	actual := decoration decorateInsertionOf: 'A' into: decoration mask from: 1 to: 0.
	
	self assert: actual equals: '8(A**)***-**-**'
]

{ #category : #tests }
DofuMaskTextDecorationTests >> testDecoratingSingleCharacterInsertionAtSecondAsterix [
	| actual |
	decoration mask: '8(***)***-**-**'.

	actual := decoration decorateInsertionOf: 'A' into: decoration mask from: 4 to: 3.
	
	self assert: actual equals: '8(*A*)***-**-**'
]

{ #category : #tests }
DofuMaskTextDecorationTests >> testDecoratingSmallText [

	| actual |
	decoration mask: 'a***b'.
	
	actual := decoration convertNativeTextToDecorated: '12'.
	self assert: actual equals: 'a12*b'
]

{ #category : #tests }
DofuMaskTextDecorationTests >> testDecoratingTextWhichExactlyFitToMaskedValues [

	| actual |
	decoration mask: 'a***b'.
	
	actual := decoration convertNativeTextToDecorated: '123'.
	self assert: actual equals: 'a123b'
]

{ #category : #tests }
DofuMaskTextDecorationTests >> testDecoratingTooBigText [

	| actual |
	decoration mask: 'a***b'.
	
	actual := decoration convertNativeTextToDecorated: '1234'.
	self assert: actual equals: 'a123b'
]

{ #category : #tests }
DofuMaskTextDecorationTests >> testDecoratingVeryBigStringInsertion [

	| actual |
	decoration mask: '1**4**7*'.

	actual := decoration decorateInsertionOf: 'ABCDEFGHIJ' into: decoration mask from: 1 to: 0.
	
	self assert: actual equals: '1AB4CD7E'
]

{ #category : #tests }
DofuMaskTextDecorationTests >> testHasDefaultAsterix [

	self assert: decoration asterix equals: $*
]
