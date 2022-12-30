Class {
	#name : #DofuObjectValueTest,
	#superclass : #TestCase,
	#category : #'Dofu-Tests'
}

{ #category : #tests }
DofuObjectValueTest >> testPrinting [ 
	
	| value actual |
	value := DofuObjectValue content: 'some object'.
	
	actual := value printString.
	
	actual should equal: 'a DofuObjectValue(''some object'')'
]
