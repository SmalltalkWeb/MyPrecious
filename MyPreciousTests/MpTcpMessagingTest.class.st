Class {
	#name : 'MpTcpMessagingTest',
	#superclass : 'MpRemoteMessagingTest',
	#category : 'MyPreciousTests-Kernel',
	#package : 'MyPreciousTests',
	#tag : 'Kernel'
}

{ #category : 'running' }
MpTcpMessagingTest >> initMiddleware [

	super initMiddleware.
	senderMiddleware start.
	receiverMiddleware start
]

{ #category : 'running' }
MpTcpMessagingTest >> middlewareClass [

	^ MpTcpMiddleware
]

{ #category : 'running' }
MpTcpMessagingTest >> tearDown [ 

	senderMiddleware stop.
	receiverMiddleware stop.
	super tearDown 
]
