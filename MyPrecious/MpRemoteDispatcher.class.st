"
Serializes and marshalls messages before passing them to the target's remote reference.
Then deserializes and umarshalls responses before returning them.
"
Class {
	#name : 'MpRemoteDispatcher',
	#superclass : 'MpDispatcher',
	#instVars : [
		'idToProxyDict',
		'gateway'
	],
	#category : 'MyPrecious-Kernel',
	#package : 'MyPrecious',
	#tag : 'Kernel'
}

{ #category : 'instance creation' }
MpRemoteDispatcher class >> address: aMpAddress marshaler: aMarshaler [
	^self new
		address: aMpAddress;
		marshaler: aMarshaler;
		yourself
]

{ #category : 'accessing' }
MpRemoteDispatcher >> address [
	^self gateway address
]

{ #category : 'accessing' }
MpRemoteDispatcher >> address: anMpAddress [
	self gateway: anMpAddress asGateway 
]

{ #category : 'message handling' }
MpRemoteDispatcher >> dispatch: aMessage targetId: id [

	| rawResponse | self halt.
	rawResponse := self gateway dispatch: aMessage targetId: id.
	^ self unmarshal: rawResponse
]

{ #category : 'accessing' }
MpRemoteDispatcher >> gateway [

	^ gateway
]

{ #category : 'accessing' }
MpRemoteDispatcher >> gateway: anObject [

	gateway := anObject
]

{ #category : 'initialization' }
MpRemoteDispatcher >> initialize [ 
	super initialize.
	idToProxyDict := Dictionary new
]

{ #category : 'accessing' }
MpRemoteDispatcher >> marshaler: anObject [

	marshaler := anObject
]

{ #category : 'proxies' }
MpRemoteDispatcher >> newProxyAt: id [
	^MpProxy id: id dispatcher: self
]

{ #category : 'proxies' }
MpRemoteDispatcher >> proxyAt: id [  
	^idToProxyDict at: id ifAbsentPut: [ self newProxyAt: id ]
]
