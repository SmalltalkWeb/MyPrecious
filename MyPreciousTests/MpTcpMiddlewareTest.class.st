Class {
	#name : 'MpTcpMiddlewareTest',
	#superclass : 'TestCase',
	#instVars : [
		'middleware'
	],
	#category : 'MyPreciousTests-Kernel',
	#package : 'MyPreciousTests',
	#tag : 'Kernel'
}

{ #category : 'running' }
MpTcpMiddlewareTest >> middlewareClass [

	^ MpTcpMiddleware
]

{ #category : 'running' }
MpTcpMiddlewareTest >> setUp [

	super setUp.
	middleware := self middlewareClass new
]

{ #category : 'running' }
MpTcpMiddlewareTest >> tearDown [ 

	middleware stop.
	super tearDown.

]

{ #category : 'running' }
MpTcpMiddlewareTest >> testPortChangeBeforeStart [

	| initialPort newPort |
	initialPort := middleware port.
	newPort := initialPort + 123.
	self deny: initialPort equals: newPort.
	middleware port: newPort.
	self assert: middleware port equals: newPort.
	self assert: middleware address port equals: newPort.
	self assert: middleware server port equals: newPort
]
