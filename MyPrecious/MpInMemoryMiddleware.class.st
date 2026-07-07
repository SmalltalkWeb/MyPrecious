Class {
	#name : 'MpInMemoryMiddleware',
	#superclass : 'MpMiddleware',
	#category : 'MyPrecious-Kernel',
	#package : 'MyPrecious',
	#tag : 'Kernel'
}

{ #category : 'initialization' }
MpInMemoryMiddleware >> receiverClass [
	^MpInMemoryReceiver 
]
