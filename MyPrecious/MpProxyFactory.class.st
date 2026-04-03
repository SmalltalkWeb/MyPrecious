Class {
	#name : 'MpProxyFactory',
	#superclass : 'Object',
	#instVars : [
		'dispatcher',
		'addressToGatewayDict'
	],
	#category : 'MyPrecious-Kernel',
	#package : 'MyPrecious',
	#tag : 'Kernel'
}

{ #category : 'accessing' }
MpProxyFactory >> dispatcher [

	^ dispatcher
]

{ #category : 'accessing' }
MpProxyFactory >> dispatcher: anObject [

	dispatcher := anObject
]

{ #category : 'creating' }
MpProxyFactory >> gatewayFromAddress: anMpAddress [

	^addressToGatewayDict 
		at: anMpAddress 
		ifAbsentPut: [anMpAddress asGateway].
	
]

{ #category : 'initialization' }
MpProxyFactory >> initialize [ 
	super initialize.
	addressToGatewayDict := Dictionary new
]

{ #category : 'creating' }
MpProxyFactory >> proxyAtId: id address: anMpAddress [ 
	| gateway |
	gateway := self gatewayFromAddress: anMpAddress.
	^gateway proxyAt: id disptacher: self dispatcher.

]
