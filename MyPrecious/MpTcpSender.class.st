Class {
	#name : 'MpTcpSender',
	#superclass : 'MpSender',
	#category : 'MyPrecious-Kernel',
	#package : 'MyPrecious',
	#tag : 'Kernel'
}

{ #category : 'message handling' }
MpTcpSender >> basicSend: aMessage targetId: id [

	| stream |
	stream := self openConnectionStream.
	self serializer
		serialize: {
				aMessage.
				id }
		toStream: stream.
	stream flush.
	[^self serializer materializeFromStream: stream ]
		on: ConnectionTimedOut
		do: [ :ex | MpResponseTimedOutError signal ].

]

{ #category : 'message handling' }
MpTcpSender >> openConnectionStream [

	^ [ZdcSocketStream openConnectionToHost: self address ip port: self address port timeout: self timeoutSeconds] on: Error do: [ : err | MpConnectTimeoutError signal: err messageText ]
]

{ #category : 'accessing' }
MpTcpSender >> timeoutSeconds [
	^1
]
