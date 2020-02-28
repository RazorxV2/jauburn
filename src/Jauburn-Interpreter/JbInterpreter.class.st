"
I am an interpreter for programs written in the Jauburn language.  My principle API methods are:

	interpret: anAST -- given an abstract syntax tree, interpret it
	run: aString -- parse and interpret the supplied string
"
Class {
	#name : #JbInterpreter,
	#superclass : #Object,
	#instVars : [
		'environment',
		'transcript',
		'uimanager'
	],
	#category : #'Jauburn-Interpreter-Core'
}

{ #category : #primitives }
JbInterpreter >> absBinding [
	^#abs -> [:x | x abs.]
]

{ #category : #primitives }
JbInterpreter >> asFloatBinding [
	^ #'float' -> [ :l | l asFloat round:3. ]
]

{ #category : #primitives }
JbInterpreter >> concatBinding [
	^#concat -> [:x :y | x, y]
]

{ #category : #accessing }
JbInterpreter >> environment [ 

	^environment
]

{ #category : #initialization }
JbInterpreter >> initialize [ 

	super initialize.
	environment := JbEnvironment new.
	self initializeBindings.
]

{ #category : #initialization }
JbInterpreter >> initializeBindings [

| primitive |
(self class selectors select: [ :each | each endsWith: 'Binding' ])
		do: [ :s | 
				| binding |
				binding := self perform: s.
				primitive := JbPrimitive new.
				primitive block: binding value.
				environment at: binding key put: primitive ]
]

{ #category : #primitives }
JbInterpreter >> inputBinding [
	^ #input -> [ :p | UIManager default request: p asString ]
]

{ #category : #api }
JbInterpreter >> interpret: ast [

	^ast executeIn: environment 
]

{ #category : #primitives }
JbInterpreter >> lengthBinding [
	^ #length -> [ :l | l size]
]

{ #category : #primitives }
JbInterpreter >> modBinding [
	^#mod -> [:x :y | x \\ y.]
]

{ #category : #primitives }
JbInterpreter >> notBinding [
	^#not -> [:x | x not.]
]

{ #category : #primitives }
JbInterpreter >> printBinding [
	^#print -> [:value | self transcript show: value printString]
]

{ #category : #primitives }
JbInterpreter >> printlnBinding [
	^#println -> [:value | self transcript show: value printString; cr]
]

{ #category : #api }
JbInterpreter >> run: programString [

	| parser |
	parser := JbParser new.
	self interpret: (parser parse: programString)
]

{ #category : #primitives }
JbInterpreter >> stringNumberBinding [
	^ #'stringNum' -> [ :l | l asNumber ]
]

{ #category : #primitives }
JbInterpreter >> transcript [
 ^transcript ifNil: [Transcript]
]

{ #category : #primitives }
JbInterpreter >> transcript: aTranscript [
	transcript := aTranscript
]

{ #category : #primitives }
JbInterpreter >> uimanager [
	^uimanager ifNil: [ UIManager default ]
]

{ #category : #primitives }
JbInterpreter >> uimanager: aUIManager [
	uimanager := aUIManager
]
