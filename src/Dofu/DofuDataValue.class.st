Class {
	#name : #DofuDataValue,
	#superclass : #Object,
	#category : #Dofu
}

{ #category : #accessing }
DofuDataValue >> read [ 
	self subclassResponsibility 
]

{ #category : #accessing }
DofuDataValue >> write: anObject [ 
	self subclassResponsibility 
]
