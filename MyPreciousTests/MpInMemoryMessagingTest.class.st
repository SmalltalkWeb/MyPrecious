Class {
	#name : 'MpInMemoryMessagingTest',
	#superclass : 'MpRemoteMessagingTest',
	#category : 'MyPreciousTests-Kernel',
	#package : 'MyPreciousTests',
	#tag : 'Kernel'
}

{ #category : 'running' }
MpInMemoryMessagingTest >> middlewareClass [

	^ MpInMemoryMiddleware
]
