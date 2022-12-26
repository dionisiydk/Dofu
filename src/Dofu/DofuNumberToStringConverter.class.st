Class {
	#name : #DofuNumberToStringConverter,
	#superclass : #DofuStringConverter,
	#instVars : [
		'decimalSeparators'
	],
	#category : #Dofu
}

{ #category : #operations }
DofuNumberToStringConverter >> convertObjectToString: aNumber [
	^aNumber displayString
]

{ #category : #accessing }
DofuNumberToStringConverter >> decimalSeparators [
	^ decimalSeparators
]

{ #category : #accessing }
DofuNumberToStringConverter >> decimalSeparators: anObject [
	decimalSeparators := anObject
]

{ #category : #initialization }
DofuNumberToStringConverter >> initialize [
	super initialize.
	
	decimalSeparators := #($, $.)
]

{ #category : #operations }
DofuNumberToStringConverter >> normalizeNumericString: aString [
	| result signed |
	result := aString copyReplaceAll: ',' with: '.'.
	signed := aString first = $-.
	signed ifTrue: [ result := result allButFirst ].
	
	(decimalSeparators includes: result first) ifTrue: [ result := '0', result ].
	^signed 
		ifTrue: [ '-', result ]
		ifFalse: [result]
]

{ #category : #operations }
DofuNumberToStringConverter >> parseObjectFromString: aString [
	| digitCount separatorCount normalizedString signed |
	aString ifEmpty: [ ^nil ].
	normalizedString := self normalizeNumericString: aString.
	signed := normalizedString first = $-.
	digitCount := 0.
	separatorCount := 0.
	normalizedString do: [ :char | 
		char isDigit 
			ifTrue: [ digitCount := digitCount + 1 ]
			ifFalse: [ (decimalSeparators includes: char) 
				ifTrue: [separatorCount := separatorCount + 1]]
	].
	digitCount + (separatorCount min: 1) + signed asBit = normalizedString size 
		ifFalse: [ DofuBadStringFormat signal ].
	^normalizedString asNumber
]
