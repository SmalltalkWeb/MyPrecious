Class {
	#name : 'MpTcpReceiverDemo',
	#superclass : 'MpTcpDemo',
	#category : 'MyPrecious-Demo',
	#package : 'MyPrecious',
	#tag : 'Demo'
}

{ #category : '2-export' }
MpTcpReceiverDemo class >> export [

	<example>
	middleware export: Transcript id: #Transcript.
	middleware export: Smalltalk id: #Smalltalk
]

{ #category : '1-start' }
MpTcpReceiverDemo class >> start [

	<example>
	self startMiddleware: self receiverPort
]

{ #category : 'stop' }
MpTcpReceiverDemo class >> stop [

	<example>
	middleware stop
]
