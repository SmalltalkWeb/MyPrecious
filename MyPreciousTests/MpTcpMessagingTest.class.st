Class {
	#name : 'MpTcpMessagingTest',
	#superclass : 'MpRemoteMessagingTest',
	#category : 'MyPreciousTests-Kernel',
	#package : 'MyPreciousTests',
	#tag : 'Kernel'
}

{ #category : 'running' }
MpTcpMessagingTest >> initMiddleware [

	senderMiddleware := MpTcpMiddleware new.
	senderMiddleware start.
	receiverMiddleware := MpTcpMiddleware new.
	receiverMiddleware start.
]

{ #category : 'running' }
MpTcpMessagingTest >> tearDown [ 

	senderMiddleware stop.
	receiverMiddleware stop.
	super tearDown 
]
