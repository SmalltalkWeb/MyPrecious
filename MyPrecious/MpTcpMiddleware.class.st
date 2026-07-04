Class {
	#name : 'MpTcpMiddleware',
	#superclass : 'MpMiddleware',
	#instVars : [
		'server'
	],
	#category : 'MyPrecious-Kernel',
	#package : 'MyPrecious',
	#tag : 'Kernel'
}

{ #category : 'initialization' }
MpTcpMiddleware >> dispatchMessageFromStream: stream [

	| remoteMessage message id answer |
	remoteMessage := MpSerializer materializeFromStream: stream.
	message := remoteMessage first.
	id := remoteMessage last.
	answer := localDispatcher dispatch: message targetId: id.
	MpSerializer serialize: answer toStream: stream.
	stream flush
]

{ #category : 'initialization' }
MpTcpMiddleware >> initialize [ 
	super initialize.
	server := NeTcpServer port: self address port.
	server withCommunicationStreamDo: [ : stream | self dispatchMessageFromStream: stream ]
]

{ #category : 'initialization' }
MpTcpMiddleware >> newAddress [

	| freePort localIp |
	freePort := NeTcpUsedPortsTracker freePortAtRandom.
	localIp := NeIpV4Address local.
	^MpTcpAddress ip: localIp port: freePort
]

{ #category : 'lifecycle' }
MpTcpMiddleware >> start [
	server start
]

{ #category : 'lifecycle' }
MpTcpMiddleware >> stop [
	server stop
]
