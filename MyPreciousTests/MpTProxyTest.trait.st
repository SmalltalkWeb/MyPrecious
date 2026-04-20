Trait {
	#name : 'MpTProxyTest',
	#category : 'MyPreciousTests-Kernel',
	#package : 'MyPreciousTests',
	#tag : 'Kernel'
}

{ #category : 'asserting' }
MpTProxyTest >> assertIsProxy: aProxy [
	| actualClass |
	actualClass := (ProtoObject >> #class) valueWithReceiver: aProxy.
	self assert: actualClass identicalTo: MpProxy
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

{ #category : 'accessing proxy IVs' }
MpTProxyTest >> dispatcherSlotValueInProxy: aProxy [

	^ (MpProxy slotNamed: #dispatcher) read: aProxy
]

{ #category : 'accessing proxy IVs' }
MpTProxyTest >> idSlotValueInProxy: aProxy [

	^ (MpProxy slotNamed: #id) read: aProxy
]
