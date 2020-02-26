Extension { #name : #JbFunctionCallNode }

{ #category : #'*Jauburn-Interpreter' }
JbFunctionCallNode >> evaluateIn: environment [

| proc |

"proc is my JBFunctionNode"
proc := environment at: identifier.

"Here I set up a new environment using call:in:"
^proc call:  (arguments collect: [:e | e evaluateIn: environment])
	in: environment. 


]

{ #category : #'*Jauburn-Interpreter' }
JbFunctionCallNode >> executeIn: environment [
	self evaluateIn: environment
]
