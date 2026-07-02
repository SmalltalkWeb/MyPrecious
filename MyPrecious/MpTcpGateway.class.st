Class {
	#name : 'MpTcpGateway',
	#superclass : 'MpGateway',
	#category : 'MyPrecious-Kernel',
	#package : 'MyPrecious',
	#tag : 'Kernel'
}

{ #category : 'message handling' }
MpTcpGateway >> dispatch: aMessage targetId: id [

	| stream answer | 
	stream := ZdcSocketStream openConnectionToHost: self address ip port: self address port.
	MpSerializer serialize: {aMessage. id} toStream: stream.
	answer := MpSerializer materializeFromStream: stream.
	stream close.
	^answer 
]
