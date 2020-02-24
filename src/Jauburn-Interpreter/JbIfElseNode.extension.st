Extension { #name : #JbIfElseNode }

{ #category : #'*Jauburn-Interpreter' }
JbIfElseNode >> executeIn: environment [

	| truth |

	truth := condition evaluateIn: environment.
	truth 
		ifTrue: [ self trueStatements do: [ :s | s executeIn: environment  ] ]
		ifFalse: [ self falseStatements do: [ :s | s executeIn: environment  ] ]
]
