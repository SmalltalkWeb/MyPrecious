Class {
	#name : 'MpTcpMiddlewareOLD',
	#superclass : 'MpMiddlewareOLD',
	#traits : 'MpTNetMiddleware',
	#classTraits : 'MpTNetMiddleware classTrait',
	#category : 'MyPreciousNet-Tcp',
	#package : 'MyPreciousNet',
	#tag : 'Tcp'
}

{ #category : 'initialization' }
MpTcpMiddlewareOLD >> addressClass [
	^MpIpFullAddress 
]

{ #category : 'initialization' }
MpTcpMiddlewareOLD >> transporterClass [
	^MpTcpConnectedTransporter
]
