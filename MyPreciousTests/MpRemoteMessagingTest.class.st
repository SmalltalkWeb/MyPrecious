Class {
	#name : 'MpRemoteMessagingTest',
	#superclass : 'TestCase',
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
MpRemoteMessagingTest >> assertIsProxy: anObject [
	"MpProxy overrides #class method to answer the receiver's actual class"
	
	| classMethod |
	classMethod := ProtoObject compiledMethodAt: #class.
	self assert: (classMethod valueWithReceiver: anObject) identicalTo: MpProxy	
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
MpRemoteMessagingTest >> testArgObjectsProxified [

	self fail: #todo
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
MpRemoteMessagingTest >> testNormalResponseForSpecialMessage [

	self assert: proxy class identicalTo: target class
]

{ #category : 'running' }
MpRemoteMessagingTest >> testNormalResponseMessage [

	target selector: #unary actionBlock: [ 42 ].
	self assert: proxy unary equals: 42.
	target selector: #+ actionBlock: [ :arg | arg + 1 ].
	self assert: proxy + 0 equals: 1.
	target selector: #foo:bar: actionBlock: [ :x :y |
		{
			x.
			y } ].
	self
		assert: (proxy foo: 'Hello' bar: #World)
		equals: { 'Hello'. #World }
]

{ #category : 'running' }
MpRemoteMessagingTest >> testNormalResponseProxified [

	target selector: #me actionBlock: [target].	
	self assert: proxy me identicalTo: proxy.

]

{ #category : 'running' }
MpRemoteMessagingTest >> testOtherObjectResponseProxified [

	| other otherProxy |
	other := MpMock new.
	other selector: #answerAll actionBlock: [ 42 ].
	target selector: #other actionBlock: [ other ].
	otherProxy := proxy other.
	self assertIsProxy: otherProxy.
	self assert: otherProxy answerAll equals: 42
]

{ #category : 'running' }
MpRemoteMessagingTest >> testUnknownMessageDNU [

	self should: [proxy foo] raise: MessageNotUnderstood 
]
