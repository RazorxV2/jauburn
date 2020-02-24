Extension { #name : #JbIfNode }

{ #category : #'*Jauburn-Interpreter' }
JbIfNode >> executeIn: environment [

	| truth |
	truth := condition evaluateIn: environment.
	truth ifTrue: [ self trueStatements do: [:s | s executeIn: environment]].
]
