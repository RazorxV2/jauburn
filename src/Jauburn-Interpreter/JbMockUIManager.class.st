Class {
	#name : #JbMockUIManager,
	#superclass : #Object,
	#instVars : [
		'contents',
		'default'
	],
	#category : #'Jauburn-Interpreter-Core'
}

{ #category : #accessing }
JbMockUIManager >> contents [
	^contents
]

{ #category : #accessing }
JbMockUIManager >> contents: answer [
	contents := answer.
]

{ #category : #accessing }
JbMockUIManager >> default [
	^default.
]

{ #category : #accessing }
JbMockUIManager >> initialize [
 contents := ''.
]

{ #category : #accessing }
JbMockUIManager >> request: prompt [
	
]
