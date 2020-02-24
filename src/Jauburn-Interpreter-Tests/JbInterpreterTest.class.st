Class {
	#name : #JbInterpreterTest,
	#superclass : #TestCase,
	#instVars : [
		'interpreter',
		'parser'
	],
	#category : #'Jauburn-Interpreter-Tests'
}

{ #category : #utilities }
JbInterpreterTest >> interpret: aString [

	| ast |
	ast :=  parser parse: aString.
	^interpreter interpret: ast.
	
]

{ #category : #running }
JbInterpreterTest >> setUp [ 

	parser := JbParser new.
	interpreter := JbInterpreter new
]

{ #category : #tests }
JbInterpreterTest >> testAssignmentStatement [
	"comment stating purpose of message"
	
	self interpret: 'var x = 3; x = 10;'.
	self assert: (interpreter environment at: 'x') equals:10.	
	
"	self interpret: 'var x = 3; x = 10; x = x * 2;'.
	self assert: (interpreter environment at: 'x') equals:20."
]

{ #category : #tests }
JbInterpreterTest >> testComparisonOperators [
	"testing the comparison operators in JBArity2OperatorNode"

	self interpret: 'var a = 1==2;'.
	self assert: (interpreter environment at: 'a') equals: false.
	
	self interpret: 'var a = 1==1;'.
	self assert: (interpreter environment at: 'a') equals: true.
		
	self interpret: 'var a = 1<2;'.
	self assert: (interpreter environment at: 'a') equals: true.	

	self interpret: 'var a = 2<1;'.
	self assert: (interpreter environment at: 'a') equals: false.
	
	self interpret: 'var a = 1<=2;'.
	self assert: (interpreter environment at: 'a') equals: true.
	
	self interpret: 'var a = 1<=1;'.
	self assert: (interpreter environment at: 'a') equals: true.
	
	self interpret: 'var a = 2<=1;'.
	self assert: (interpreter environment at: 'a') equals: false.
	
	self interpret: 'var a = 2>1;'.
	self assert: (interpreter environment at: 'a') equals: true.
	
	self interpret: 'var a = 1>2;'.
	self assert: (interpreter environment at: 'a') equals: false.
	
	self interpret: 'var a = 2>=1;'.
	self assert: (interpreter environment at: 'a') equals: true.
	
	self interpret: 'var a = 1>=1;'.
	self assert: (interpreter environment at: 'a') equals: true.
	
	self interpret: 'var a = 1>=2;'.
	self assert: (interpreter environment at: 'a') equals: false.
	
	self interpret: 'var a = 1!=2;'.
	self assert: (interpreter environment at: 'a') equals: true.
	
		self interpret: 'var a = 2!=2;'.
	self assert: (interpreter environment at: 'a') equals: false.


]

{ #category : #running }
JbInterpreterTest >> testDeclarationBindsVariableToExpressionValue [

	self interpret: 'var x = 3 + 2 * 8;'.
	self assert: (interpreter environment at: 'x') equals: 19.
	
	self interpret: 'var x = 6;var y = 2*x;'.
	self assert: (interpreter environment at: 'y') equals: 12.
	
	self interpret: 'var x = 10;var y = x-5;'.
	self assert: (interpreter environment at: 'y') equals: 5.
	
	self interpret: 'var x = 10;var y = x/5;'.
	self assert: (interpreter environment at: 'y') equals: 2.
	
	self interpret: 'var x = 10*2;var y = x/5;var z = y*4;var w = z-8;'.
	self assert: (interpreter environment at: 'w') equals: 8.
	

	
	
]

{ #category : #running }
JbInterpreterTest >> testDeclarationCreatesVariable [

	self interpret: 'var x = 99;'.
	self assert: (interpreter environment includesKey: 'x')
]

{ #category : #running }
JbInterpreterTest >> testIfElseStatement [

	self interpret: 'var x = 0;if (1 == 2) {x = 2;} else {x = 4;}'.
	self assert: (interpreter environment at: 'x') equals: 4.
	
	self interpret: 'var x = 0;if (1 == 1) {x = 2;} else {x = 4;}'.
	self assert: (interpreter environment at: 'x') equals: 2.
	
	self interpret: 'var x = 0;if ("hello" == "bye") {x = 2;} else {x = 4;}'.
	self assert: (interpreter environment at: 'x') equals: 4.
	
	self interpret: 'var x = 0;if ("hello" == "hello") {x = 2;} else {x = 4;}'.
	self assert: (interpreter environment at: 'x') equals: 2.


	
	
	

	
	
]

{ #category : #running }
JbInterpreterTest >> testIfStatement [

	self interpret: 'var x = 0;if (1 == 1) {x = 2;}'.
	self assert: (interpreter environment at: 'x') equals: 2.
	
	self interpret: 'var x = 0;if (1 == 2) {x = 2;}'.
	self assert: (interpreter environment at: 'x') equals: 0.
	
	self interpret: 'var x = 0;if ("hello" == "bye") {x = 2;}'.
	self assert: (interpreter environment at: 'x') equals: 0.
	
	self interpret: 'var x = 0;if ("hello" == "hello") {x = 2;}'.
	self assert: (interpreter environment at: 'x') equals: 2.


	
	
	

	
	
]

{ #category : #running }
JbInterpreterTest >> testUnaryNegationOperator [

	self interpret: 'var x = -2;'.
	self assert: (interpreter environment at: 'x') equals: -2.
	
	self interpret: 'var x = -2 * 2;'.
	self assert: (interpreter environment at: 'x') equals: -4.	
	
	self interpret: 'var x = -2 * -2;'.
	self assert: (interpreter environment at: 'x') equals: 4.
	
	
	

	
	
]
