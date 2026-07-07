Class {
	#name : 'MpInMemoryAddress',
	#superclass : 'MpAddress',
	#instVars : [
		'targetDispatcher'
	],
	#category : 'MyPrecious-Kernel',
	#package : 'MyPrecious',
	#tag : 'Kernel'
}

{ #category : 'instance creation' }
MpInMemoryAddress class >> receiver: aMpLocalDispatcher [ 
	^self new
		receiver: aMpLocalDispatcher;
		yourself
]

{ #category : 'accessing' }
MpInMemoryAddress >> receiver [

	^ targetDispatcher
]

{ #category : 'accessing' }
MpInMemoryAddress >> receiver: anObject [

	targetDispatcher := anObject
]

{ #category : 'accessing' }
MpInMemoryAddress >> senderClass [
	^MpInMemorySender 
]
