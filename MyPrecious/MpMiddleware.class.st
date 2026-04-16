Class {
	#name : 'MpMiddleware',
	#superclass : 'Object',
	#instVars : [
		'localDispatcher',
		'remoteDispatcher',
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
	super initialize.
	localDispatcher := MpLocalDispatcher new.
	remoteDispatcher := MpRemoteDispatcher new.
	proxyFactory := MpProxyFactory new.
	proxyFactory dispatcher: remoteDispatcher 
	
]

{ #category : 'accessing' }
MpMiddleware >> localDispatcher [
	^localDispatcher
]

{ #category : 'importing' }
MpMiddleware >> proxyAtId: id address: anMpAddress [ 
	^proxyFactory proxyAtId: id address: anMpAddress 
]

{ #category : 'accessing' }
MpMiddleware >> remoteDispatcher [
	^remoteDispatcher
]
