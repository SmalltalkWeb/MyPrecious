Class {
	#name : 'MpTcpSender',
	#superclass : 'MpSender',
	#category : 'MyPrecious-Kernel',
	#package : 'MyPrecious',
	#tag : 'Kernel'
}

{ #category : 'message handling' }
MpTcpSender >> dispatch: aMessage targetId: id [

	| stream answer | 
	stream := ZdcSocketStream openConnectionToHost: self address ip port: self address port.
	MpSerializer serialize: {aMessage. id} toStream: stream.
	stream flush.
	answer := MpSerializer materializeFromStream: stream.
	^answer
]
