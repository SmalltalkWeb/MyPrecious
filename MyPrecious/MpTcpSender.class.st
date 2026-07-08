Class {
	#name : 'MpTcpSender',
	#superclass : 'MpSender',
	#category : 'MyPrecious-Kernel',
	#package : 'MyPrecious',
	#tag : 'Kernel'
}

{ #category : 'message handling' }
MpTcpSender >> basicSend: aMessage targetId: id [

	| stream remoteMessage |
	stream := self openConnectionStream.
	remoteMessage := {
		                 aMessage.
		                 id }.
	self sendRemoteMessage: remoteMessage to: stream.
	^ self receiveRemoteResponseFrom: stream
]

{ #category : 'message handling' }
MpTcpSender >> openConnectionStream [

	^ [ZdcSocketStream 
			openConnectionToHost: self address ip 
			port: self address port timeout: self timeoutSeconds] 
		on: ConnectionTimedOut 
		do: [ : err | 
			MpConnectTimeoutError signal: err messageText ]
]

{ #category : 'message handling' }
MpTcpSender >> receiveRemoteResponseFrom: stream [

	^ [ self serializer materializeFromStream: stream ]
		  on: ConnectionTimedOut
		  do: [ :ex | MpResponseTimedOutError signal ]
]

{ #category : 'message handling' }
MpTcpSender >> sendRemoteMessage: remoteMessage to: stream [

	self serializer serialize: remoteMessage toStream: stream.
	stream flush
]

{ #category : 'accessing' }
MpTcpSender >> timeoutSeconds [
	^1
]
