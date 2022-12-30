Class {
	#name : #DofuStringToStringConverterTests,
	#superclass : #DofuStringConverterTestCase,
	#category : #'Dofu-Tests'
}

{ #category : #running }
DofuStringToStringConverterTests >> convertedObjectExample [
	^'test string'
]

{ #category : #running }
DofuStringToStringConverterTests >> createStringConverter [
	^DofuStringToStringConverter new
]

{ #category : #running }
DofuStringToStringConverterTests >> objectExample [
	^'test string'
]
