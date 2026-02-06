Class {
	#name : 'MpLocalAddress',
	#superclass : 'MpAddress',
	#instVars : [
		'dispatcher'
	],
	#category : 'MyPrecious-Kernel',
	#package : 'MyPrecious',
	#tag : 'Kernel'
}

{ #category : 'instance creation' }
MpLocalAddress class >> dispatcher: aDispatcher [
	^self new
		dispatcher: aDispatcher;		
		yourself
]

{ #category : 'converting' }
MpLocalAddress >> asDispatcher [
	^self dispatcher
]

{ #category : 'accessing' }
MpLocalAddress >> dispatcher [

	^ dispatcher
]

{ #category : 'accessing' }
MpLocalAddress >> dispatcher: anObject [

	dispatcher := anObject
]
