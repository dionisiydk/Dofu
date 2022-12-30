Class {
	#name : #DofuNumberToStringConverterTests,
	#superclass : #DofuStringConverterTestCase,
	#category : #'Dofu-Tests'
}

{ #category : #running }
DofuNumberToStringConverterTests >> convertedObjectExample [
	^'123.23'
]

{ #category : #running }
DofuNumberToStringConverterTests >> createStringConverter [
	^DofuNumberToStringConverter new
]

{ #category : #running }
DofuNumberToStringConverterTests >> objectExample [
	^123.23
]

{ #category : #tests }
DofuNumberToStringConverterTests >> testParsingCorrectStringWithCommaSeparator [

	| number |
	number := converter parseObjectFromString: '1,23'.
	self assert: number equals: 1.23
]

{ #category : #tests }
DofuNumberToStringConverterTests >> testParsingCorrectStringWithDecimalSeparatorAtTheEnd [

	| number |
	number := converter parseObjectFromString: '123.'.
	self assert: number equals: 123
]

{ #category : #tests }
DofuNumberToStringConverterTests >> testParsingCorrectStringWithDecimalSeparatorAtTheStart [

	| number |
	number := converter parseObjectFromString: '.123'.
	self assert: number equals: 0.123
]

{ #category : #tests }
DofuNumberToStringConverterTests >> testParsingCorrectStringWithOnlyDecimalSeparatorWithoutAnyDigits [

	| number |
	number := converter parseObjectFromString: '.'.
	self assert: number equals: 0
]

{ #category : #tests }
DofuNumberToStringConverterTests >> testParsingEmptyString [

	| number |
	number := converter parseObjectFromString: ''.
	self assert: number equals: nil
]

{ #category : #tests }
DofuNumberToStringConverterTests >> testParsingIncorrectStringWhichBeginsWithDigits [

	self should: [converter parseObjectFromString: '123avc'] raise: DofuBadStringFormat
]

{ #category : #tests }
DofuNumberToStringConverterTests >> testParsingIncorrectStringWithMultipleDecimalSeparators [

	self should: [converter parseObjectFromString: '1.2.3'] raise: DofuBadStringFormat
]

{ #category : #tests }
DofuNumberToStringConverterTests >> testParsingIncorrectStringWithoutDigits [

	self should: [converter parseObjectFromString: 'abc'] raise: DofuBadStringFormat
]

{ #category : #tests }
DofuNumberToStringConverterTests >> testParsingNegativeNumericString [

	| number |
	number := converter parseObjectFromString: '-1.23'.
	self assert: number equals: -1.23
]

{ #category : #tests }
DofuNumberToStringConverterTests >> testParsingNegativeNumericStringWhichHasOnlyMinusAndDot [

	| number |
	number := converter parseObjectFromString: '-.'.
	self assert: number equals: 0
]
