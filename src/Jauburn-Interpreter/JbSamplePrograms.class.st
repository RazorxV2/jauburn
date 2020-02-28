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
	'var gcd = function (a, b){
		if(b == 0){return a;}
		return gcd(b, a%b);
		};
	
	var v1 = input("Enter a:");
 	var v2 = input("Enter b:");
 	var result = gcd(v1, v2);
 	println(result);'
]

{ #category : #programs }
JbSamplePrograms >> jauburnSqrt [

self interpret: 
"My apologies for all the vars, only way it worked for some reason"
'var input = input("Enter Number:");
 var userInput = stringNum(input);
 var t = userInput;
 var delta = 1/10000;
 var value = 1;
 var absVal = abs(t - value);
 var deltaT = delta*t;

 while(absVal > deltaT){
	t = userInput/t + t;
	t = t/2;
	println(float(t));
	value = userInput/t;
	absVal = abs(t - value);
   deltaT = delta*t;}'
]
