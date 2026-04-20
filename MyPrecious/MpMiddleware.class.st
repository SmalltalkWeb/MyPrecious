Class {
	#name : 'MpMiddleware',
	#superclass : 'Object',
	#instVars : [
		'localDispatcher',
		'proxyFactory'
	],
	#category : 'MyPrecious-Kernel',
	#package : 'MyPrecious',
	#tag : 'Kernel'
}

{ #category : 'exporting' }
MpMiddleware >> export: anObject id: anId [ 
	^self exporter export: anObject id: anId
]

{ #category : 'accessing' }
MpMiddleware >> exporter [
	^self localDispatcher exporter
]

{ #category : 'initialization' }
MpMiddleware >> initialize [ 
	| marshaller |
	super initialize.
	marshaller := MpMarshaler new.
	localDispatcher := MpLocalDispatcher new.
	localDispatcher marshaler: marshaller.
	proxyFactory := MpProxyFactory new.
	
]

{ #category : 'accessing' }
MpMiddleware >> localDispatcher [
	^localDispatcher
]

{ #category : 'importing' }
MpMiddleware >> proxyAtId: id address: anMpAddress [ 
	^proxyFactory proxyAtId: id address: anMpAddress 
]
