Class {
	#name : #JbMockTranscript,
	#superclass : #Object,
	#instVars : [
		'contents'
	],
	#category : #'Jauburn-Interpreter-Core'
}

{ #category : #accessing }
JbMockTranscript >> contents [
	^contents
]

{ #category : #accessing }
JbMockTranscript >> cr [
 ^String cr
]

{ #category : #accessing }
JbMockTranscript >> initialize [
 contents := ''.
]

{ #category : #accessing }
JbMockTranscript >> show: object [
	contents := contents, object.
]
