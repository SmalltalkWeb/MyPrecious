Class {
	#name : 'MpProxyFactory',
	#superclass : 'Object',
	#instVars : [
		'addressToDispatcherDict',
		'marshaler'
	],
	#category : 'MyPrecious-Kernel',
	#package : 'MyPrecious',
	#tag : 'Kernel'
}

{ #category : 'creating' }
MpProxyFactory >> dispatcherFromAddress: anMpAddress [

	^addressToDispatcherDict 
		at: anMpAddress 
		ifAbsentPut: [self newDispatcherFromAddress: anMpAddress ].
	
]

{ #category : 'initialization' }
MpProxyFactory >> initialize [ 
	super initialize.
	addressToDispatcherDict := Dictionary new
]

{ #category : 'accessing' }
MpProxyFactory >> marshaler [

	^ marshaler
]

{ #category : 'accessing' }
MpProxyFactory >> marshaler: anObject [

	marshaler := anObject
]

{ #category : 'creating' }
MpProxyFactory >> newDispatcherFromAddress: anMpAddress [
	^MpRemoteDispatcher address: anMpAddress marshaler: marshaler 
]

{ #category : 'creating' }
MpProxyFactory >> proxyAtId: id address: anMpAddress [ 
	| dispatcher |
	dispatcher := self dispatcherFromAddress: anMpAddress.
	^dispatcher proxyAt: id

]
