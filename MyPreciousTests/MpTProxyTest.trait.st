Trait {
	#name : 'MpTProxyTest',
	#category : 'MyPreciousTests-Kernel',
	#package : 'MyPreciousTests',
	#tag : 'Kernel'
}

{ #category : 'running' }
MpTProxyTest >> assertClassOf: anObject is: expectedClass [
	
	| actualClass |
	actualClass := self classOf: anObject .
	self assert: actualClass identicalTo: expectedClass	
]

{ #category : 'running' }
MpTProxyTest >> assertIsProxy: anObject [
	self assertClassOf: anObject is: MpProxy	
]

{ #category : 'asserting' }
MpTProxyTest >> assertProxy: aProxy hasAddress: expectedAddress [
	| actualDispatcher |
	actualDispatcher := self dispatcherSlotValueInProxy: aProxy.
	self assert: actualDispatcher address equals: expectedAddress 
]

{ #category : 'asserting' }
MpTProxyTest >> assertProxy: aProxy hasDispatcher: expectedDispatcher [
	| actualDispatcher |
	actualDispatcher := self dispatcherSlotValueInProxy: aProxy.
	self assert: actualDispatcher identicalTo: expectedDispatcher 
]

{ #category : 'asserting' }
MpTProxyTest >> assertProxy: aProxy hasId: expectedID [
	| actualID |
	actualID := self idSlotValueInProxy: aProxy.
	self assert: actualID identicalTo: expectedID 
]

{ #category : 'asserting' }
MpTProxyTest >> classOf: anObject [
	"Some objects such as proxies overrid #class method. 
	But, we need the default implementation for testing"
	
	^(ProtoObject >> #class) valueWithReceiver: anObject 
]

{ #category : 'running' }
MpTProxyTest >> denyClassOf: anObject is: expectedClass [
	
	| actualClass |
	actualClass := self classOf: anObject .
	self deny: actualClass identicalTo: MpProxy	
]

{ #category : 'running' }
MpTProxyTest >> denyIsProxy: anObject [
	self denyClassOf: anObject is: MpProxy	
]

{ #category : 'accessing proxy IVs' }
MpTProxyTest >> dispatcherSlotValueInProxy: aProxy [

	^ (MpProxy slotNamed: #dispatcher) read: aProxy
]

{ #category : 'accessing proxy IVs' }
MpTProxyTest >> idSlotValueInProxy: aProxy [

	^ (MpProxy slotNamed: #id) read: aProxy
]
