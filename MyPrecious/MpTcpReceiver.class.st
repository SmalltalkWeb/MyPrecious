Class {
	#name : 'MpTcpReceiver',
	#superclass : 'MpReceiver',
	#instVars : [
		'server'
	],
	#category : 'MyPrecious-Kernel',
	#package : 'MyPrecious',
	#tag : 'Kernel'
}

{ #category : 'initialization' }
MpTcpReceiver >> initialize [

	super initialize.
	server := NeTcpServer port: self port.
	server withCommunicationStreamDo: [ :stream | self receiveMessageFromStream: stream ]
]

{ #category : 'initialization' }
MpTcpReceiver >> newAddress [

	| freePort localIp |
	freePort := NeTcpUsedPortsTracker freePortAtRandom.
	localIp := NeIpV4Address local.
	^MpTcpAddress ip: localIp port: freePort
]

{ #category : 'accessing' }
MpTcpReceiver >> port [

	^ self address port
]

{ #category : 'accessing' }
MpTcpReceiver >> port: newPort [

	self address port: newPort.
	self server port: newPort
]

{ #category : 'initialization' }
MpTcpReceiver >> receiveMessageFromStream: stream [

	| remoteMessage message id answer |
	remoteMessage := self serializer materializeFromStream: stream.
	message := remoteMessage first.
	id := remoteMessage last.
	answer := self receive: message targetId: id.
	self serializer serialize: answer toStream: stream.
	stream flush
]

{ #category : 'accessing' }
MpTcpReceiver >> server [

	^ server
]

{ #category : 'lifecycle' }
MpTcpReceiver >> start [
	self server start
]

{ #category : 'lifecycle' }
MpTcpReceiver >> stop [

	self server stop
]
