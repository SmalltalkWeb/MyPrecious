Class {
	#name : 'MpInMemoryMiddlewareTest',
	#superclass : 'TestCase',
	#instVars : [
		'receiverMiddleware',
		'senderMiddleware'
	],
	#category : 'MyPreciousTests-Kernel',
	#package : 'MyPreciousTests',
	#tag : 'Kernel'
}

{ #category : 'running' }
MpInMemoryMiddlewareTest >> setUp [
	super setUp.
	senderMiddleware := MpInMemoryMiddleware new.
	receiverMiddleware := MpInMemoryMiddleware new.
]

{ #category : 'helpers' }
MpInMemoryMiddlewareTest >> targetReferenceOfProxy: proxy1 [

	^ (MpProxy slotNamed: #targetReference) read: proxy1
]

{ #category : 'testing' }
MpInMemoryMiddlewareTest >> testExport [
	"Smoke test"
	| id  |
	id := #someIdentifier.
	receiverMiddleware export: Object new id: id.

]

{ #category : 'testing' }
MpInMemoryMiddlewareTest >> testForgeProxy [
	| id proxy remoteReference dispatcher |
	id := #someIdentifier.
	proxy := senderMiddleware proxyAtId: id address: receiverMiddleware address.
	dispatcher := (MpProxy slotNamed: #dispatcher) read: proxy.
	self assert: dispatcher identicalTo: senderMiddleware remoteDispatcher.
	remoteReference := self targetReferenceOfProxy: proxy. 
	self assert: remoteReference id equals: id.
	self assert: remoteReference gateway address equals: receiverMiddleware address.

]

{ #category : 'testing' }
MpInMemoryMiddlewareTest >> testGatewayCreation [
	| senderGateway |
	senderGateway := senderMiddleware address asGateway.
	self assert: senderGateway targetDispatcher identicalTo: senderMiddleware localDispatcher 
]

{ #category : 'testing' }
MpInMemoryMiddlewareTest >> testSameProxyForSameIdEqualAdresses [

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

{ #category : 'testing' }
MpInMemoryMiddlewareTest >> testTwoProxiesDiffrentAdressesHaveDifferentGateway [

	| proxy1 remoteReference1 proxy2 remoteReference2 |
	proxy1 := senderMiddleware
		          proxyAtId: #o1
		          address: receiverMiddleware address.
	remoteReference1 := self targetReferenceOfProxy: proxy1.
	proxy2 := senderMiddleware
		          proxyAtId: #o2
		          address: MpInMemoryAddress new.
	remoteReference2 := (MpProxy slotNamed: #targetReference) read:
		                    proxy2.
	self
		deny: remoteReference1 gateway
		equals: remoteReference2 gateway
]

{ #category : 'testing' }
MpInMemoryMiddlewareTest >> testTwoProxiesSameAdressHaveIdenticalGateway [

	| proxy1 remoteReference1 proxy2 remoteReference2 |
	proxy1 := senderMiddleware
		          proxyAtId: #o1
		          address: receiverMiddleware address.
	remoteReference1 := self targetReferenceOfProxy: proxy1.
	proxy2 := senderMiddleware
		          proxyAtId: #o2
		          address: receiverMiddleware address.
	remoteReference2 := (MpProxy slotNamed: #targetReference) read:
		                    proxy2.
	self
		assert: remoteReference1 gateway
		identicalTo: remoteReference2 gateway
]
