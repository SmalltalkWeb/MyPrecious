Class {
	#name : 'MpMiddleware',
	#superclass : 'Object',
	#instVars : [
		'localDispatcher'
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
	localDispatcher := MpLocalDispatcher address: self newAddress
	
]

{ #category : 'accessing' }
MpMiddleware >> localDispatcher [
	^localDispatcher
]

{ #category : 'initialization' }
MpMiddleware >> newAddress [
	self subclassResponsibility 
]

{ #category : 'importing' }
MpMiddleware >> proxyAtId: id address: anMpAddress [ 
	^self proxyFactory proxyAtId: id address: anMpAddress 
]

{ #category : 'accessing' }
MpMiddleware >> proxyFactory [
	^self localDispatcher proxyFactory
]
