Class {
	#name : #DofuTextDecorationTestCase,
	#superclass : #TestCase,
	#instVars : [
		'decoration'
	],
	#category : #'Dofu-Tests'
}

{ #category : #testing }
DofuTextDecorationTestCase class >> isAbstract [
	^self = DofuTextDecorationTestCase
]

{ #category : #running }
DofuTextDecorationTestCase >> createTextDecoration [
	self subclassResponsibility 
]

{ #category : #running }
DofuTextDecorationTestCase >> setUp [
	super setUp.
	
	decoration := self createTextDecoration
]
