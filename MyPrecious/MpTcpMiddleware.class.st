Class {
	#name : 'MpTcpMiddleware',
	#superclass : 'MpMiddleware',
	#category : 'MyPrecious-Kernel',
	#package : 'MyPrecious',
	#tag : 'Kernel'
}

{ #category : 'lifecycle' }
MpTcpMiddleware >> isStarted [

	^self receiver isStarted
]

{ #category : 'lifecycle' }
MpTcpMiddleware >> isStopped [

	^self receiver isStopped
]

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
