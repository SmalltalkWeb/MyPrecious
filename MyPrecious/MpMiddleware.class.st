Class {
	#name : 'MpMiddleware',
	#superclass : 'Object',
	#instVars : [
		'receiver'
	],
	#category : 'MyPrecious-Kernel',
	#package : 'MyPrecious',
	#tag : 'Kernel'
}

{ #category : 'accessing' }
MpMiddleware >> address [
	^receiver address
]

{ #category : 'exporting' }
MpMiddleware >> export: anObject id: anId [ 
	^self exporter export: anObject id: anId
]

{ #category : 'accessing' }
MpMiddleware >> exporter [
	^self receiver exporter
]

{ #category : 'initialization' }
MpMiddleware >> initialize [

	super initialize.
	receiver := self receiverClass new.

]

{ #category : 'importing' }
MpMiddleware >> proxyAtId: id address: anMpAddress [ 
	^self proxyFactory proxyAtId: id address: anMpAddress 
]

{ #category : 'accessing' }
MpMiddleware >> proxyFactory [
	^self receiver proxyFactory
]

{ #category : 'accessing' }
MpMiddleware >> receiver [
	^receiver
]

{ #category : 'initialization' }
MpMiddleware >> receiverClass [
	^self subclassResponsibility 
]
