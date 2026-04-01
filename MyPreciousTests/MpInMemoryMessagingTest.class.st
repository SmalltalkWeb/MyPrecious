Class {
	#name : 'MpInMemoryMessagingTest',
	#superclass : 'MpRemoteMessagingTest',
	#category : 'MyPreciousTests-Kernel',
	#package : 'MyPreciousTests',
	#tag : 'Kernel'
}

{ #category : 'running' }
MpInMemoryMessagingTest >> initMiddleware [

	senderMiddleware := MpInMemoryMiddleware new.
	receiverMiddleware := MpInMemoryMiddleware new.

]
