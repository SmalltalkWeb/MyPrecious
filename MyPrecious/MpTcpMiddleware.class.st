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

{ #category : 'accessing' }
MpTcpMiddleware >> port [

	^ self receiver port
]

{ #category : 'accessing' }
MpTcpMiddleware >> port: newPort [

	self receiver port: newPort
]

{ #category : 'initialization' }
MpTcpMiddleware >> receiverClass [

	^MpTcpReceiver 
]

{ #category : 'lifecycle' }
MpTcpMiddleware >> start [
	self receiver start
]

{ #category : 'lifecycle' }
MpTcpMiddleware >> stop [

	self receiver stop
]
