Class {
	#name : 'MpMiddleware',
	#superclass : 'Object',
	#instVars : [
		'proxyFactory',
		'dispatcherFactory',
		'localDispatcher',
		'address'
	],
	#category : 'MyPrecious-Kernel',
	#package : 'MyPrecious',
	#tag : 'Kernel'
}

{ #category : 'accessing' }
MpMiddleware >> address [

	^ address
]

{ #category : 'accessing' }
MpMiddleware >> address: anObject [

	address := anObject
]

{ #category : 'exporting' }
MpMiddleware >> export: anObjectToExport id: anId [

	self subclassResponsibility
]

{ #category : 'initialization' }
MpMiddleware >> initialize [

	super initialize.
	localDispatcher := MpLocalDispatcher new.
	dispatcherFactory := MpDispatcherFactory new.
	proxyFactory := MpProxyFactory new.
	proxyFactory dispatcherFactory: dispatcherFactory
]

{ #category : 'exporting' }
MpMiddleware >> proxyAt: aReference [

	^proxyFactory proxyAt: aReference
]
