Class {
	#name : 'MpProxyFactoryOLD2',
	#superclass : 'Object',
	#instVars : [
		'referenceToProxyDict',
		'dispatcherFactory'
	],
	#category : 'MyPrecious-Kernel-OLD2',
	#package : 'MyPrecious',
	#tag : 'Kernel-OLD2'
}

{ #category : 'accessing' }
MpProxyFactoryOLD2 >> dispatcherFactory [

	^ dispatcherFactory
]

{ #category : 'accessing' }
MpProxyFactoryOLD2 >> dispatcherFactory: anObject [

	dispatcherFactory := anObject
]

{ #category : 'initialization' }
MpProxyFactoryOLD2 >> initialize [ 
	super initialize.
	referenceToProxyDict := Dictionary new
]

{ #category : 'building' }
MpProxyFactoryOLD2 >> newProxyFrom: aReference [
	| dispatcher id |
	id := aReference id.
	dispatcher := dispatcherFactory dispatcherAt: aReference address.
	^MpProxy id: id dispatcher: dispatcher
]

{ #category : 'building' }
MpProxyFactoryOLD2 >> proxyAt: aReference [

	^ referenceToProxyDict
		  at: aReference
		  ifAbsentPut: [ self newProxyFrom: aReference ]
]
