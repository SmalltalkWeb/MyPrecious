Class {
	#name : 'MpMiddlewareOLD2',
	#superclass : 'Object',
	#instVars : [
		'proxyFactory',
		'dispatcherFactory',
		'localDispatcher',
		'address'
	],
	#category : 'MyPrecious-Kernel-OLD2',
	#package : 'MyPrecious',
	#tag : 'Kernel-OLD2'
}

{ #category : 'accessing' }
MpMiddlewareOLD2 >> address [

	^ address
]

{ #category : 'accessing' }
MpMiddlewareOLD2 >> address: anObject [

	address := anObject
]

{ #category : 'exporting' }
MpMiddlewareOLD2 >> export: anObjectToExport id: anId [

	self subclassResponsibility
]

{ #category : 'initialization' }
MpMiddlewareOLD2 >> initialize [

	super initialize.
	localDispatcher := MpLocalDispatcherOLD2 new.
	dispatcherFactory := MpDispatcherFactory new.
	proxyFactory := MpProxyFactoryOLD2 new.
	proxyFactory dispatcherFactory: dispatcherFactory
]

{ #category : 'exporting' }
MpMiddlewareOLD2 >> proxyAt: aReference [

	^proxyFactory proxyAt: aReference
]
