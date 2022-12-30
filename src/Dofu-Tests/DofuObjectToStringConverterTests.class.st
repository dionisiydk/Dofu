Class {
	#name : #DofuObjectToStringConverterTests,
	#superclass : #DofuStringConverterTestCase,
	#category : #'Dofu-Tests'
}

{ #category : #running }
DofuObjectToStringConverterTests >> convertedObjectExample [
	^Object new displayString
]

{ #category : #running }
DofuObjectToStringConverterTests >> createStringConverter [
	^DofuObjectToStringConverter new
]

{ #category : #running }
DofuObjectToStringConverterTests >> objectExample [
	^Object new
]

{ #category : #tests }
DofuObjectToStringConverterTests >> testParsingObjectFromString [

	self should: [converter parseObjectFromString: 'any string'] raise: Error
]
