Class {
	#name : #DofuStringConverterTestCase,
	#superclass : #TestCase,
	#instVars : [
		'converter'
	],
	#category : #'Dofu-Tests'
}

{ #category : #testing }
DofuStringConverterTestCase class >> isAbstract [
	^self = DofuStringConverterTestCase
]

{ #category : #running }
DofuStringConverterTestCase >> convertedObjectExample [
	self subclassResponsibility 
]

{ #category : #running }
DofuStringConverterTestCase >> createStringConverter [
	self subclassResponsibility 
]

{ #category : #running }
DofuStringConverterTestCase >> objectExample [
	self subclassResponsibility 
]

{ #category : #running }
DofuStringConverterTestCase >> setUp [
	super setUp.
	
	converter := self createStringConverter
]

{ #category : #tests }
DofuStringConverterTestCase >> testConvertingNilToString [

	| actual |
	actual := converter convertObjectToString: nil.
	
	self assert: actual isString
]

{ #category : #tests }
DofuStringConverterTestCase >> testConvertingObjectToString [

	| actual expected |
	actual := converter convertObjectToString: self objectExample.
	
	expected := self convertedObjectExample.	
	self assert: actual equals: expected
]

{ #category : #tests }
DofuStringConverterTestCase >> testHasDefaultInstance [

	self assert: converter class default == converter class default
]

{ #category : #tests }
DofuStringConverterTestCase >> testParsingObjectFromString [

	| actual expected |
	actual := converter parseObjectFromString: self convertedObjectExample.
	expected := self objectExample.
	
	self assert: actual equals: expected
]
