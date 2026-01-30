Class {
	#name : 'MpProxyTest',
	#superclass : 'TestCase',
	#instVars : [
		'proxy',
		'target'
	],
	#category : 'MyPreciousTests-Kernel',
	#package : 'MyPreciousTests',
	#tag : 'Kernel'
}

{ #category : 'running' }
MpProxyTest >> setUp [

	| targetReference dispatcher |
	super setUp.
	target := MpMock new.
	targetReference := MpObjectReference new.
	dispatcher := MpLocalDispatcher new.
	dispatcher at: targetReference put: target.
	proxy := MpProxy reference: targetReference dispatcher: dispatcher
]

{ #category : 'running' }
MpProxyTest >> testExceptionResponseMessage [

	target selector: #divide:by: actionBlock: [ :x : y | x/y ].
	self should: [proxy divide: 9 by: 0] raise: ZeroDivide 
]

{ #category : 'running' }
MpProxyTest >> testMessagesUnderstoodByProxy [
	proxy reference: nil dispatcher: nil.
	self assert: proxy == proxy equals: true.
	self assert: proxy yourself identicalTo: proxy.
	self deny: proxy isNil.
	
]

{ #category : 'running' }
MpProxyTest >> testNormalResponseMessage [

	target selector: #someInt actionBlock: [ 42 ].
	self assert: proxy someInt equals: 42.
	self assert: proxy class identicalTo: target class 
]

{ #category : 'running' }
MpProxyTest >> testUnknownMessageDNU [

	self should: [proxy foo] raise: MessageNotUnderstood 
]
