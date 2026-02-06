Class {
	#name : 'MpMiddlewareOLD',
	#superclass : 'Object',
	#instVars : [
		'marshaller',
		'referenceConverter',
		'address',
		'transporter',
		'receptionTimeoutDuration',
		'processingPriority',
		'maxNumberOfMessageProcessingWorkers',
		'incomingMessagesRunner'
	],
	#category : 'MyPrecious-Kernel-OLD',
	#package : 'MyPrecious',
	#tag : 'Kernel-OLD'
}

{ #category : 'accessing' }
MpMiddlewareOLD >> address [
	^address
]

{ #category : 'accessing' }
MpMiddlewareOLD >> address: anAddress [
	address := anAddress 
]

{ #category : 'initialization' }
MpMiddlewareOLD >> addressClass [
	self subclassResponsibility
]

{ #category : 'initialization' }
MpMiddlewareOLD >> defaultMaxNumberOfMessageProcessingWorkers [
	^15
]

{ #category : 'initialization' }
MpMiddlewareOLD >> defaultProcessingPriority [
	^Processor userSchedulingPriority
]

{ #category : 'initialization' }
MpMiddlewareOLD >> defaultReceptionPriority [
	^Processor userBackgroundPriority
]

{ #category : 'initialization' }
MpMiddlewareOLD >> defaultReceptionTimeoutDuration [
	^500 milliSeconds 
]

{ #category : 'exporting' }
MpMiddlewareOLD >> export: anObject [ 
	^self referenceConverter export: anObject
]

{ #category : 'exporting' }
MpMiddlewareOLD >> export: anObject id: aString [ 
	^self referenceConverter export: anObject id: aString 
]

{ #category : 'accessing' }
MpMiddlewareOLD >> incomingMessagesRunner [
	^incomingMessagesRunner
]

{ #category : 'initialization' }
MpMiddlewareOLD >> initAddress: anAddress [
	^self
]

{ #category : 'initialization' }
MpMiddlewareOLD >> initialize [
	super initialize.
	referenceConverter := self referenceConverterClass middleware: self.
	marshaller := self marshallerClass middleware: self.
	transporter := self transporterClass middleware: self.
	self receptionTimeoutDuration: self defaultReceptionTimeoutDuration.
	self 
		receptionPriority: self defaultReceptionPriority
		processingPriority: self defaultProcessingPriority.
	self address: self newAddress.
	incomingMessagesRunner := self newIncomingMessagesRunner.

]

{ #category : 'activity' }
MpMiddlewareOLD >> isStarted [
	^self transporter isStarted
]

{ #category : 'activity' }
MpMiddlewareOLD >> isStopped [
	^self transporter isStopped
]

{ #category : 'accessing' }
MpMiddlewareOLD >> marshaller [
	^ marshaller
]

{ #category : 'initialization' }
MpMiddlewareOLD >> marshallerClass [
	^MpMarshaller
]

{ #category : 'accessing' }
MpMiddlewareOLD >> maxNumberOfMessageProcessingWorkers: anInteger [
	self newIncomingMessagesRunner poolMaxSize: anInteger
]

{ #category : 'initialization' }
MpMiddlewareOLD >> newAddress [

	| newAddress |
	newAddress := self addressClass new.
	self initAddress: newAddress.
	^newAddress
]

{ #category : 'initialization' }
MpMiddlewareOLD >> newIncomingMessagesRunner [
	^self workerPoolClass new
		priority: self processingPriority;
		poolMaxSize: self defaultMaxNumberOfMessageProcessingWorkers;
		yourself
]

{ #category : 'exporting' }
MpMiddlewareOLD >> objectAt: remoteReference [
	^self referenceConverter objectAt: remoteReference
]

{ #category : 'printing' }
MpMiddlewareOLD >> printOn: aStream [
	super printOn: aStream.
	aStream
		<< ' (';
		print: self address;
		<<$)
]

{ #category : 'activity' }
MpMiddlewareOLD >> processingPriority [
	^processingPriority
]

{ #category : 'initialization' }
MpMiddlewareOLD >> proxyClass [
	^MpProxyOLD
]

{ #category : 'activity' }
MpMiddlewareOLD >> receptionPriority [
	^self transporter receptionPriority
]

{ #category : 'activity' }
MpMiddlewareOLD >> receptionPriority: newReceptionPriority processingPriority: newProcessingPriority [
	newReceptionPriority < newProcessingPriority ifFalse: [ 
		self error: 'Processing priority should be greater than reception priority' ].
	self transporter receptionPriority: newReceptionPriority.
	processingPriority  := newProcessingPriority
]

{ #category : 'accessing' }
MpMiddlewareOLD >> receptionTimeoutDuration [
	^receptionTimeoutDuration
]

{ #category : 'accessing' }
MpMiddlewareOLD >> receptionTimeoutDuration: anObject [
	receptionTimeoutDuration := anObject
]

{ #category : 'accessing' }
MpMiddlewareOLD >> referenceConverter [
	^ referenceConverter
]

{ #category : 'initialization' }
MpMiddlewareOLD >> referenceConverterClass [
	^MpReferenceConverter
]

{ #category : 'exporting' }
MpMiddlewareOLD >> remoteReferenceClass [
	^MpRemoteReferenceOLD
]

{ #category : 'exporting' }
MpMiddlewareOLD >> remoteReferenceFor: anObject [
	^self referenceConverter remoteReferenceFor: anObject
]

{ #category : 'messaging' }
MpMiddlewareOLD >> send: selector arguments: args to: targetRemoteReference [ 
	^self transporter send: selector arguments: args to: targetRemoteReference
]

{ #category : 'messaging' }
MpMiddlewareOLD >> send: selector to: remoteReference [ 
	^self transporter send: selector to: remoteReference.
]

{ #category : 'messaging' }
MpMiddlewareOLD >> sendAsync: selector arguments: args to: targetRemoteReference [
	self transporter 
		sendAsync: selector 
		arguments: args 
		to: targetRemoteReference
]

{ #category : 'messaging' }
MpMiddlewareOLD >> sendAsync: selector to: targetRemoteReference [ 
	self transporter sendAsync: selector to: targetRemoteReference.
]

{ #category : 'activity' }
MpMiddlewareOLD >> start [
	self incomingMessagesRunner start.
	self transporter start
]

{ #category : 'activity' }
MpMiddlewareOLD >> stop [
	self incomingMessagesRunner stop.
	self transporter stop
]

{ #category : 'accessing' }
MpMiddlewareOLD >> transporter [
	^transporter
]

{ #category : 'initialization' }
MpMiddlewareOLD >> transporterClass [
	^self subclassResponsibility
]

{ #category : 'initialization' }
MpMiddlewareOLD >> workerPoolClass [
	^TKTWorkerPool
]
