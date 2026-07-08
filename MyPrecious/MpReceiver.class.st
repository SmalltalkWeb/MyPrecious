"
Deserializes and unmarshalls messages before delivering them to the receiver.
Receiver is found based on provided ID.
Receiver is assumed to be previously exported with the given ID.

Response is marshalled then serialized before returning it.
"
Class {
	#name : 'MpReceiver',
	#superclass : 'MpTransporter',
	#category : 'MyPrecious-Kernel',
	#package : 'MyPrecious',
	#tag : 'Kernel'
}

{ #category : 'accessing' }
MpReceiver >> address [
	^marshaler address
]

{ #category : 'accessing' }
MpReceiver >> address: anAddress [
	marshaler address: anAddress
]

{ #category : 'accessing' }
MpReceiver >> exporter [

	^ marshaler exporter
]

{ #category : 'initialization' }
MpReceiver >> initialize [

	super initialize.
	marshaler := MpMarshaler new.
	self address: self newAddress
]

{ #category : 'message handling' }
MpReceiver >> marshalResponseClass: aResponseClass value: anObject [

	| response |
	response := aResponseClass value: anObject.
	^self marshal: response
]

{ #category : 'initialization' }
MpReceiver >> newAddress [
	self subclassResponsibility 
]

{ #category : 'accessing' }
MpReceiver >> objectAt: id [
	^self exporter objectAt: id
]

{ #category : 'accessing' }
MpReceiver >> proxyFactory [

	^ marshaler proxyFactory
]

{ #category : 'message handling' }
MpReceiver >> receive: aMarshaledMessage targetId: id [

	| rawResponse receiver unmarshaledMessage |
	^ [
		  receiver := self objectAt: id.
		  unmarshaledMessage := self unmarshal: aMarshaledMessage.
		  rawResponse := unmarshaledMessage sendTo: receiver.
		  self marshalResponseClass: MpNormalResponse value: rawResponse 
	]
		on: Exception
		do: [ :ex | self marshalResponseClass: MpExceptionResponse value: ex ]
]
