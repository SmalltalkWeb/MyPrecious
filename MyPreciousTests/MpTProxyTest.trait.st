Trait {
	#name : 'MpTProxyTest',
	#instVars : [
		'proxy',
		'target'
	],
	#category : 'MyPreciousTests-Kernel',
	#package : 'MyPreciousTests',
	#tag : 'Kernel'
}

{ #category : 'running' }
MpTProxyTest >> testExceptionResponseMessage [

	target selector: #divide:by: actionBlock: [ :x :y | x / y ].
	self should: [ proxy divide: 9 by: 0 ] raise: ZeroDivide
]

{ #category : 'running' }
MpTProxyTest >> testMessagesUnderstoodByProxy [
	proxy id: nil dispatcher: nil.
	self assert: proxy == proxy equals: true.
	self assert: proxy yourself identicalTo: proxy.
	self deny: proxy isNil.
	
]

{ #category : 'running' }
MpTProxyTest >> testNormalResponseForSpecialMessage [

	self assert: proxy class identicalTo: target class
]

{ #category : 'running' }
MpTProxyTest >> testNormalResponseMessage [

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
MpTProxyTest >> testUnknownMessageDNU [

	self should: [proxy foo] raise: MessageNotUnderstood 
]
