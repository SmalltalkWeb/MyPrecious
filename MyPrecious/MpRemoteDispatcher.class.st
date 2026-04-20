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
MpRemoteDispatcher class >> address: aMpAddress [ 
	^self new
		address: aMpAddress;
		yourself
]

{ #category : 'initialization' }
MpRemoteDispatcher >> address: anMpAddress [
	self gateway: anMpAddress asGateway 
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

{ #category : 'proxies' }
MpRemoteDispatcher >> newProxyAt: id [
	^MpProxy id: id dispatcher: self
]

{ #category : 'proxies' }
MpRemoteDispatcher >> proxyAt: id [  
	^idToProxyDict at: id ifAbsentPut: [ self newProxyAt: id ]
]
