Class {
	#name : 'MpLocalMiddlewareTest',
	#superclass : 'MpMiddlewareTest',
	#category : 'MyPreciousTests-Kernel',
	#package : 'MyPreciousTests',
	#tag : 'Kernel'
}

{ #category : 'running' }
MpLocalMiddlewareTest >> initMiddleware [

	| receiverAddress |
	senderMiddleware := MpLocalMiddleware new.
	receiverMiddleware := MpLocalMiddleware new.
	receiverAddress := MpLocalAddress dispatcher: receiverMiddleware localDispatcher.
	receiverMiddleware address: receiverAddress 
]
