Class {
	#name : #DofDataValue,
	#superclass : #Object,
	#category : #Dofu
}

{ #category : #accessing }
DofDataValue >> read [ 
	self subclassResponsibility 
]

{ #category : #accessing }
DofDataValue >> write: anObject [ 
	self subclassResponsibility 
]
