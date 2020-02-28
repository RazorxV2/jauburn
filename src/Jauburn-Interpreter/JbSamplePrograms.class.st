"
Just a place to house a few sample programs
"
Class {
	#name : #JbSamplePrograms,
	#superclass : #Object,
	#instVars : [
		'parser',
		'interpreter'
	],
	#category : #'Jauburn-Interpreter-SamplePrograms'
}

{ #category : #'sample programs' }
JbSamplePrograms class >> noFunctions [
	"self run: #noFunctions"

	^'var x = 1;
var y = 10 * x - 1;
if (y == 9) { 
   x = 16;
}
'
]

{ #category : #utilities }
JbSamplePrograms class >> run: method [
	"Look at sample programs for examples of using this method."

	^JbInterpreter new run: (self perform: method)
]

{ #category : #initialization }
JbSamplePrograms >> initialize [
	
	super initialize.
	parser := JbParser new.
	interpreter := JbInterpreter new
]

{ #category : #initialization }
JbSamplePrograms >> interpret: aString [

	| ast |
	ast :=  parser parse: aString.
	^interpreter interpret: ast.
]

{ #category : #programs }
JbSamplePrograms >> jauburnGCD [

self interpret: 
	'gcd(a, b){
	if(b == 0){return a;}
	return gcd(b, a%b);
	}'.
	
self interpret: 
	'var v1 = input("Enter a:");
 	var v2 = input("Enter b:");
 	var result = gcd(v1, v2);
 	println(result);'
]

{ #category : #programs }
JbSamplePrograms >> jauburnSqrt [

self interpret: 
'var userInput = input("Enter Value:");
 var t = userInput;
 var delta = 1;
 var value = 1;
 while(abs(t - value) > delta*t){
	t = userInput/t + t;
	t = t/2;
	println(t);
	value = c/t;}'
]
