Class {
	#name : 'MpTcpAddress',
	#superclass : 'MpIpAddress',
	#category : 'MyPrecious-Kernel',
	#package : 'MyPrecious',
	#tag : 'Kernel'
}

{ #category : 'converting' }
MpTcpAddress >> gatewayClass [

	^MpTcpGateway 
]
