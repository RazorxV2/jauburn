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
JbMockUIManager >> default [
	^default.
]

{ #category : #accessing }
JbMockUIManager >> request: prompt [
	contents := contents.
]
