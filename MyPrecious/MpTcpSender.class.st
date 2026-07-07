Class {
	#name : 'MpTcpSender',
	#superclass : 'MpSender',
	#category : 'MyPrecious-Kernel',
	#package : 'MyPrecious',
	#tag : 'Kernel'
}

{ #category : 'message handling' }
MpTcpSender >> basicSend: aMessage targetId: id [

	| stream answer |
	stream := ZdcSocketStream openConnectionToHost: self address ip port: self address port.
	self serializer
		serialize: {
				aMessage.
				id }
		toStream: stream.
	stream flush.
	answer := self serializer materializeFromStream: stream.
	^ answer
]
