Class {
	#name : #DofuDataTest,
	#superclass : #TestCase,
	#category : #'Dofu-Tests'
}

{ #category : #tests }
DofuDataTest >> testContent [
	
	| data |
	data := 'some object' asData.
	
	data content should equal: 'some object'
]

{ #category : #tests }
DofuDataTest >> testCreationFromFloat [
	
	| data |
	data := 123.567 asData.
	
	data should beInstanceOf: DofuData.
	data value should beInstanceOf: DofuObjectValue.
	data value content should equal: 123.567.
	data textConverter should be: DofuNumberToStringConverter default.
	data textDecoration should be: DofuSmartNumberTextDecoration default
]

{ #category : #tests }
DofuDataTest >> testCreationFromInteger [
	
	| data |
	data := 123 asData.
	
	data should beInstanceOf: DofuData.
	data value should beInstanceOf: DofuObjectValue.
	data value content should equal: 123.
	data textConverter should be: DofuNumberToStringConverter default.
	data textDecoration should be: DofuSmartNumberTextDecoration default
]

{ #category : #tests }
DofuDataTest >> testCreationFromString [
	
	| data |
	data := 'some object' asData.
	
	data should beInstanceOf: DofuData.
	data value should beInstanceOf: DofuObjectValue.
	data value content should equal: 'some object'.
	data textConverter should be: DofuStringToStringConverter default
]

{ #category : #tests }
DofuDataTest >> testDisplayStringForBigFloatContent [
	
	| data actual |
	data := 123000.456 asData.
	
	actual := data displayString.
	
	actual should equal: '123 000.456'
]

{ #category : #tests }
DofuDataTest >> testDisplayStringForBigIntegerContent [
	
	| data actual |
	data := 123000 asData.
	
	actual := data displayString.
	
	actual should equal: '123 000'
]

{ #category : #tests }
DofuDataTest >> testDisplayStringForFloatContent [
	
	| data actual |
	data := 123.456 asData.
	
	actual := data displayString.
	
	actual should equal: '123.456'
]

{ #category : #tests }
DofuDataTest >> testDisplayStringForIntegerContent [
	
	| data actual |
	data := 123 asData.
	
	actual := data displayString.
	
	actual should equal: '123'
]

{ #category : #tests }
DofuDataTest >> testDisplayStringForStringContent [
	
	| data actual |
	data := 'some object' asData.
	
	actual := data displayString.
	
	actual should equal: 'some object'
]

{ #category : #tests }
DofuDataTest >> testDisplayStringWithMaskDecoration [
	
	| data actual |
	data := 12345678 asData.
	data textDecoration: (DofuMaskTextDecoration mask: '**-****-**').
	
	actual := data displayString.
	
	actual should equal: '12-3456-78'
]

{ #category : #tests }
DofuDataTest >> testHasTextConverterByDefault [
	
	| data |
	data := DofuData new.
	
	data textConverter should be: DofuStringToStringConverter default
]

{ #category : #tests }
DofuDataTest >> testHasTextDecorationByDefault [
	
	| data |
	data := DofuData new.
	
	data textDecoration should be: DofuNoTextDecoration default
]

{ #category : #tests }
DofuDataTest >> testPrinting [ 
	
	| data actual |
	data := 'some object' asData.
	
	actual := data printString.
	
	actual should equal: 'a DofuData(some object)'
]

{ #category : #tests }
DofuDataTest >> testUpdateFloatContentWithNewFormattedString [
	
	| data |
	data := 123.12 asData.
	
	data updateContentWithString: '987 456,056'.
	
	data content should equal: 987456.056
]

{ #category : #tests }
DofuDataTest >> testUpdateFloatContentWithNewString [
	
	| data |
	data := 123.12 asData.
	
	data updateContentWithString: '987.056'.
	
	data content should equal: 987.056
]

{ #category : #tests }
DofuDataTest >> testUpdateIntegerContentWithIncompleteFormattedString [
	
	| data |
	data := 123 asData.
	
	data updateContentWithString: '1 000456'.
	
	data content should equal: 1000456
]

{ #category : #tests }
DofuDataTest >> testUpdateIntegerContentWithNewFormattedString [
	
	| data |
	data := 123 asData.
	
	data updateContentWithString: '1 000 456'.
	
	data content should equal: 1000456
]

{ #category : #tests }
DofuDataTest >> testUpdateIntegerContentWithNewString [
	
	| data |
	data := 123 asData.
	
	data updateContentWithString: '987'.
	
	data content should equal: 987
]

{ #category : #tests }
DofuDataTest >> testUpdateStringContentWithNewMaskedString [
	
	| data |
	data := '1234' asData.
	data textDecoration: (DofuMaskTextDecoration mask: '**-****-**').
	data displayString should equal: '12-34**-**'.
	
	data updateContentWithString: '12-34**-78'.
	
	data content should equal: '1234**78'
]

{ #category : #tests }
DofuDataTest >> testUpdateStringContentWithNewString [
	
	| data |
	data := 'some object' asData.
	
	data updateContentWithString: 'new string'.
	
	data content should equal: 'new string'
]
