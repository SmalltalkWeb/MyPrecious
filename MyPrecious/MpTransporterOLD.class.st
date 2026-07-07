Class {
	#name : 'MpTransporterOLD',
	#superclass : 'MpMiddlewarePartOLD',
	#instVars : [
		'promisesDict',
		'promisesLock',
		'incomingMessagesRunner'
	],
	#category : 'MyPrecious-Kernel-OLD',
	#package : 'MyPrecious',
	#tag : 'Kernel-OLD'
}

{ #category : 'accessing' }
MpTransporterOLD >> address [
	^self middleware address
]

{ #category : 'sending' }
MpTransporterOLD >> basicSendMessage: remoteMessage to: targetRemoteReference [
	self subclassResponsibility
]

{ #category : 'receiving' }
MpTransporterOLD >> deliverResponse: remoteResponse [
	| promise |
	promise := promisesLock critical: [
		promisesDict at: remoteResponse id ifAbsent: [^self]].
	remoteResponse trigger: promise

]

{ #category : 'accessing' }
MpTransporterOLD >> incomingMessagesRunner [
	^self middleware incomingMessagesRunner
]

{ #category : 'initialization' }
MpTransporterOLD >> initialize [
	super initialize.
	promisesDict := Dictionary new.
	promisesLock := Mutex new.

]

{ #category : 'activity' }
MpTransporterOLD >> isStarted [
	^self subclassResponsibility
]

{ #category : 'activity' }
MpTransporterOLD >> isStopped [
	^self isStarted not
]

{ #category : 'sending' }
MpTransporterOLD >> marshal: anObject [ 
	^self marshaller marshal: anObject 


]

{ #category : 'sending' }
MpTransporterOLD >> marshalAndSerialize: anObject [
	| marshalledObject |
	marshalledObject := self marshal: anObject.
	^ self serialize: marshalledObject
]

{ #category : 'accessing' }
MpTransporterOLD >> marshaller [
	^self middleware marshaller
]

{ #category : 'receiving' }
MpTransporterOLD >> materializeAndUnmarshal: bytes [
	| object |
	object := self materializeFrom: bytes.
	^self unmarshal: object
]

{ #category : 'receiving' }
MpTransporterOLD >> materializeFrom: bytes [ 
	^FLMaterializer materializeFromByteArray: bytes
]

{ #category : 'sending' }
MpTransporterOLD >> newPromiseAt: id [
	| newPromise |
	newPromise := self promiseClass new.
	promisesLock critical: [ promisesDict at: id put: newPromise ].
	^newPromise
]

{ #category : 'sending' }
MpTransporterOLD >> promiseClass [
	^ CcPromise
]

{ #category : 'accessing' }
MpTransporterOLD >> receptionPriority [
	^self subclassResponsibility
]

{ #category : 'initialization' }
MpTransporterOLD >> receptionPriority: anInteger [
	self subclassResponsibility
]

{ #category : 'sending' }
MpTransporterOLD >> receptionTimeoutDuration [
	^self middleware receptionTimeoutDuration
]

{ #category : 'sending' }
MpTransporterOLD >> send: selector arguments: args to: targetRemoteReference [ 
	|remoteMessage responseId|
	responseId := self newId.
	remoteMessage := MpSynchronousRemoteMessage new
		selector: selector;
		arguments: args;
		receiver: targetRemoteReference;
		senderAddress: self address;
		responseId: responseId; 
		yourself.
	^self sendSynchronousMessage: remoteMessage to: targetRemoteReference
]

{ #category : 'sending' }
MpTransporterOLD >> send: selector to: remoteReference [ 
	^self send: selector arguments: #() to: remoteReference
]

{ #category : 'sending' }
MpTransporterOLD >> sendAsync: selector arguments: args to: targetRemoteReference [
	|remoteMessage|
	remoteMessage := MpAsynchronousRemoteMessage new
		selector: selector;
		arguments: args;
		receiver: targetRemoteReference;
		yourself.
	self sendAsynchronousMessage: remoteMessage to: targetRemoteReference
]

{ #category : 'sending' }
MpTransporterOLD >> sendAsync: selector to: targetRemoteReference [ 
	self sendAsync: selector arguments: #() to: targetRemoteReference 
]

{ #category : 'sending' }
MpTransporterOLD >> sendAsynchronousMessage: remoteMessage to: targetRemoteReference [
	self basicSendMessage: remoteMessage to: targetRemoteReference

]

{ #category : 'sending' }
MpTransporterOLD >> sendSynchronousMessage: remoteMessage to: targetReference [
	| promise response |
	promise := self newPromiseAt: remoteMessage responseId.
	promise
		onFulfillDo: [ :normalResponse | response := normalResponse ]
		onRejectDo: [ :exceptionResponse | response := exceptionResponse ].
	self basicSendMessage: remoteMessage to: targetReference.
	self waitResponseFor: remoteMessage onPromise: promise.
	^ response contents
]

{ #category : 'sending' }
MpTransporterOLD >> serialize: anObject [ 
	^FLSerializer serializeToByteArray: anObject
]

{ #category : 'sending' }
MpTransporterOLD >> signalReceivingResponseOfRemoteMessage: remoteMessage raisedException: exception [
	MpRemoteMessageResultTimeout new
		message: remoteMessage;
		originalException: exception;
		signal
]

{ #category : 'sending' }
MpTransporterOLD >> signalSendingRemoteMessage: remoteMessage raisedException: ex [
	^ MpCouldNotDeliverMessageError new
		message: remoteMessage;
		originalException: ex;
		signal
]

{ #category : 'activity' }
MpTransporterOLD >> start [
	self subclassResponsibility
]

{ #category : 'activity' }
MpTransporterOLD >> stop [
	self subclassResponsibility
]

{ #category : 'receiving' }
MpTransporterOLD >> unmarshal: anObject [ 
	^self marshaller unmarshal: anObject.
]

{ #category : 'sending' }
MpTransporterOLD >> waitResponseFor: remoteMessage onPromise: promise [
	[ promise wait: self receptionTimeoutDuration ]
		on: CcPromiseTimeout
		do: [ :ex | 
			self
				signalReceivingResponseOfRemoteMessage: remoteMessage
				raisedException: ex ]
]
