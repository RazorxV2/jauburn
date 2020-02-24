Extension { #name : #JbFunctionNode }

{ #category : #'*Jauburn-Interpreter' }
JbFunctionNode >> evaluateIn: environment [

| jbFunc |
jbFunc := JbFunction new.

jbFunc body: self body.
jbFunc environment: environment.
jbFunc parameters: self parameters.


^jbFunc
]
