Extension { #name : #Number }

{ #category : #'*Dofu' }
Number >> dofuDefaultStringConverter [
	^DofuNumberToStringConverter default 
]

{ #category : #'*Dofu' }
Number >> dofuDefaultTextDecoration [
	^DofuSmartNumberTextDecoration default 
]
