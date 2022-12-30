Class {
	#name : #DofuNoTextDecorationTests,
	#superclass : #DofuTextDecorationTestCase,
	#category : #'Dofu-Tests'
}

{ #category : #running }
DofuNoTextDecorationTests >> createTextDecoration [
	^DofuNoTextDecoration new
]

{ #category : #tests }
DofuNoTextDecorationTests >> testConvertingDecoratedPositionToNative [
	
	| actual |
	
	actual := decoration convertDecoratedPosition: 5 toNativeOn: 'some text'.
	self assert: actual equals: 5
]

{ #category : #tests }
DofuNoTextDecorationTests >> testConvertingDecoratedTextToNative [
	
	| actual |
	
	actual := decoration convertDecoratedTextToNative: 'some text'.
	self assert: actual equals: 'some text'
]

{ #category : #tests }
DofuNoTextDecorationTests >> testConvertingNativePositionToDecorated [
	
	| actual |
	
	actual := decoration convertNativePosition: 5 toDecoratedOn: 'some text'.
	self assert: actual equals: 5
]

{ #category : #tests }
DofuNoTextDecorationTests >> testConvertingNativeTextToDecorated [
	
	| actual |
	
	actual := decoration convertNativeTextToDecorated: 'some text'.
	self assert: actual equals: 'some text'
]

{ #category : #tests }
DofuNoTextDecorationTests >> testDecoratingInsertion [
	
	| actual |
	
	actual := decoration decorateInsertionOf: 'some string' into: '123456' from: 2 to: 4.
	
	self assert: actual equals: '1some string56'
]
