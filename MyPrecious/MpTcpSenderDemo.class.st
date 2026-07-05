Class {
	#name : 'MpTcpSenderDemo',
	#superclass : 'MpTcpDemo',
	#classInstVars : [
		'remoteSmalltalk',
		'remoteTranscript',
		'receiverAddress',
		'remoteObjectClass',
		'remoteSubclass'
	],
	#category : 'MyPrecious-Demo',
	#package : 'MyPrecious',
	#tag : 'Demo'
}

{ #category : '4-remote message' }
MpTcpSenderDemo class >> browseRemoteObjectClass [

	<example>
	self remoteObjectClass browse
]

{ #category : '4-remote message' }
MpTcpSenderDemo class >> createAndBrowseSublcass [

	<example>
	remoteSubclass := (self remoteObjectClass << #RemotelyCreated package: 'Demo') install.
	remoteSubclass browse
]

{ #category : '2-createProxies' }
MpTcpSenderDemo class >> createRootProxies [

	<example>
	remoteSmalltalk := middleware proxyAtId: #Smalltalk address: self receiverAddress.
	remoteTranscript := middleware proxyAtId: #Transcript address: self receiverAddress
]

{ #category : '4-remote message' }
MpTcpSenderDemo class >> inspectRemoteInstance [

	<example>
	remoteSubclass new inspect
]

{ #category : '3-remote message Transcript' }
MpTcpSenderDemo class >> openTranscript [
	<example>
	remoteTranscript open
]

{ #category : '2-createProxies' }
MpTcpSenderDemo class >> receiverAddress [

	^ receiverAddress ifNil: [receiverAddress := MpTcpAddress port: self receiverPort]
]

{ #category : '4-remote message' }
MpTcpSenderDemo class >> remoteObjectClass [
	^ remoteObjectClass ifNil: [remoteObjectClass := remoteSmalltalk at: #Object]
]

{ #category : '3-remote message Transcript' }
MpTcpSenderDemo class >> showHelloOnTranscript [

	<example>
	remoteTranscript cr; show: 'Hello from the other side!'
]

{ #category : '3-remote message Transcript' }
MpTcpSenderDemo class >> showTimeOnTranscript [

	<example>
	remoteTranscript cr; show: Time now 
]

{ #category : '1-start' }
MpTcpSenderDemo class >> start [

	<example>
	self startMiddleware: self senderPort
]

{ #category : 'stop' }
MpTcpSenderDemo class >> stop [

	<example>
	middleware stop
]
