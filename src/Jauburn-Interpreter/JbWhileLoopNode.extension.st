Extension { #name : #JbWhileLoopNode }

{ #category : #'*Jauburn-Interpreter' }
JbWhileLoopNode >> executeIn: environment [

	| truth |
	truth := condition evaluateIn: environment.
	
	"Loop this using do loop until condition is false, keep executing in environment"
	truth ifTrue: [ self trueStatements do: [:s | s executeIn: environment]].
]
