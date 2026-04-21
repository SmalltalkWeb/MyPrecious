"
Deserializes and unmarshalls messages before delivering them to the receiver.
Receiver is found based on provided ID.
Receiver is assumed to be previously exported with the given ID.

Response is marshalled then serialized before returning it.
"
Class {
	#name : 'MpLocalDispatcher',
	#superclass : 'MpDispatcher',
	#category : 'MyPrecious-Kernel',
	#package : 'MyPrecious',
	#tag : 'Kernel'
}

{ #category : 'accessing' }
MpLocalDispatcher >> address [
	^marshaler address
]

{ #category : 'accessing' }
MpLocalDispatcher >> address: anAddress [
	marshaler address: anAddress
]

{ #category : 'message handling' }
MpLocalDispatcher >> dispatch: marshaledMessage targetId: id [

	| rawResponse receiver unmarshaledMessage |
	receiver := self objectAt: id.
	unmarshaledMessage := self unmarshal: marshaledMessage.
	rawResponse := unmarshaledMessage sendTo: receiver.
	^ self marshal: rawResponse
]

{ #category : 'accessing' }
MpLocalDispatcher >> exporter [

	^ marshaler exporter
]

{ #category : 'initialization' }
MpLocalDispatcher >> initialize [ 
	super initialize.
	marshaler := MpMarshaler new.

]

{ #category : 'accessing' }
MpLocalDispatcher >> objectAt: id [
	^self exporter objectAt: id
]

{ #category : 'accessing' }
MpLocalDispatcher >> proxyFactory [

	^ marshaler proxyFactory
]
