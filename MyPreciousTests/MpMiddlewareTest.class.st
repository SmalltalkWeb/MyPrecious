Class {
	#name : 'MpMiddlewareTest',
	#superclass : 'TestCase',
	#traits : 'MpTProxyTest',
	#classTraits : 'MpTProxyTest classTrait',
	#instVars : [
		'receiverMiddleware',
		'senderMiddleware'
	],
	#category : 'MyPreciousTests-Kernel',
	#package : 'MyPreciousTests',
	#tag : 'Kernel'
}

{ #category : 'testing' }
MpMiddlewareTest class >> isAbstract [ 
	^self == MpMiddlewareTest 
]

{ #category : 'running' }
MpMiddlewareTest >> assertIsProxy: anObject [
	"MpProxy overrides #class method to answer the receiver's actual class"
	
	| classMethod |
	classMethod := ProtoObject compiledMethodAt: #class.
	self assert: (classMethod valueWithReceiver: anObject) identicalTo: MpProxy	
]

{ #category : 'running' }
MpMiddlewareTest >> initMiddleware [ 
	self subclassResponsibility 
]

{ #category : 'running' }
MpMiddlewareTest >> setUp [

	| targetReference id |
	super setUp.
	self initMiddleware.
	target := MpMock new.
	id := #someIdentifier.
	receiverMiddleware export: target id: id.
	targetReference := MpRemoteReference id: id address: receiverMiddleware address.
	proxy := senderMiddleware proxyAt: targetReference
]

{ #category : 'running' }
MpMiddlewareTest >> testArgObjectsProxified [

	self fail: #todo
]

{ #category : 'running' }
MpMiddlewareTest >> testOtherObjectResponseProxified [

	| other otherProxy |
	other := MpMock new.
	other selector: #answerAll actionBlock: [ 42 ].
	target selector: #other actionBlock: [ other ].
	otherProxy := proxy other.
	self assertIsProxy: otherProxy.
	self assert: otherProxy answerAll equals: 42
]

{ #category : 'running' }
MpMiddlewareTest >> testTargetObjectResponseProxified [

	target selector: #me actionBlock: [target].	
	self assert: proxy me identicalTo: proxy.

]
