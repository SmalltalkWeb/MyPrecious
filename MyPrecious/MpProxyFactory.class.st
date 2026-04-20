Class {
	#name : 'MpProxyFactory',
	#superclass : 'Object',
	#instVars : [
		'addressToDispatcherDict'
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

{ #category : 'creating' }
MpProxyFactory >> newDispatcherFromAddress: anMpAddress [
	^MpRemoteDispatcher address: anMpAddress
]

{ #category : 'creating' }
MpProxyFactory >> proxyAtId: id address: anMpAddress [ 
	| dispatcher |
	dispatcher := self dispatcherFromAddress: anMpAddress.
	^dispatcher proxyAt: id

]
