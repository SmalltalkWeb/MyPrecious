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

{ #category : 'tests' }
MpTcpMessagingTest >> stopReceiverMiddleware [

	receiverMiddleware stop.
	self waitUntil: [ receiverMiddleware isStopped ]
]

{ #category : 'running' }
MpTcpMessagingTest >> tearDown [ 

	senderMiddleware stop.
	receiverMiddleware stop.
	super tearDown 
]

{ #category : 'tests' }
MpTcpMessagingTest >> testReceiverTooSlowToRespond [

	target selector: #waitForever actionBlock: [ Semaphore new wait ].
	self should: [ proxy waitForever ] raise: MpResponseTimedOutError
]

{ #category : 'tests' }
MpTcpMessagingTest >> testSenderFailsToConnect [

	self stopReceiverMiddleware.
	target selector: #unary actionBlock: [ 42 ].
	self should: [ proxy unary ] raise: MpConnectTimeoutError
]
