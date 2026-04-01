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
MpInMemoryAddress class >> targetDispatcher: aMpLocalDispatcher [ 
	^self new
		targetDispatcher: aMpLocalDispatcher;
		yourself
]

{ #category : 'accessing' }
MpInMemoryAddress >> gatewayClass [
	^MpInMemoryGateway 
]

{ #category : 'accessing' }
MpInMemoryAddress >> targetDispatcher [

	^ targetDispatcher
]

{ #category : 'accessing' }
MpInMemoryAddress >> targetDispatcher: anObject [

	targetDispatcher := anObject
]
