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
JbInterpreterTest >> interpret: expression assertVar: var equals: value [

self interpret: expression.
self assert: (interpreter environment at: var) equals: value.
]

{ #category : #running }
JbInterpreterTest >> setUp [ 

	parser := JbParser new.
	interpreter := JbInterpreter new
]

{ #category : #'primitive tests' }
JbInterpreterTest >> testAbsBinding [
"tests abs primitive"
self interpret: 'var y = abs(-7);' assertVar: 'y' equals: 7.
self interpret: 'var y = abs(7);' assertVar: 'y' equals: 7.
self interpret: 'var y = abs(5-7);' assertVar: 'y' equals: 2.
self interpret: 'var y = abs(5*-7);' assertVar: 'y' equals: 35.





	


	
	
]

{ #category : #'primitive tests' }
JbInterpreterTest >> testAsFloatBinding [

self interpret: 'var y = 17/8; var x = float(y);' assertVar: 'x' equals: 2.125.
self interpret: 'var y = 17/17; var x = float(y);' assertVar: 'x' equals: 1.
self interpret: 'var y = 17/10; var x = float(y);' assertVar: 'x' equals: 1.7.





	


	
	
]

{ #category : #tests }
JbInterpreterTest >> testAssignmentStatement [
	
	self interpret: 'var x = 3; x = 10;'.
	self assert: (interpreter environment at: 'x') equals:10.	
	
	self interpret: 'var x = 3; x = 10; x = x * 2;'.
	self assert: (interpreter environment at: 'x') equals:20.
	
	self interpret: 'var x = 3;var y = 5; x = 10; y = 4; x = x * y;'.
	self assert: (interpreter environment at: 'x') equals:40.
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

{ #category : #'primitive tests' }
JbInterpreterTest >> testConcatBinding [

self interpret: 'var y = concat("Hello", " World");' assertVar: 'y' equals: 'Hello World'.
self interpret: 'var y = concat("More", "Tests");' assertVar: 'y' equals: 'MoreTests'.



	


	
	
]

{ #category : #running }
JbInterpreterTest >> testDeclarationBindsVariableToExpressionValue [

	self interpret: 'var x = 3 + 2 * 8;' assertVar: 'x' equals: 19.
	
	self interpret: 'var x = 6;var y = 2*x;'.
	self assert: (interpreter environment at: 'y') equals: 12.
	
	self interpret: 'var x = 10;var w = 5;var y = x-w;'.
	self assert: (interpreter environment at: 'y') equals: 5.
	
	self interpret: 'var x = 10;var y = x/5;'.
	self assert: (interpreter environment at: 'y') equals: 2.
	
	self interpret: 'var x = 10*2;var y = x/5;var z = y*4;var w = z-8;'.
	self assert: (interpreter environment at: 'w') equals: 8.
	
	self interpret: 'var x = abs(-10);var y = x/5;'.
	self assert: (interpreter environment at: 'y') equals: 2.
	
		self interpret: 'var y = 1/5;'.
	self assert: (interpreter environment at: 'y') equals: 1/5.
	

	
	
]

{ #category : #running }
JbInterpreterTest >> testDeclarationCreatesVariable [

	self interpret: 'var x = 99;'.
	self assert: (interpreter environment includesKey: 'x')
]

{ #category : #running }
JbInterpreterTest >> testFunctionCallNode [

self interpret: 'var x = 0;var y = function (a, b) {x = a + b;};'.
self assert: (interpreter environment includesKey: 'y').
self interpret: 'y(5, 2);'.
self assert: (interpreter environment at: 'x') equals: 7.

self interpret: 'var x = 0;var z = function (a, b) {if(a > b){x = a*10;} else{x = b;}};'.
self interpret: 'z(5, 2);'.
self assert: (interpreter environment at: 'x') equals: 50.

self interpret: 'var x = 0;var z = function (a, b) {if(a > b){x = a*10;} else{x = b;}};'.
self interpret: 'z(1, 10);'.
self assert: (interpreter environment at: 'x') equals: 10.

self interpret: 'var x = 0;var y = function (a, b) {x = a + b;};'.
self assert: (interpreter environment includesKey: 'y').
self interpret: 'var z = mod(10, 3);y(10, z);'.
self assert: (interpreter environment at: 'x') equals: 11.
	


	
	
]

{ #category : #running }
JbInterpreterTest >> testFunctionNode [


self interpret: 'var x = function (a, b) {a = 0; b = 0;};'.
self assert: (interpreter environment includesKey: 'x').



	
	
	

	
	
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

	self interpret: 'var x = 0;if (1 == 2) {x = 2;}'.
	self assert: (interpreter environment at: 'x') equals: 0.
	
	self interpret: 'var x = 0;if (1 == 1) {x = 2;}'.
	self assert: (interpreter environment at: 'x') equals: 2.
	
	self interpret: 'var x = 0;if ("hello" == "bye") {x = 2;}'.
	self assert: (interpreter environment at: 'x') equals: 0.
	
	self interpret: 'var x = 0;if ("hello" == "hello") {x = 2;}'.
	self assert: (interpreter environment at: 'x') equals: 2.



	
	
	

	
	
]

{ #category : #'primitive tests' }
JbInterpreterTest >> testInputBinding [
	| mu |
	mu := JbMockUIManager new.
	interpreter uimanager: mu.
	
	mu contents: 'blah'.
	self interpret: 'input("Type blah");'.
	self assert: mu contents equals: 'blah'.
	

	


	
	

]

{ #category : #'primitive tests' }
JbInterpreterTest >> testLengthBinding [

self interpret: 'var y = length("12345");' assertVar: 'y' equals: 5.
self interpret: 'var y = length("");' assertVar: 'y' equals: 0.
self interpret: 'var y = length("Hello World");' assertVar: 'y' equals: 11.



	


	
	
]

{ #category : #'primitive tests' }
JbInterpreterTest >> testModBinding [

self interpret: 'var y = mod(10, 5);' assertVar: 'y' equals: 0.
self interpret: 'var y = mod(10, 3);' assertVar: 'y' equals: 1.
self interpret: 'var y = mod(10, 4);' assertVar: 'y' equals: 2.
self interpret: 'var y = mod(0, 4);' assertVar: 'y' equals: 0.




	


	
	
]

{ #category : #'primitive tests' }
JbInterpreterTest >> testNotBinding [

self interpret: 'var y = not(true);' assertVar: 'y' equals: false.
self interpret: 'var y = not(false);' assertVar: 'y' equals: true.




	


	
	
]

{ #category : #'primitive tests' }
JbInterpreterTest >> testPrintBinding [
	| mt |
	mt := JbMockTranscript new.
	interpreter transcript: mt.
	
	self interpret: 'print(42);'.
	self assert: mt contents equals: '42'.
	
		self interpret: 'print("Hello");'.
	self assert: mt contents equals: '42''Hello'''.
	
	self interpret: 'print("Hello World");'.
	self assert: mt contents equals: '42''Hello''''Hello World'''.
	

	
	
	

]

{ #category : #'primitive tests' }
JbInterpreterTest >> testPrintlnBinding [
	| mt |
	mt := JbMockTranscript new.
	interpreter transcript: mt.
	
	self interpret: 'println(42);'.
	self assert: mt contents equals: '42'.
	
	self interpret: 'println("Hello");'.
	self assert: mt contents equals: '42''Hello'''.
	
	self interpret: 'println("Hello World");'.
	self assert: mt contents equals: '42''Hello''''Hello World'''.
	


	
	

]

{ #category : #running }
JbInterpreterTest >> testReturnStatementNode [

   self interpret: 'var y = function (a) { return a;}; var x = y(5);' 
	assertVar: 'x' equals: 5.
	
	self interpret: 'var t = function (a) { return a;}; var z = t(15);' 
	assertVar: 'z' equals: 15.
	
	self interpret: 'var t = function (a, b) { return a + b;}; var z = t(15, 10);' 
	assertVar: 'z' equals: 25.
	
	self interpret: 'var t = function (a, b) {return a + b;}; 
						 var f = function(a, b) {return a * b}; 
						 var p = t(5, 10);
						 var q = f(p, 2)	' 
	assertVar: 'q' equals: 30.
	
	


	


	
	
]

{ #category : #'primitive tests' }
JbInterpreterTest >> testStringNumberBinding [

self interpret: 'var y = "10"; var x = stringNum(y);' assertVar: 'x' equals: 10.
self interpret: 'var y = "0"; var x = stringNum(y);' assertVar: 'x' equals: 0.






	


	
	
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

{ #category : #running }
JbInterpreterTest >> testWhileStatement [

	self interpret: 'var x = 0;var y = 0;while (x<=10) {y = y + x;x = x + 1;}'.
	self assert: (interpreter environment at: 'y') equals: 55.
	
	"Testing while loop as part of bigger program"
	self interpret: 'var x = 0;var y = 0;var count = 0; 
	if(x == 0){x = 25;}
	while (y<1000) {
	y = x * count;
	count = count + 1;
	if(count > 40){count = 777;}}'.
	self assert: (interpreter environment at: 'count') equals: 777.
	

	
	
	

	
	
]
