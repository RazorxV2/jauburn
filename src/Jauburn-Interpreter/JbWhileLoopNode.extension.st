Extension { #name : #JbWhileLoopNode }

{ #category : #'*Jauburn-Interpreter' }
JbWhileLoopNode >> executeIn: environment [
	"Loop this using do loop until condition is false, keep executing in environment"

	[ condition evaluateIn: environment ]
		whileTrue: [ self trueStatements do: [ :s | s executeIn: environment ] ]
]
