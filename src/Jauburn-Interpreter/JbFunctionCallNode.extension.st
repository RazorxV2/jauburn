Extension { #name : #JbFunctionCallNode }

{ #category : #'*Jauburn-Interpreter' }
JbFunctionCallNode >> evaluateIn: environment [
^self
]

{ #category : #'*Jauburn-Interpreter' }
JbFunctionCallNode >> executeIn: environment [
	self evaluateIn: environment
]
