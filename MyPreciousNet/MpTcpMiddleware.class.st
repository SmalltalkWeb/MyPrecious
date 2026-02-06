Class {
	#name : 'MpTcpMiddleware',
	#superclass : 'MpMiddlewareOLD',
	#traits : 'MpTNetMiddleware',
	#classTraits : 'MpTNetMiddleware classTrait',
	#category : 'MyPreciousNet-Tcp',
	#package : 'MyPreciousNet',
	#tag : 'Tcp'
}

{ #category : 'initialization' }
MpTcpMiddleware >> addressClass [
	^MpIpFullAddress 
]

{ #category : 'initialization' }
MpTcpMiddleware >> transporterClass [
	^MpTcpConnectedTransporter
]
