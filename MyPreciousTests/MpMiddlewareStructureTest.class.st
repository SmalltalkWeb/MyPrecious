Class {
	#name : 'MpMiddlewareStructureTest',
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

{ #category : 'running' }
MpMiddlewareStructureTest >> setUp [
	super setUp.
	senderMiddleware := MpInMemoryMiddleware new.
	receiverMiddleware := MpInMemoryMiddleware new.
]

{ #category : 'helpers' }
MpMiddlewareStructureTest >> targetReferenceSlotValueInProxy: proxy1 [

	^ (MpProxy slotNamed: #targetReference) read: proxy1
]

{ #category : 'proxy testing' }
MpMiddlewareStructureTest >> testForgeProxy [
	| id proxy |
	id := #someIdentifier.
	proxy := senderMiddleware proxyAtId: id address: receiverMiddleware address.
	self assertIsProxy: proxy.
	self assertProxy: proxy hasId: id.
	self assertProxy: proxy hasAddress: receiverMiddleware address.

]

{ #category : 'proxy testing' }
MpMiddlewareStructureTest >> testSameProxyForSameIdEqualAdresses [

	| id proxy1  proxy2 |
	id := #someId.
	proxy1 := senderMiddleware
		          proxyAtId: id
		          address: receiverMiddleware address.
	proxy2 := senderMiddleware
		          proxyAtId: id
		          address: receiverMiddleware address.
	self
		assert: proxy1
		identicalTo: proxy2
]

{ #category : 'misc testing' }
MpMiddlewareStructureTest >> testSenderCreation [
	| sender |
	sender := senderMiddleware address asSender.
	self assert: sender targetDispatcher identicalTo: senderMiddleware localDispatcher 
]

{ #category : 'proxy testing' }
MpMiddlewareStructureTest >> testTwoProxiesDifferentIdSameAdressHaveIdenticalDispatchers [
	| proxy1 proxy2 dispacher1 dispacher2 |
	proxy1 := senderMiddleware
		          proxyAtId: #o1
		          address: receiverMiddleware address.
	proxy2 := senderMiddleware
		          proxyAtId: #o2
		          address: receiverMiddleware address.
	dispacher1 := self dispatcherSlotValueInProxy: proxy1.
	dispacher2 := self dispatcherSlotValueInProxy: proxy2.
	self
		assert: dispacher1
		identicalTo: dispacher2
]

{ #category : 'proxy testing' }
MpMiddlewareStructureTest >> testTwoProxiesSameIdDiffrentAdressesHaveDifferentDispatchers [
	| proxy1 proxy2 dispacher1 dispacher2 |
	proxy1 := senderMiddleware
		          proxyAtId: #o1
		          address: receiverMiddleware address.
	proxy2 := senderMiddleware
		          proxyAtId: #o2
		          address: MpInMemoryAddress new.
	dispacher1 := self dispatcherSlotValueInProxy: proxy1.
	dispacher2 := self dispatcherSlotValueInProxy: proxy2.
	self
		deny: dispacher1
		equals: dispacher2
]
