Class {
	#name : 'MpRemoteMessagingTest',
	#superclass : 'TestCase',
	#traits : 'MpTProxyTest',
	#classTraits : 'MpTProxyTest classTrait',
	#instVars : [
		'proxy',
		'target',
		'receiverMiddleware',
		'senderMiddleware'
	],
	#category : 'MyPreciousTests-Kernel',
	#package : 'MyPreciousTests',
	#tag : 'Kernel'
}

{ #category : 'testing' }
MpRemoteMessagingTest class >> isAbstract [ 
	^self == MpRemoteMessagingTest 
]

{ #category : 'running' }
MpRemoteMessagingTest >> initMiddleware [ 
	self subclassResponsibility 
]

{ #category : 'running' }
MpRemoteMessagingTest >> setUp [

	| id |
	super setUp.
	self initMiddleware.
	target := MpMock new.
	id := #someIdentifier.
	receiverMiddleware export: target id: id.
	proxy := senderMiddleware proxyAtId: id address: receiverMiddleware address
]

{ #category : 'running' }
MpRemoteMessagingTest >> testArgObjectIsProxified [

	| sentObject savedObject retrievedObject |
	target selector: #set: actionBlock: [: arg1 | savedObject := arg1].	
	target selector: #get actionBlock: [savedObject].	
	sentObject := Object new.
	proxy set: sentObject.
	self assertIsProxy: savedObject.
	retrievedObject := proxy get.
	self assert: retrievedObject identicalTo: sentObject.

]

{ #category : 'running' }
MpRemoteMessagingTest >> testExceptionResponseMessage [

	target selector: #divide:by: actionBlock: [ :x :y | x / y ].
	self should: [ proxy divide: 9 by: 0 ] raise: ZeroDivide
]

{ #category : 'running' }
MpRemoteMessagingTest >> testMessagesUnderstoodByProxy [
	proxy id: nil dispatcher: nil.
	self assert: proxy == proxy. "Testing for #== message"
	self assert: proxy yourself identicalTo: proxy.
	self deny: proxy isNil.
	
]

{ #category : 'running' }
MpRemoteMessagingTest >> testNormalResponseMessage [

	| proxyOnArray |
	target selector: #unary actionBlock: [ 42 ].
	self assert: proxy unary equals: 42.
	target selector: #+ actionBlock: [ :arg | arg + 1 ].
	self assert: proxy + 0 equals: 1.
	target selector: #foo:bar: actionBlock: [ :x :y |
		{
			x.
			y } ].
	proxyOnArray := proxy foo: 'Hello' bar: #World.
	self assertIsProxy: proxyOnArray.
	self
		assertCollection: proxyOnArray
		hasSameElements: { 'Hello'. #World }
]

{ #category : 'running' }
MpRemoteMessagingTest >> testNormalResponseMessagePassByCopy [

	target selector: #unary actionBlock: [ 42 ].
	self assert: proxy unary equals: 42.
	target selector: #+ actionBlock: [ :arg | arg + 1 ].
	self assert: proxy + 0 equals: 1.

]

{ #category : 'running' }
MpRemoteMessagingTest >> testNormalResponseProxified [

	| otherTarget otherProxy |
	target selector: #me actionBlock: [target].	
	self assert: proxy me identicalTo: proxy.
	otherTarget := MpMock new.
	otherTarget selector: #root actionBlock: [ target ].
	target selector: #other actionBlock: [ otherTarget ].
	otherProxy := proxy other.
	self assertIsProxy: otherProxy.
	self assert: otherProxy root identicalTo: proxy
]

{ #category : 'running' }
MpRemoteMessagingTest >> testUnknownMessageDNU [

	self should: [proxy foo] raise: MessageNotUnderstood 
]
