Class {
	#name : 'MpGateway',
	#superclass : 'Object',
	#instVars : [
		'address',
		'idToProxyDict'
	],
	#category : 'MyPrecious-Kernel',
	#package : 'MyPrecious',
	#tag : 'Kernel'
}

{ #category : 'instance creation' }
MpGateway class >> address: anAddress [
	^self new
		address: anAddress;
		yourself
]

{ #category : 'accessing' }
MpGateway >> address [

	^ address
]

{ #category : 'accessing' }
MpGateway >> address: anObject [

	address := anObject
]

{ #category : 'message handling' }
MpGateway >> dispatch: aMessage targetId: id [
	self subclassResponsibility 
]

{ #category : 'initialization' }
MpGateway >> initialize [ 
	super initialize.
	idToProxyDict := Dictionary new
]

{ #category : 'proxies' }
MpGateway >> newProxyAt: id disptacher: aDispatcher [
	| remoteReference |
	remoteReference := MpRemoteReference id: id gateway: self.
	^MpProxy reference: remoteReference dispatcher: aDispatcher
]

{ #category : 'proxies' }
MpGateway >> proxyAt: id  disptacher: aDispatcher [
	^idToProxyDict at: id ifAbsentPut: [ self newProxyAt: id disptacher: aDispatcher]
]
