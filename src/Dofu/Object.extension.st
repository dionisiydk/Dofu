Extension { #name : #Object }

{ #category : #'*Dofu' }
Object >> asData [
	^DofuData value: (DofuObjectValue content: self)
]

{ #category : #'*Dofu' }
Object >> dofuDefaultStringConverter [
	^DofuStringToStringConverter default 
]

{ #category : #'*Dofu' }
Object >> dofuDefaultTextDecoration [
	^DofuNoTextDecoration default 
]
