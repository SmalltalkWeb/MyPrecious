Class {
	#name : 'MpProxyFactory',
	#superclass : 'Object',
	#instVars : [
		'referenceToProxyDict',
		'dispatcherFactory'
	],
	#category : 'MyPrecious-Kernel',
	#package : 'MyPrecious',
	#tag : 'Kernel'
}

{ #category : 'accessing' }
MpProxyFactory >> dispatcherFactory [

	^ dispatcherFactory
]

{ #category : 'accessing' }
MpProxyFactory >> dispatcherFactory: anObject [

	dispatcherFactory := anObject
]

{ #category : 'initialization' }
MpProxyFactory >> initialize [ 
	super initialize.
	referenceToProxyDict := Dictionary new
]

{ #category : 'building' }
MpProxyFactory >> newProxyFrom: aReference [
	| dispatcher id |
	id := aReference id.
	dispatcher := dispatcherFactory dispatcherAt: aReference address.
	^MpProxy id: id dispatcher: dispatcher
]

{ #category : 'building' }
MpProxyFactory >> proxyAt: aReference [

	^ referenceToProxyDict
		  at: aReference
		  ifAbsentPut: [ self newProxyFrom: aReference ]
]
