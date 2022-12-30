Class {
	#name : #DofuSmartNumberTextDecorationTests,
	#superclass : #DofuTextDecorationTestCase,
	#category : #'Dofu-Tests'
}

{ #category : #running }
DofuSmartNumberTextDecorationTests >> createTextDecoration [
	^DofuSmartNumberTextDecoration new
]

{ #category : #tests }
DofuSmartNumberTextDecorationTests >> testConvertingDecoratedPositionToNative [
	
	| actual |
	actual := decoration convertDecoratedPosition: 3 toNativeOn: '10 000'.
	
	self assert: actual equals: 2
]

{ #category : #tests }
DofuSmartNumberTextDecorationTests >> testConvertingDecoratedPositionToNative2 [
	
	| actual |
	actual := decoration convertDecoratedPosition: 6 toNativeOn: '10 0 00'.
	
	self assert: actual equals: 4
]

{ #category : #tests }
DofuSmartNumberTextDecorationTests >> testConvertingDecoratedPositionToNativeWhenItBeforeSeparator [
	
	| actual |
	actual := decoration convertDecoratedPosition: 6 toNativeOn: '10 000 000'.
	
	self assert: actual equals: 5
]

{ #category : #tests }
DofuSmartNumberTextDecorationTests >> testConvertingDecoratedPositionToNativeWhenItIsEndOfText [
	
	| actual |
	actual := decoration convertDecoratedPosition: 6 toNativeOn: '10 000'.
	
	self assert: actual equals: 5
]

{ #category : #tests }
DofuSmartNumberTextDecorationTests >> testConvertingDecoratedPositionToNativeWhenItIsStartOfText [
	
	| actual |
	actual := decoration convertDecoratedPosition: 0 toNativeOn: '10 000'.
	
	self assert: actual equals: 0
]

{ #category : #tests }
DofuSmartNumberTextDecorationTests >> testConvertingDecoratedTextToNative [
	
	| actual |
	actual := decoration convertDecoratedTextToNative: '10 00 0'.
	
	self assert: actual equals: '10000'
]

{ #category : #tests }
DofuSmartNumberTextDecorationTests >> testConvertingNativePositionToDecorated [
	
	| actual |
	actual := decoration convertNativePosition: 3 toDecoratedOn: '10 000'.
	
	self assert: actual equals: 4
]

{ #category : #tests }
DofuSmartNumberTextDecorationTests >> testConvertingNativePositionToDecorated2 [
	
	| actual |
	actual := decoration convertNativePosition: 4 toDecoratedOn: '10 0 00'.
	
	self assert: actual equals: 6
]

{ #category : #tests }
DofuSmartNumberTextDecorationTests >> testConvertingNativePositionToDecoratedWhenItIsOutOfBounds [
	
	| actual |
	actual := decoration convertNativePosition: 10 toDecoratedOn: '10 000'.
	
	self assert: actual equals: '10 000' size
]

{ #category : #tests }
DofuSmartNumberTextDecorationTests >> testConvertingNativePositionToDecoratedWhenItIsStartOfText [
	
	| actual |
	actual := decoration convertNativePosition: 0 toDecoratedOn: '10 000'.
	
	self assert: actual equals: 0
]

{ #category : #tests }
DofuSmartNumberTextDecorationTests >> testDecoratingEmptyText [
	
	| actual |
	actual := decoration convertNativeTextToDecorated: ''.
	
	self assert: actual equals: ''
]

{ #category : #tests }
DofuSmartNumberTextDecorationTests >> testDecoratingInsertion [
	
	| decoratedInsertion nativeInsertion |
	nativeInsertion := '10 000' copyReplaceFrom: 4 to: 3 with: '9'.
	self assert: nativeInsertion equals: '10 9000'.
	
	decoratedInsertion := decoration decorateInsertionOf: '9' into: '10 000' from: 4 to: 3.
	
	self assert: decoratedInsertion equals: '109 000'.
]

{ #category : #tests }
DofuSmartNumberTextDecorationTests >> testDecoratingTextWhichEndsWithDecimalSeparator [
	
	| actual |
	actual := decoration convertNativeTextToDecorated: '10000.'.
	
	self assert: actual equals: '10 000.'
]

{ #category : #tests }
DofuSmartNumberTextDecorationTests >> testDecoratingTextWithDecimalPartWithCommaSeparator [
	
	| actual |
	actual := decoration convertNativeTextToDecorated: '10000,2345'.
	
	self assert: actual equals: '10 000,2345'
]

{ #category : #tests }
DofuSmartNumberTextDecorationTests >> testDecoratingTextWithDecimalPartWithPeriodSeparator [
	
	| actual |
	actual := decoration convertNativeTextToDecorated: '10000.2345'.
	
	self assert: actual equals: '10 000.2345'
]

{ #category : #tests }
DofuSmartNumberTextDecorationTests >> testDecoratingTextWithOneThousandthGroup [
	
	| actual |
	actual := decoration convertNativeTextToDecorated: '10000'.
	
	self assert: actual equals: '10 000'
]

{ #category : #tests }
DofuSmartNumberTextDecorationTests >> testDecoratingTextWithTwoThousandthGroups [
	
	| actual |
	actual := decoration convertNativeTextToDecorated: '10123000'.
	
	self assert: actual equals: '10 123 000'
]

{ #category : #tests }
DofuSmartNumberTextDecorationTests >> testDecoratingTextWithoutThousands [
	
	| actual |
	actual := decoration convertNativeTextToDecorated: '10'.
	
	self assert: actual equals: '10'
]

{ #category : #tests }
DofuSmartNumberTextDecorationTests >> testHasThousandsSeparatorByDefault [
	
	self assert: decoration thousandsSeparator equals: ' '
]
