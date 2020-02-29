"
Throws error so values can be returned.
"
Class {
	#name : #ReturnException,
	#superclass : #Error,
	#category : #'Jauburn-AST'
}

{ #category : #private }
ReturnException >> isResumable [ 
	^true.
]
